#!/bin/bash
#
# Carries out a full mysqldump, calls percona-xtrabackup and then
# copies the sql dump, the percona backup and your mysql bin logs
# to S3 using s3cmd http://s3tools.org/s3cmd
#
# IMPORTANT! This is an older restore script, see run-xtrabackup.sh for a newer one.
#
# TODO: extract out the S3 backup stuff to make it optional, and so
# other s3 programs can replace the s3cmd call.
# TODO: the if [ $? == 0 ] alert blocks should be a function
# TODO: make the if [ $? == 0 ] if [ $? != 0 ] more consistent - test
#       for failure first in all cases

# Put me in cron.daily, cron.hourly or cron.d for your own custom schedule

# Running daily? You'll keep 3 daily backups
# Running hourly? You'll keep 3 hourly backups
NUM_BACKUPS_TO_KEEP=3

# Who wants to know when the backup failed
EMAIL=you@example.com

# Your mysql bucket, where the backups and dumps will get
# copied to
S3_BUCKET=logs.example.com/mysql

# Where you keep your backups
BACKUPDIR=/ebs/mysql/backups

# The folder in $BACKUPDIR where you'll keep your mysqldumps
DUMPS=dumps
DUMPDIR=$BACKUPDIR/$DUMPS

# How you'll do a mysqldump
# the --master-data=2 means we're able to do point-in-time recovery
# using the binlogs that we'll also backup
MYSQLDUMP=/usr/bin/mysqldump
MYSQLDUMP_OPTIONS="-u root -h 127.0.0.1 --all-databases --single-transaction --default-character-set=latin1 --skip-set-charset --master-data=2"

# Where your mysql binary logs live
MYSQL_BIN_LOG_DIR=/var/mysql/lib/mysql

# path to innobackupex
XTRABACKUP=/usr/bin/innobackupex

# Add any other files you never want to remove
NEVER_DELETE="lost\+found|\.|\..|$DUMPS"

# The mysql user able to access all the databases
OPTIONS="--user=root"

# Shouldn't need to change these...
APPLY_LOG_OPTIONS="--apply-log"
BACKUP="$XTRABACKUP $OPTIONS $BACKUPDIR"
APPLY_BINARY_LOG="$XTRABACKUP $OPTIONS $APPLY_LOG_OPTIONS"

# The dumps and percona backups we'll be removing
PREV=$(ls $BACKUPDIR | sort | grep -v "$(ls $BACKUPDIR | tail -n $NUM_BACKUPS_TO_KEEP)" | grep -v $DUMPDIR)
PREVDUMP=$(ls $DUMPDIR | sort | grep -v "$(ls $DUMPDIR | tail -n $NUM_DUMPS_TO_KEEP)")

# do a mysqldump
$DUMP | /bin/gzip -9 > $DUMPDIR/$(date +%Y%m%d_%H:%M).sql.gz

# we got a full dump
if [ $? == 0 ]; then
  # only remove if $PREVDUMP is set
  if [ -n "$PREVDUMP" ]; then
    # remove dumps you don't want to keep
    cd $DUMPDIR && rm -rf $PREVDUMP
    if [ $? != 0 ]; then
      echo "Looks like there was a problem deleting $PREVDUMP in $DUMPDIR" | mail $EMAIL -s "Couldn't remove $PREVDUMP in $DUMPDIR"
    fi
  fi
else
  echo "Couldn't do the mysqldump to $DUMPDIR" | mail $EMAIL -s "mysqldump to $DUMPDIR failed"
fi

# run a backup
$BACKUP

if [ $? == 0 ]; then

  # we got a backup, now we need to apply the binary logs
  MOST_RECENT=$(ls $BACKUPDIR | grep -v $DUMPS | sort | tail -n1)

  # ensure the generated cnf file used by xtrabackup has innodb_file_per_table set
  # otherwise using the --export switch will fail
  echo "innodb_file_per_table" >> $BACKUPDIR/$MOST_RECENT/backup-my.cnf
  $APPLY_BINARY_LOG $BACKUPDIR/$MOST_RECENT

  # binary logs were applied OK, so we have a brand new percona backup
  # so remove older backups we don't need
  if [ $? == 0 ]; then
    # only remove if $PREV is set
    if [ -n "$PREV" ]; then
      # remove backups you don't want to keep
      cd $BACKUPDIR && rm -rf $PREV
      if [ $? != 0 ]; then
        echo "Looks like there was a problem deleting $PREV in $BACKUPDIR"
      fi
    fi

    # Sync the percona backups to S3
    # ionice the s3 sync, so we don't block the mysql server
    /usr/bin/ionice -c 2 -n 6 /usr/bin/s3cmd sync --delete-removed $BACKUPDIR/* s3://$S3_BUCKET/backups/

    # alert if the s3 sync failed
    if [ $? != 0 ]; then
      echo "Looks like there was a problem with the mysql backup syncing to S3" | mail $EMAIL -s "Couldn't copy mysql backup to S3"
    else
      # now back up the latest binlogs too, we'll need these if we want to do a point-in-time restore (which the mysqldump is prepped for)
      /usr/bin/ionice -c 2 -n 6 /usr/bin/s3cmd sync --delete-removed $MYSQL_BIN_LOG_DIR/mysql-bin* s3://$S3_BUCKET/binlogs/
      if [ $? != 0 ]; then
        echo "Couldn't sync the SQL binlogs to S3 - you won't be able do a point-in-time recovery" | mail $EMAIL -s "Mysql binlogs not copied to S3"
      fi
    fi

  else
    echo "Couldn't apply the binary logs to the backup $BACKUPDIR/$MOST_RECENT" | mail $EMAIL -s "Mysql binary log didn't get applied to backup"
  fi

else
  # problem with initial backup :(
  echo "Couldn't do a mysql backup" | mail $ALERT -s "Mysql backup failed"
fi
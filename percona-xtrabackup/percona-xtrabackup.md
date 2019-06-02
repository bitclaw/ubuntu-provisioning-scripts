## Installing and using Percona XtraBackup
##### For MySQL/MariaDB database servers on Ubuntu.

### Set-up and Install
#### Add Percona to your repository.

###### Backup your sources.
`sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup`

###### Edit your sources.
`sudo nano /etc/apt/sources.list`

###### Append Percona's sources to the end of file.
If needed, change `trusty` *(Ubuntu 14.04 LTS)* to the repo name of your Ubuntu install. Ubuntu 12.04 would be `precise`.
````
# Percona
deb http://repo.percona.com/apt trusty main
deb-src http://repo.percona.com/apt trusty main
```
###### Add the repository's key to your collection.
`sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A`
> ```
gpg: Total number processed: 1
gpg:               imported: 1
```

###### Update your packages list.
`sudo apt-get update`

###### Install XtraBackup.
`sudo apt-get install percona-xtrabackup`

###### Check that everything installed okay.
`xtrabackup --version`
> `xtrabackup version 2.2.9 based on MySQL server 5.6.22 Linux (x86_64) (revision id: )`

`innobackupex --version`
> `InnoDB Backup Utility v1.5.1-xtrabackup; Copyright 2003, 2009 Innobase Oy`

###### Create a backup staging directory.
`sudo mkdir /var/backups/mysql/`

### Backup database
###### Create a daily, weekly, monthly and quarterly set of backups.
* `innobackupex` is the backup shell script.
* `--compact` saves space but takes longer to compress.
* `--no-timestamp` removes the default behavior of appending the current time to the backup directory.
* `--user` database user account to grant XtraBackup access.
* `--passsword` database user account password.

```
sudo innobackupex --no-timestamp --user=(user) --password=(password) /var/backups/mysql/daily
```
> ```
innobackupex: Backup created in directory '/var/backups/mysql/daily'
innobackupex: Connection to database server closed
innobackupex: completed OK!
```

```
sudo innobackupex --compact --no-timestamp --user=(user) --password=(password) /var/backups/mysql/weekly
sudo innobackupex --compact --no-timestamp --user=(user) --password=(password) /var/backups/mysql/monthly
sudo innobackupex --compact --no-timestamp --user=(user) --password=(password) /var/backups/mysql/quarterly
```

### Create backups CRON jobs aka time-based job schedulers.
`sudo crontab -e`

Append at the bottom of the file after the following.
> ```
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command
```

```
# Percona XtraBackup for database backup
@daily mv /var/backups/mysql/daily /var/backups/mysql/daily~ && innobackupex --no-timestamp --user=(user) --password=(password) /var/backups/mysql/daily && rm -fR /var/backups/mysql/mysql/daily~
@weekly mv /var/backups/mysql/weekly /var/backups/mysql/weekly~ && innobackupex --compact --no-timestamp --user=(user) --password=(password) /var/backups/mysql/weekly && rm -fR /var/backups/mysql/mysql/weekly~
@monthly mv /var/backups/mysql/monthly /var/backups/mysql/monthly~ && innobackupex --compact --no-timestamp --user=(user) --password=(password) /var/backups/mysql/monthly && rm -fR /var/backups/mysql/mysql/monthly~
0 0 1 1,4,7,10 * mv /var/backups/mysql/quarterly /var/backups/mysql/quarterly~ && innobackupex --compact --no-timestamp --user=(user) --password=(password) /var/backups/mysql/quarterly && rm -fR /var/backups/mysql/mysql/quarterly~
```
The job listed last runs on the first day of the month at midnight on Jan, Apr, Jul and Oct. The other jobs that use @special strings also run at midnight. If you wanted to, you could change the daily to run at 2:30am.
```
30 2 * * * mv /var/backups/mysql/daily /var/backups/mysql/daily~ && innobackupex --no-timestamp --user=(user) --password=(password) /var/backups/mysql/daily && rm -fR /var/backups/mysql/mysql/daily~
```
Or the weekly job to run every Monday evening at 11pm.
```
0 23 * * 1 mv /var/backups/mysql/weekly /var/backups/mysql/weekly~ && innobackupex --no-timestamp --user=(user) --password=(password) /var/backups/mysql/weekly && rm -fR /var/backups/mysql/mysql/weekly~
```
['Further reading, Cron Howto'](https://help.ubuntu.com/community/CronHowto)

### Restore a backup to the database
First we must prepare the backup for restoration. This completes any uncommitted transactions and pending operations.
`innobackupex --apply-log /var/backups/mysql/daily`
The last line of the `--apply-log` returned output should say OK!
> ` innobackupex: completed OK!`

Then we restore the backup but to do this the database's *datadir* `/var/lib/mysql/` needs to be empty for the restoration to be successful. So we shut down MySQL and move its current data directory into a backup location.

###### Stop MySQL
`sudo service mysql stop`
> `mysql stop/waiting`

###### Duplicate then delete existing data
`sudo cp -aR /var/lib/mysql/ /var/lib/mysql~/`

###### Double check that everything copied okay (no output is good)
`sudo diff -qr /var/lib/mysql/ /var/lib/mysql~/`
> ` `

###### Delete the MySQL data and check that its directory is empty
```
sudo rm -R /var/lib/mysql/*
ll /var/lib/mysql/
```
###### Restore the backed up data to database data
`innobackupex --copy-back /var/backups/mysql/daily`
> `innobackupex: completed OK!`

###### Grant MySQL ownership permission to the data.
`sudo chown -R mysql:mysql /var/lib/mysql`

###### Restart MySQL
`sudo service mysql start`
> `mysql start/running, process`

Congratulations! If there are any issues and MySQL does not start you can can check its log file.
```
tail /var/log/mysql/error.log
```

And if worse comes to worse, restore the pre-deleted data.
```
sudo rm -R /var/lib/mysql
sudo mv /var/lib/mysql~ /var/lib/mysql
sudo service mysql start
```

### Learn more
Percona XtraBackup offers much more functionality than what is listed here, including encryption, parallel and threading and selective database backups. You can download its [User's Manual](http://form.percona.com/Percona-XtraBackup-22-Series-Manual.html) (requires supplying an e-mail address to access) to learn more about this excellent tool.
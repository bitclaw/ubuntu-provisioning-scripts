#!/usr/bin/env bash

# See https://jira.percona.com/browse/PXB-1707
# See https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html
xtrabackup --backup --user=root --password=root --host=127.0.0.1 --port=3360 --stream=xbstream --target-dir=/var/lib/mysql/ | split -d --bytes=4000MB - /home/my_database_backup.xbstream
mv /home/my_database_backup.xbstream00 /docker-entrypoint-initdb.d/
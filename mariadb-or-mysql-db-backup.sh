#!/bin/bash
backup_dir="/root/mysql_Backup/"                   #Create the directory
db_user="dbusername"                               #Database user name
db_passwd="dbpawword"                              #Database user password
db_name="dbname"                                   #Database name
db_backup_name="dbname-$(date +"%d-%b-%Y-%R").sql" #Database name
log="/root/mysql_Backup/backup.log"


#Backup
mysqldump -u $db_user -p"${db_passwd}" "${db_name}" > "${backup_dir}""$db_backup_name"

#Log
if test $? = 0
then
    echo "Database Successfully Uploaded At $(date +"%d-%b-%Y-%R")
        File Name $db_backup_name" >> $log
else
    echo "Error in database Upload At $(date +"%d-%b-%Y-%R")" >> $log
fi

#Delete files older than 30 days
find $backup_dir/* -name *.sql -mtime +30 -exec rm {} \;

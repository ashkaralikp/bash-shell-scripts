#!/bin/bash
#----------------------------------------
# OPTIONS
#----------------------------------------
DAYS_TO_KEEP=15    # 0 to keep forever
WWW_PATH='/var/www/html/'
BACKUP_PATH='/backups/www/'
FILENAME=webapp-$(date +"%d-%b-%Y-%I-%M-%S")
#----------------------------------------

# Create the backup folder
if [ ! -d $BACKUP_PATH ]; then
  mkdir -p $BACKUP_PATH
fi

tar -cvpzf ${BACKUP_PATH}/${FILENAME}.tar.gz $WWW_PATH

# Delete old backups
if [ "$DAYS_TO_KEEP" -gt 0 ] ; then
  echo "Deleting backups older than $DAYS_TO_KEEP days"
  find $BACKUP_PATH/* -mtime +$DAYS_TO_KEEP -exec rm {} \;
fi

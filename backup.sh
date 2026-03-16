#BACKUP SCRIPT
set -e
SOURCE_DIR="/var/www/myapp"
trap 'echo "$(date) - Backup failed at line $LINENO" >> /var/log/myapp-backup.log' ERR

# Create a timestamp for the backup file
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

#Create backup directory if it doesn't exist
if [ ! -d "/backup/myapp" ]; then
  mkdir /backup/myapp
fi
BACKUP_FILE="/backup/myapp/backup_${TIMESTAMP}.tar.gz"

tar -zcvf $BACKUP_FILE $SOURCE_DIR >> /backup/myapp/backup_${TIMESTAMP}.log 2>&1
if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_FILE" >> /backup/myapp/backup_${TIMESTAMP}.log
else
  echo "Backup failed: $BACKUP_FILE" >> /backup/myapp/backup_${TIMESTAMP}.log
fi

#Log rotation logic
LOG_RETENTION_DAYS=7
NUM_BACKUPS=$(ls -1 /backup/myapp | grep -ci "^backup_")
NUM_BACKUPS_TO_DELETE=$(($NUM_BACKUPS - $LOG_RETENTION_DAYS))
if [ $NUM_BACKUPS_TO_DELETE -gt 0 ]; then
    OLD_BACKUPS=$(ls -1t /backup/myapp/backup_*.tar.gz | tail -n $NUM_BACKUPS_TO_DELETE)
    for BACKUP in $OLD_BACKUPS; 
    do
        rm -f $BACKUP
    done
fi
echo "Backup process completed at $(date)" >> /var/log/myapp-backup.log
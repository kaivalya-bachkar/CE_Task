#####################################################################
# Script Name : remote_sync.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : Script that periodically syncs a local directory with a remote server using 'rsync' and 'cron'.
####################################################################

#!/bin/bash

DIRECTORY=$1
REMOTE_USER=$2
REMOTE_IP=$3
REMOTE_PATH=$4

if [ "$#" -ne 4 ] || [ ! -d "$DIRECTORY" ]; then
    echo "Usage: $0 <directory-path-to-backup> <Remote_User> <Remote_IP> <Remote_Path> "
    [ ! -d "$DIRECTORY" ] && echo "Error: Backup Directory not found!"
    exit 1
fi

LOG_FILE="/var/log/rsync_backup.log"

rsync -avz --delete "$DIRECTORY/" $REMOTE_USER@$REMOTE_IP:$REMOTE_PATH >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "$(date): Sync successful from $DIRECTORY to $REMOTE_USER:$REMOTE_PATH" >> "$LOG_FILE"
else
    echo "$(date): Sync failed!" >> "$LOG_FILE"
fi

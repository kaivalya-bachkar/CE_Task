#####################################################################
# Script Name : old_log_archive.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that compresses and archives log files older than a certain number of days.
####################################################################

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path/to/the/log_dir> <day>"
    echo "Example: $0 /var/log /var/log/archive "
    exit 1
fi

log_dir=$1
day=$2
ARCHIVE_DIR="$log_dir/archive"

if [ ! -d "$log_dir" ]; then
    echo "Error: Log directory '$LOG_DIR' not found!"
    exit 1
fi

mkdir -p "$ARCHIVE_DIR"

echo "---------------------------------------------"
echo "Compressing and archiving logs older than $day days..."
echo "Source: $LOG_DIR"
echo "Archive: $ARCHIVE_DIR"
echo "---------------------------------------------"

tar -czf "$ARCHIVE_DIR/logs_$(date).tar.gz" $(find  "$log_dir" -type f -name "*.log" -mtime +$day)

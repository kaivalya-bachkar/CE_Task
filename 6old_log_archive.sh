#script that compresses and archives log files older than a certain number of days
#find . -type f -mtime +28 -print0 | tar -czvf backup.tar.gz --null -T 

#!/bin/bash

read -p "Enter the path of log file :" log_dir
ARCHIVE_DIR="$log_dir/archive"
read -p "Enter the Days to check the older than a certain number :" day

mkdir -p "$ARCHIVE_DIR"

tar -czf "$ARCHIVE_DIR/logs_$(date).tar.gz" $(find  "$log_dir" -type f -name "*.log" -mtime +$day)

#find "$log-dir" -type f -name "*.log" -mtime +$day -exec rm -f {} \;

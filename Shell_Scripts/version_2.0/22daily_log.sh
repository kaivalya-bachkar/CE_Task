#####################################################################
# Script Name : daily_log.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that sends a daily summary of system logs via email.
####################################################################

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 Recipient_Email /path/to/lof_file "
    exit 1
fi

RECIPIENT_EMAIL=$1
LOG_FILE=$2

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: log_file not found!"
    exit 1
fi

date=$(date +'%b %d')
SUBJECT="Daily System Log Summary - $(hostname) - $date"

LOG_SUMMARY=$(sudo cat "$LOG_FILE" | grep "$date") > /dev/null

if [ -n "$LOG_SUMMARY" ]; then
    echo -e "Daily system log summary for $(hostname):\n\n${LOG_SUMMARY}" | mail -s "$SUBJECT" "$RECIPIENT_EMAIL"
else
    echo "No significant log entries found in the last lines of $LOG_FILE."
fi


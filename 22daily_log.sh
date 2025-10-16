#!/bin/bash

set -x
read -p "Enter the Recipient Mail: " RECIPIENT_EMAIL
read -p "Enter the Log File Path :" LOG_FILE

date=$(date +'%b %d')
SUBJECT="Daily System Log Summary - $(hostname) - $date"

LOG_SUMMARY=$(sudo cat "$LOG_FILE" | grep "$date") > /dev/null


if [ -n "$LOG_SUMMARY" ]; then
    echo -e "Daily system log summary for $(hostname):\n\n${LOG_SUMMARY}" | mail -s "$SUBJECT" "$RECIPIENT_EMAIL"
else
    echo "No significant log entries found in the last lines of $LOG_FILE."
fi

exit 0
set +x

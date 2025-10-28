#####################################################################
# Script Name : daily_log.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that sends a daily summary of system logs via email.
####################################################################

#!/bin/bash

LOG_FILE=$1

function MAIL () {
echo -e "Hello All
                This is system generated email, do not reply to this email.
                Daily system log summary for $(hostname):\n\n${LOG_SUMMARY}
                Kindly take necessary action ASAP to avoid future inconvenience. 
                Server Name : - `hostname`
                Server IP :- `ifconfig | grep inet | head -n 1 | awk '{print $2}'` 

Thank & Regards

Team CloudEthix"
}
if  [ "$#" -ne 1 ] || [ ! -f "$LOG_FILE" ]; then
    [ "$#" -ne 1 ] && echo "Usage: $0 /path/to/lof_file "
    [ ! -f "$LOG_FILE" ] && echo "Error: log_file not found!"
    exit 1
fi

date=$(date +'%b %d')

LOG_SUMMARY=$(sudo cat "$LOG_FILE" | grep "$date") > /dev/null

if [ -n "$LOG_SUMMARY" ]; then
    echo -e "Daily system log summary for $(hostname):\n\n${LOG_SUMMARY}"
    MAIL
else
    echo "No significant log entries found in the last lines of $LOG_FILE."
fi

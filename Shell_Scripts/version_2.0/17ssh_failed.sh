#####################################################################
# Script Name : ssh_failed.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that checks for and reports any failed SSH login attempts on a Linux server.
####################################################################

#!/bin/bash

if [ -f /var/log/auth.log ]; then
    LOG_FILE="/var/log/auth.log"
elif [ -f /var/log/secure ]; then
    LOG_FILE="/var/log/secure"
else
    echo "Error: No authentication log file found!"
    exit 1
fi

echo "Checking for the Failed SSH Login Attempts on $(date):"

FAILED_LOGINS=$(grep "Failed password" "$LOG_FILE" | awk '{print $(NF-3)}' | sort | uniq -c)

if [ -z "$FAILED_LOGINS" ]; then
    echo " No failed SSH login attempts found."
    exit 0
fi

echo "Failed SSH Login Attempts:"
echo "$FAILED_LOGINS"


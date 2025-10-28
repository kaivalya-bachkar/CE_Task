#####################################################################
# Script Name : du_user.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that calculates the total disk space used by a specified user and outputs the result.
####################################################################

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 Please Enter the Username"
    exit 1
fi

USERNAME=$1

#total_usage=$(sudo du -shc /home/"$username" | grep total | awk '{print $1}')
#echo "Total disk space used by user '$username': $total_usage"

HOMEDIR=$(eval echo "~$USER")

if id "$USERNAME" &>/dev/null; then
    if [ -d "$HOMEDIR" ]; then
        echo "Calculating disk usage for user: $USERNAME"
        du -sh /home/"$USERNAME"
    else
        echo "Home directory for user '$USERNAME' not found."
        exit 1
    fi
else
    echo "User '$USERNAME' does not exist."
    exit 1
fi

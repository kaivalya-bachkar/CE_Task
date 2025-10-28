#####################################################################
# Script Name : du_user.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that calculates the total disk space used by a specified user and outputs the result.
####################################################################

#!/bin/bash

USERNAME=$1

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 Please Enter the Username"
    exit 1
fi

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

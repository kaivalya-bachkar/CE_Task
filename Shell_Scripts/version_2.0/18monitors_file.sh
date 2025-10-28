#####################################################################
# Script Name : monitors_file.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that monitors a specified file for changes and executes a specific action when the file is modified.
####################################################################

#/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <File-path>"
    exit 1
fi

FILE=$1

if [ ! -f "$FILE" ]; then
    echo "File '$FILE' does not exist."
    exit 1
fi

echo "Monitoring changes in '$FILE'"

stat -c %Y "$FILE" | xargs -I{} date -d @{}

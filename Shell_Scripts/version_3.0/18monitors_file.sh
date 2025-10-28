#####################################################################
# Script Name : monitors_file.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that monitors a specified file for changes and executes a specific action when the file is modified.
####################################################################

#/bin/bash

FILE=$1

if  [ "$#" -ne 1 ] || [ ! -f "$FILE" ]; then
    [ "$#" -ne 1 ] && echo "Usage: $0 <File-path>"
    [ ! -f "$FILE" ] && echo "File '$FILE' does not exist."
    exit 1
fi

echo "Monitoring changes in '$FILE'"

stat -c %Y "$FILE" | xargs -I{} date -d @{}

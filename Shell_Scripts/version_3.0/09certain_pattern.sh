#####################################################################
# Script Name : certain_pattern.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that scans a directory for files matching a certain pattern and deletes them.
####################################################################

#!/bin/bash

DIRECTORY=$1
PATTERN=$2

if [ "$#" -ne 2 ] || [ ! -d "$DIRECTORY" ]; then
    echo "Usage: $0 </path/to/directory> <Pattern>"
    [ ! -d "$DIRECTORY" ] && echo "Error: Directory not found!"
    exit 1
fi

MATCHING_FILES=$(find "$DIRECTORY" -type f -name "*$PATTERN*" 2>/dev/null)

if [ -z "$MATCHING_FILES" ]; then
    echo "No files found matching pattern '$PATTERN'."
    exit 0
fi

echo "The following files will be deleted:"
echo "$MATCHING_FILES"
echo

read -rp "Are you sure you want to delete these files? (y/n): " CONFIRM
if [ "$CONFIRM" != [yY] ]; then
    echo "Deletion cancelled by user."
    exit 0
fi

find "$DIRECTORY" -type f -name "*$PATTERN*" -delete 2>/dev/null

echo "Deletion completed successfully."

#####################################################################
# Script Name : certain_pattern.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that scans a directory for files matching a certain pattern and deletes them.
####################################################################

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 </path/to/directory> <Pattern>"
    exit 1
fi

DIRECTORY=$1
PATTERN=$2

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory not found!"
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
if [[ "$CONFIRM" != [yY] ]]; then
    echo "Deletion cancelled by user."
    exit 0
fi

# Delete files
find "$DIRECTORY" -type f -name "*$PATTERN*" -delete 2>/dev/null

echo "Deletion completed successfully."

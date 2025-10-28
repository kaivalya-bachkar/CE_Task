#####################################################################
# Script Name : find_replace.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that performs a search and replace operation on multiple files in a directory.
####################################################################

#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 /path/to/directory \"search_text\" \"replace_text\""
    exit 1
fi

DIRECTORY=$1
SEARCH=$2
REPLACE=$3

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory not found!"
    exit 1
fi

for FILE in "$DIRECTORY"/*; do
    if [ -f "$FILE" ]; then
        sed -i "s/${SEARCH}/${REPLACE}/g" "$FILE"
        echo "Updated $FILE"
    fi
done

echo "Search and replace completed."


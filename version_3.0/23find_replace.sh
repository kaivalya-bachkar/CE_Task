#####################################################################
# Script Name : find_replace.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that performs a search and replace operation on multiple files in a directory.
####################################################################

#!/bin/bash

DIRECTORY=$1
SEARCH=$2
REPLACE=$3

if  [ "$#" -ne 3 ] || [ ! -d "$DIRECTORY" ]; then
    [ "$#" -ne 3 ] || echo "Usage: $0 /path/to/directory \"search_text\" \"replace_text\""
    [ ! -d "$DIRECTORY" ] && echo "Error: Directory not found!"
    exit 1
fi

for FILE in "$DIRECTORY"/*; do
    if [ -f "$FILE" ]; then
        sed -i "s/${SEARCH}/${REPLACE}/g" "$FILE"
        echo "Updated $FILE"
    fi
done

echo "Search and replace completed."

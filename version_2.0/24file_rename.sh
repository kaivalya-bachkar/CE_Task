#####################################################################
# Script Name : find_rename.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that renames a large number of files based on a specified pattern or naming convention.
####################################################################

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /path/to/directory Name-to-change"
    exit 1
fi

DIR=$1
NEWNAME=$2

COUNT=1

if [ ! -d "$DIR" ]; then
    echo "Error: Directory not found!"
    exit 1
fi

for FILE in "$DIR"/*; do
    if [ -f "$FILE" ]; then
        EXT="${FILE##*.}"
	mv "$FILE" "$DIR/$NEWNAME$COUNT.$EXT"
        echo "Renamed: $(basename "$FILE") → $NEWNAME"
        ((COUNT++))
    fi
done

if [ "$COUNT" -gt 1 ]; then
    echo "All files renamed successfully. Total renamed: $((COUNT - 1))"
else
    echo "Error: No files were renamed."
fi

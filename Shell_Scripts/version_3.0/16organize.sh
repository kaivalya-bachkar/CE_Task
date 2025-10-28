#####################################################################
# Script Name : organize.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that automatically organizes files in a directory based on their file types
####################################################################

#!/bin/bash

DIRECTORY=$1

if  [ "$#" -ne 1 ] || [ ! -d "$DIRECTORY" ]; then
    echo "Usage: $0 </path/to/directory>"
    [ ! -d "$DIRECTORY" ] && echo "Error: Directory not found!"
    exit 1
fi

cd $DIRECTORY

mkdir -p Documents Shell_Script

for FILE in *; do
    [ -f "$FILE" ] || continue

    EXT="${FILE##*.}"
    EXT_LOWER=$(echo "$EXT" | tr '[:upper:]' '[:lower:]')

    case "$EXT_LOWER" in
        txt)
        mv "$FILE" Documents/ ;;
        sh)
        mv "$FILE" Shell_Script/ ;;
    esac
done
echo "Files in '$DIRECTORY' have been organized by type!"

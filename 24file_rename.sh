#!/bin/bash

read -p "Enter directory path: " DIR
read -p "Enter a New File Name: " NAME

COUNT=1

for FILE in "$DIR"/*; do
    if [[ -f "$FILE" ]]; then
        EXT="${FILE##*.}"
        mv "$FILE" "$DIR/$NAME$COUNT.$EXT"
        echo "Renamed: $FILE -> $NAME$COUNT.$EXT"
        ((COUNT++))
    fi
done

echo "All files renamed successfully."

#shell script that automatically organizes files in a directory based on their file types (e.g., images, documents, audio files).

#!/bin/bash

read -p "Enter the path of directory to Organize By the files: " path

cd $path
mkdir -p Documents Shell_Script
mv *.txt Documents/
mv *.sh Shell_Script/

echo "Files organized by type in $path"


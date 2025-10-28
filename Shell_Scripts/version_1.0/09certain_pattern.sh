#shell script that scans a directory for files matching a certain pattern and deletes them.

#!/bin/bash
set -x
read -p "Enter the directory path: " dir
read -p "Enter the file pattern to delete: " pattern

echo "Searching for files matching '$pattern' in '$dir'..."
echo "Deleting files matching pattern '$pattern' in '$dir'..."
find "$dir" -type f -name *"$pattern" -delete

echo "Deletion completed."
set +x


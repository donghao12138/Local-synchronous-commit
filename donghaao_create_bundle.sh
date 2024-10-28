#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <param1>"
    exit 1
fi

param1="$1"

param1_upper=$(echo "$param1" | tr 'a-z' 'A-Z')
param1_upper_with_colon="${param1_upper}:/"

echo "Converted Parameter: $param1_upper_with_colon"

target_directory="${param1_upper_with_colon}git_backup"

echo "Target Directory: $target_directory"

bundle_file="${target_directory}/backup.bundle"

if [ ! -d "$target_directory" ]; then
    mkdir -p "$target_directory"
fi

if [ -f "$bundle_file" ]; then
    rm "$bundle_file"
fi

git bundle create "$bundle_file" --all

return_value=$?

if [ $return_value -eq 0 ]; then
    echo "Created bundle file at: $bundle_file"
else
    echo "Failed to create bundle file. Exit status: $return_value"
fi


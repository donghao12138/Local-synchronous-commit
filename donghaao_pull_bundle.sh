#!/bin/bash

if [ "$#" -ne 1 ] && [ "$#" -ne 2 ]; then
    echo "Usage: $0 <drive_letter> [branch_name]"
    exit 1
fi

drive_letter="$1"

if [ "$#" -eq 1 ]; then
    drive_letter_upper=$(echo "$drive_letter" | tr 'a-z' 'A-Z')
    drive_letter_upper_with_colon="${drive_letter_upper}:/"

    echo "Converted Drive Letter: $drive_letter_upper_with_colon"

    git bundle list-heads "${drive_letter_upper_with_colon}git_backup/backup.bundle"

    echo -e "\n\n"

    git branch 
else
    branch_name="$2"

    drive_letter_upper=$(echo "$drive_letter" | tr 'a-z' 'A-Z')
    drive_letter_upper_with_colon="${drive_letter_upper}:/"

    echo "Fetching from bundle..."
    git fetch "${drive_letter_upper_with_colon}git_backup/backup.bundle" "refs/heads/${branch_name}:refs/heads/temp/donghao/${branch_name}"

    echo "Checking out branch..."
    git checkout "${branch_name}"

    echo "Merging temporary branch..."
    git merge "temp/donghao/${branch_name}"

    echo "Deleting temporary branch..."
    git branch -D "temp/donghao/${branch_name}"

    echo "
    
    !! 检查一下temp/donghao/xxx分支是否存在,这是创建的临时分支,使用完成后进行删除 !!

                 git branch -D temp/donghao/"
fi


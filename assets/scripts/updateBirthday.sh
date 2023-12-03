#!/bin/bash

# Function to get the current year
get_current_year() {
    date +'%Y'
}

update_year_in_file() {
    birthday_year=2002
    current_year=$(get_current_year)
    current_age=$(($current_year - $birthday_year))
    file_path="README.md"

    # Check if the file exists
    if [ -f "$file_path" ]; then
        # Find the current age in the file
        age_in_file=$(grep -oP '(?<=apiVersion: v)[0-9]+' "$file_path")

        if [ "$current_age" != "$age_in_file" ]; then
            # Update the age in the file
            sed -i "s/apiVersion: v$age_in_file/apiVersion: v$current_age/g" "$file_path"
            echo "Age updated to $current_age in $file_path"
        else
            echo "The age in $file_path is already up to date."
        fi
    else
        echo "File $file_path not found."
    fi
}

update_year_in_file

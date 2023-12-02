#!/bin/bash

# Function to get the current year
get_current_year() {
    date +'%Y'
}

# Replace the year in the Markdown file if it's not the current year
update_year_in_file() {
    current_year=$(get_current_year)
    file_path="README.md"

    # Check if the file exists
    if [ -f "$file_path" ]; then
        # Get the year mentioned in the file
        markdown_year=$(grep -oP '(?<=© )[0-9]+' "$file_path")

        if [ -n "$markdown_year" ]; then
            if [ "$current_year" != "$markdown_year" ]; then
                # Replace the year in the file using sed command
                sed -i "s/© $markdown_year/© $current_year/g" "$file_path"
                echo "Year updated to $current_year in $file_path"
            else
                echo "The year in $file_path is already up to date."
            fi
        else
            echo "No year found in the specified format in $file_path."
        fi
    else
        echo "File $file_path not found."
    fi
}

update_year_in_file

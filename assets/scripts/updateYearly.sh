#!/bin/bash

# Function to get the current year
get_current_year() {
    date +'%Y'
}

# Function to extract the year from the Markdown file
get_markdown_year() {
    grep -oP '(?<=\?username=PunGrumpy&year=)\d+' README.md
}

# Replace the year in the Markdown file if it's not the current year
update_year_in_file() {
    current_year=$(get_current_year)
    markdown_year=$(get_markdown_year)
    file_path="README.md"

    # Check if the file exists
    if [ -f "$file_path" ]; then
        if [ "$current_year" != "$markdown_year" ]; then
            # Replace the year in the file using sed command
            sed -i "s/\(username=PunGrumpy&year=\)$markdown_year/\1$current_year/g" "$file_path"
            echo "Year updated to $current_year in $file_path"
        else
            echo "The year in $file_path is already up to date."
        fi
    else
        echo "File $file_path not found."
    fi
}

update_year_in_file

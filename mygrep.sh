#!/bin/bash

# === mygrep.sh ===
# A simple script that searches for a string in a file.
# Supports options:
# -n : Show line numbers
# -v : Invert match (show non-matching lines)

# -- Handle --help option
if [ "$1" == "--help" ]; then
    echo "Usage: ./mygrep.sh [options] search_string filename"
    echo "Options:"
    echo "  -n    Show line numbers for matches"
    echo "  -v    Invert match (show lines that do NOT match)"
    exit 0
fi

# -- Check if enough arguments are provided
if [ $# -lt 2 ]; then # here we check the numbers of arguments "$#" if less than 2 print miising arguments
    echo "Error: Missing arguments."
    echo "Usage: ./mygrep.sh [options] search_string filename"
    exit 1
fi

# -- Initialize default settings
show_line_numbers=false
invert_match=false

# -- Check if the first argument is an option (starts with '-')
while [[ "$1" == -* ]]; do
   #now we check if the first argument is an option (starts with '-')
    options="$1"
    # Parse options
    if [[ "$options" == *n* ]]; then
        show_line_numbers=true
    fi
    if [[ "$options" == *v* ]]; then
        invert_match=true
    fi
    shift # Move to the next argument after the option
    done

   
    search="$1"        # The string to search for
    file="$2"          # The file to search in
 

# -- after we take the file we should make sure is exist 
if [ ! -f "$file" ]; then  # -f "$file" here i tried to check file exist and using "!" means if not exist 
    echo "Error: File does not exist." # then print "error"
    exit 1 
fi # end of if statement

# -- Perform search
# If invert_match is true
if $invert_match; then
    if $show_line_numbers; then
        # Search inverted and show line numbers
        grep -inv "$search" "$file" 
    else
        # Search inverted without line numbers
        grep -iv "$search" "$file"
    fi
else
    # If normal search
    if $show_line_numbers; then
        # Search normally and show line numbers
        grep -in "$search" "$file"
    else
        # Search normally without line numbers
        grep -i "$search" "$file"
    fi
fi
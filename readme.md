1. Breakdown of How the Script Handles Arguments and Options:
The script begins by checking if the --help option is provided. If so, it displays a usage guide and exits.

It verifies that the correct number of arguments are passed (at least two: a search string and a filename). If arguments are missing, it outputs an error message and exits.

It then checks for options like -v and -n. These are flags that control whether the search will invert matches or display line numbers.

-n adds line numbers to the results.

-v inverts the match, showing lines that do not contain the search string.

The script then ensures that the file exists before starting the search.

Finally, it performs the search with the appropriate options and outputs the results.

2. Supporting Regex or -i/-c/-l Options:
Regex Support: I would adjust the script to support regex patterns by using the -E flag with grep, enabling extended regular expressions.

-i (Case Insensitive) Option: To support -i, I would check if the option is passed and add the -i flag to the grep command to make the search case-insensitive.

-c (Count Matches) Option: To support this, the script would check for the -c option and pass it to grep to return the number of matching lines instead of the lines themselves.

-l (List Matching Files) Option: If multiple files were to be searched, the -l option could be added to the grep command to list the filenames that contain matches.

3. Hardest Part of the Script and Why:
The most challenging part of the script was managing the options and ensuring that they worked together seamlessly. Handling multiple options like -v (invert match) and -n (show line numbers) it required alot of attention from me to  make sure they didn’t conflict with each other.


#Find a file with a specific text 

find . -type f -exec grep -l "specific_text" {} \;
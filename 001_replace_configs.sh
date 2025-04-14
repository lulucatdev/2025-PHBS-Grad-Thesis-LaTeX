#!/bin/bash

# This script copies the main configs.tex file into the 
# title_and_copy, zh, and en subdirectories, and then runs xelatex in each.
# Make sure you have edited the main configs.tex in the root directory first.

SOURCE_CONFIG="configs.tex"
DEST_DIRS=("title_and_copy" "zh" "en")

# Check if the source config file exists
if [ ! -f "$SOURCE_CONFIG" ]; then
    echo "Error: Source file '$SOURCE_CONFIG' not found in the root directory."
    echo "Please create or ensure '$SOURCE_CONFIG' exists before running this script."
    exit 1
fi

# Check if xelatex is available
if ! command -v xelatex &> /dev/null; then
    echo "Error: 'xelatex' command not found. Please ensure LaTeX is installed and in your PATH."
    exit 1
fi

echo "Processing subdirectories..."

for dir in "${DEST_DIRS[@]}"; do
    echo "\n--- Processing directory: $dir ---"
    
    # Check if the destination directory exists
    if [ ! -d "$dir" ]; then
        echo "Warning: Destination directory '$dir' not found. Skipping."
        continue
    fi
    
    # Copy the file, overwriting if it exists
    echo "Copying '$SOURCE_CONFIG' to '$dir/'..."
    cp -f "$SOURCE_CONFIG" "$dir/configs.tex"
    
    # Check if the copy was successful
    if [ $? -ne 0 ]; then
        echo "Error: Failed to copy '$SOURCE_CONFIG' to '$dir/'. Skipping compilation for this directory."
        continue
    fi
    echo "Successfully copied '$SOURCE_CONFIG' to '$dir/'"

    # Check if main.tex exists in the subdirectory
    if [ ! -f "$dir/main.tex" ]; then
        echo "Warning: 'main.tex' not found in '$dir'. Skipping compilation for this directory."
        continue
    fi

    # Change into the directory, run xelatex, and change back
    echo "Running xelatex in '$dir/'..."
    (
        cd "$dir" || exit 1 # Enter the directory, exit subshell on failure
        xelatex main.tex
        # Add command to run biber if needed, e.g.:
        # if [ -f "main.bcf" ]; then
        #    biber main
        #    xelatex main.tex # Run xelatex again after biber
        # fi
        # Run xelatex a second time if needed for references/toc
        # xelatex main.tex 
    ) # Subshell ensures we return to the original directory

    if [ $? -eq 0 ]; then
        echo "Successfully ran xelatex in '$dir/'"
    else
        echo "Error: Failed to run xelatex in '$dir/'"
    fi
done

echo "\n--- Finished processing all directories ---"

#!/bin/sh

# Define the relative path to the source folder
relative_source_folder="../dist"

# Resolve the absolute path based on the script's location
script_dir="$(dirname "$(readlink -f "$0")")"
source_folder="$script_dir/$relative_source_folder"

# Define the name for the zip file
zip_filename="build.zip"

# Change the current directory to the source folder
cd "$source_folder" || exit 1

# Create the zip file from the current directory
zip -r "../$zip_filename" .

# Optionally, provide a message to indicate the process is complete
echo "Zip file created: $zip_filename"

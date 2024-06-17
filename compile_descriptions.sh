#!/bin/bash

# Directory containing the property description files
input_dir=$1

# Output CSV file
output_csv="descriptions.csv"

# Write the header to the CSV file
echo "ref,description" > $output_csv

# Loop through each file in the directory
for file in "$input_dir"/*; do
  if [[ -f $file ]]; then
    # Get the file name without the directory path
    filename=$(basename -- "$file" .txt)
    
    # Read the content of the file
    description=$(cat "$file")
    
    # Remove punctuation and replace with spaces
    clean_description=$(echo "$description" | tr -d '[:punct:]' | tr -s '[:space:]' ' ') 
    
    # Write the reference (filename without extension) and cleaned description to the CSV
    echo "$filename,\"$clean_description\"" >> $output_csv
  fi
done

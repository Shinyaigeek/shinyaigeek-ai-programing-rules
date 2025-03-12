#!/bin/bash

# Output file path
output_file=".cursor/RULES.md"

# Create or clear the output file
echo "# AI Assistant Rules" > "$output_file"
echo "" >> "$output_file"

# Find all .mdc files in rules directory and process them
find .cursor/rules -name "*.mdc" | sort | while read -r file; do
    # Extract filename without extension for section title
    filename=$(basename "$file" .mdc)
    
    # Add section title
    echo "## ${filename^}" >> "$output_file"
    echo "" >> "$output_file"
    
    # Add file content
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"
    echo "" >> "$output_file"
done

echo "Rules have been generated in $output_file" 
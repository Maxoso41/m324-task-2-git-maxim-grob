#!/bin/bash

# Check if README.md exists
if [ ! -f README.md ]; then
  echo "README.md not found!"
  exit 1  # Exit with error code 1 if README.md is not found
fi

# Get content of README.md
readme_content=$(<README.md)

# Check if reading the file was successful
if [ $? -ne 0 ]; then
  echo "Failed to read README.md"
  exit 1
fi

# Check if index.html exists before modifying it
if [ ! -f index.html ]; then
  echo "index.html not found!"
  exit 1  # Exit with error code 1 if index.html is not found
fi

# Extract and replace the content between <body> and </body> tags
sed -i '/<body>/,/<\/body>/c\<body>\n'"$readme_content"'\n</body>' index.html

# Check if sed was successful
if [ $? -ne 0 ]; then
  echo "Failed to modify index.html"
  exit 1
fi

echo "Conversion complete. See index.html"
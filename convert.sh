#!/bin/bash

# Check if README.md exists
if [ ! -f README.md ]; then
  echo "README.md not found!"
fi

# Get content
readme_content=$(<README.md)

# Extract body content
sed -i '/<body>/,/<\/body>/c\<body>\n'"$readme_content"'\n</body>' index.html
echo "Conversion complete. See index.html"
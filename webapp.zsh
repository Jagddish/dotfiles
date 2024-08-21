
#!/bin/zsh

# Check if an argument is provided
if [[ $# -eq 0 ]]; then
    echo "Please provide a folder name"
    exit 1
fi

# Create a directory with the provided name
folder_name=$1
mkdir "$folder_name"

# Change directory to the created folder
cd "$folder_name"

# Create files with boilerplate code
touch index.html style.css app.js reset.css 

# Add boilerplate code to each file
echo "
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <script src="app.js"></script>
  </body>
</html>
" > index.html

# echo "/* Styles */" > style.css

# echo "// JavaScript" > app.js

echo "Folder '$folder_name' created with files: index.html, style.css, app.js"

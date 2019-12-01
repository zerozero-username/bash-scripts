#!/usr/bin/env bash

## This is just a little test
file_name=
file_ext=
answer=

read -p "Insert the name of the file: [can include filepath] " file_name
read -p "What is the type of file? [py, sh and etc] " file_ext

chmod +x "$file_name.$file_ext"

echo "Done!"
sleep 1s
exit

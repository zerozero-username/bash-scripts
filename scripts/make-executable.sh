#!/usr/bin/env bash

## This is just a little test
file_name = read -r -q ("Insert the name of the file: [can include filepath]")
file_ext = read -r -q ("What's the type of file? [.py, .sh and etc]")
answer = read -r -q ("- ")

chmod +x "$file_name.$file_ext"

echo "Done!"
echo "Do you want to execute it? [yes/no]"

    if ["$answer" == "yes"]
        then

        ./"$file_name.$file_ext"

    else
        echo "Got it! Exiting...."
        sleep 1s
        exit


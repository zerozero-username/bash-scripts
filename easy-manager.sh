#!/usr/bin/env bash
# -*- coding: utf-8 -*-



function manager_info(){

        printf "%s\n\n"
        printf "%s\n\n" "[1] Show current folder path"
        sleep 0.1s
        printf "%s\n\n" "[2] Show folder contents"
        sleep 0.1s
        printf "%s\n\n" "[3] Show previous folders and files"
        sleep 0.1s
        printf "%s\n\n" "[4] Create a new folder"
        sleep 0.1s
        printf "%s\n\n" "[5] Create a new file"
        sleep 0.1s
        printf "%s\n\n" "[6] Show file contents"
        sleep 0.1s
        printf "%s\n\n" "[7] Show file type and size"
        sleep 0.1s
        printf "%s\n\n" "[8] Show file permissions"
        sleep 0.1s
        printf "%s\n\n" "[9] Install git"
        sleep 0.1s
        printf "%s\n\n" "[10] Install language-pack (python3, ruby, cpp)"
        sleep 0.1s
        printf "%s\n\n" "[11] Exit"
    }

function manager_script () {
    
    manager_info

    usr_opt= 

    function manager_opt () {

        usr_answer=
        usr_bool= 

        printf "%s\n\n"
        printf "%s\n\n" "Do you wish to return? [yes/no] "

        printf "%s\n\n"
        read -r -p "" usr_answer
        printf "%s\n\n"

        if [ "$usr_answer" == "yes" ]
        then

        usr_bool=true

        printf "%s\n\n" "Returning..."

        sleep 1s

        clear

        manager_script

        elif [ "$usr_answer" == "no" ]
        then

        usr_bool=true

        printf "%s\n\n" "Exiting..."

        sleep 1s 

        clear

        exit 
        
        else

        usr_bool=false

        printf "%s\n\n" "Invalid answer! Returning prompt....."

        sleep 1s

        clear

        while [ "$usr_bool" = false ]; do
            
        manager_opt

        done
        

        

        fi
    }

    printf "%s\n\n"
    read -r -p "Choose a option: " usr_opt

    if [ "$usr_opt"  == 1 ] 
    then

        printf "%s\n\n" "Current folder path:"
        printf "%s\n\n"

        sleep 0.2s
        pwd

        manager_opt

    elif [ "$usr_opt"  == 2 ]
    then

        printf "%s\n\n" "Current folder contents: "
        
        sleep 0.2s
        ls --human-readable --author --almost-all --si --size

        printf "%s\n\n"

        manager_opt

    elif [ "$usr_opt"  == 3 ]
    then

        printf "%s\n\n" "Previous folders contents: "

        sleep 0.2s
        ls --human-readable --author --si --size --almost-all ../
         
        printf "%s\n\n"

        manager_opt

    elif [ "$usr_opt"  == 4 ]
    then

        usr_folder=

        read -r -p "Insert folder name: " usr_folder
        printf "%s\n\n"

        sleep 0.2s
        printf "%s\n\n" "Creating $usr_folder"
        sleep 0.2s

        mkdir "$usr_folder"
        sleep 0.2s

        printf "%s\n\n"
        printf "%s\n\n" "Folder $usr_folder sucessfully created!"

        manager_opt

    elif [ "$usr_opt" == 5 ]
    then

        usr_file=

        read -r -p "Insert file name: " usr_file
        printf "%s\n\n"

        sleep 0.2s
        printf "%s\n\n" "Creating file $usr_file"

        touch "$usr_file"
        sleep 0.2s

        printf "%s\n" "Showing file:"

        sleep 0.3
        ls "$usr_file"

        printf "%s\n\n"

        manager_opt
    
    elif [ "$usr_opt" == 6 ]
    then

    usr_file_c=

    read -r -p "Insert file name: " usr_file_c
    printf "%s\n\n"
    sleep 0.3

    printf "%s\n\n" "$usr_file_c contents: "
    sleep 0.3

    cat < "$usr_file_c"*
    printf "%s\n\n"

    manager_opt

    elif [ "$usr_opt" == 7 ]
    then

    usr_file_t=

    read -r -p "Insert file name: " usr_file_t
    printf "%s\n\n"
    sleep 0.2s

    printf "%s\n\n" "Showing $usr_file_t type and size:"
    sleep 0.1s

    printf "%s\n\n" "File Type: "    
    file -F - "$usr_file_t"*

    sleep 0.2s
    printf "%s\n\n"
    
    printf "%s\n\n" "File size in bytes: "
    stat --format=%s "$usr_file_t"*

    printf "%s\n\n"

    manager_opt

    elif [ "$usr_opt" == 8 ]
    then

    usr_file_n=

    read -r -p "Insert file name: " usr_file_n
    printf "%s\n\n" 

    printf "%s\n\n" "Showing file permissions and ownership: "
    sleep 0.2s

    ls -l -h "$usr_file_n"* 

    manager_opt  

    elif [ "$usr_opt" == 9 ]
    then

    app_git_f=

    printf "%s\n\n" "Verifying if git is installed..."
    sleep 0.2s

    let dpkg -l git "$app_git_f"

        if [ "$app_git_f" == "un  git                  <none>          <none>          (no description available)" ]
        then

            printf "%s\n\n" "Git is not installed on your system"
            printf "%s\n\n" "Installing git..."

            sleep 0.2s

            sudo apt-get install git

            printf "%s\n\n"
        
        else

            printf "%s\n\n" "Git is already installed on your system!"

            sleep 0.2s

            printf "%s\n\n" "Showing your git version: "

            dpkg -s git | grep -i version
            printf "%s\n\n"
            
        fi

    manager_opt
    
    elif [ "$usr_opt" == 10 ]
    then

    printf "%s\n\n" "Verifying if python3, ruby and cpp are already installed..."

    app_cpp_f=$(dpkg -s cpp | grep -i description)
    app_ruby_f=$(dpkg -s ruby | grep -i description)
    app_python3_f=$(dpkg -s python3 | grep -i description)

    sleep 0.2s

    printf "%s\n\n" 

        if [ "$app_python3_f" == "dpkg-query: package 'python3' is not installed and no information is available" ]
        then

            printf "%s\n\n" "Python is not installed"
            printf "%s\n\n" "Installing python..."

            sleep 0.2s

            sudo apt-get install python3

            printf "%s\n\n" "Python successfully installed!"
        
        else

            printf "%s\n\n" "Python is already installed on your system!"

            sleep 0.2s

            printf "%s\n\n" "Showing your Python version: "

            dpkg -s python3 | grep -i version 
            printf "%s\n\n"
            

        fi

        if [ "$app_ruby_f" == "dpkg-query: package 'ruby' is not installed and no information is available" ]
        then

            printf "%s\n\n" "Ruby is not installed"
            printf "%s\n\n" "Installing ruby..."

            sleep 0.2s

            sudo apt-get install ruby

            printf "%s\n\n" "Ruby sucessfully installed!"

        else

            printf "%s\n\n" "Ruby is already installed on your system!"

            sleep 0.2s

            printf "%s\n\n" "Showing your Ruby version: "

            dpkg -s ruby | grep -i version
            printf "%s\n\n"
            
        fi

        if [ "$app_cpp_f" == "dpkg-query: package 'cpp' is not installed and no information is available" ]
        then

            printf "%s\n\n" "C++ is not installed"
            printf "%s\n\n" "Installing C++..."

            sleep 0.2s

            printf "%s\n\n" "C++ successfully installed!"

        else

            printf "%s\n\n" "C++ is already installed on your system!"

            sleep 0.2s

            printf "%s\n\n" "Showing your C++ version: "

            dpkg -s cpp | grep -i version
            printf "%s\n\n"

            dpkg -s cpp | grep -i description
            printf "%s\n\n"
            
        fi
    
    manager_opt

    elif [ "$usr_opt" == 11 ]
    then 

        exit

    else 

       printf "%s\n\n"
       printf "%s\n\n" "Invalid option, please try again"
       sleep 1s

       clear

       manager_script

    fi
    
    
    

}

manager_script


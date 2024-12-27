#!/bin/bash

# Function to install utilities
install_utilities() {
    print_color 3 "Use TAB to select multiple options and ENTER to confirm."
    selections=$(echo -e "curl\n git\n terminator\n htop\n unzip\n wget\n vim\n vlc\n gimp\n youtube-dl\n nano\n tree\n ncdu\n iputils-ping\n zsh\n tmux\n figlet" | fzf --multi --preview="echo {}" --border --height=20 --cycle --no-sort)
    
    if [ -z "$selections" ]; then
        print_color 1 "No utilities selected."
        return
    fi

    # Process selected utilities
    for selection in $selections; do
        case $selection in
            curl) sudo apt-get install curl -y && print_color 2 "curl installed!" ;;
            git) sudo apt-get install git -y && print_color 2 "git installed!" ;;
            terminator) sudo apt install terminator -y && print_color 2 "terminator installed!" ;;
            htop) sudo apt-get install htop -y && print_color 2 "htop installed!" ;;
            unzip) sudo apt-get install unzip -y && print_color 2 "unzip installed!" ;;
            wget) sudo apt-get install wget -y && print_color 2 "wget installed!" ;;
            vim) sudo apt-get install vim -y && print_color 2 "vim installed!" ;;
            vlc) sudo apt-get install vlc -y && print_color 2 "VLC installed!" ;;
            gimp) sudo apt-get install gimp -y && print_color 2 "GIMP installed!" ;;
            youtube-dl) sudo apt-get install youtube-dl -y && print_color 2 "youtube-dl installed!" ;;
            nano) sudo apt-get install nano -y && print_color 2 "nano installed!" ;;
            tree) sudo apt-get install tree -y && print_color 2 "tree installed!" ;;
            ncdu) sudo apt-get install ncdu -y && print_color 2 "ncdu installed!" ;;
            iputils-ping) sudo apt-get install iputils-ping -y && print_color 2 "ping utility installed!" ;;
            zsh) sudo apt-get install zsh -y && print_color 2 "zsh installed!" ;;
            tmux) sudo apt-get install tmux -y && print_color 2 "tmux installed!" ;;
            figlet) sudo apt-get install figlet -y && print_color 2 "figlet installed!" ;;
            *) print_color 1 "Invalid selection $selection!" ;;
        esac
    done
}

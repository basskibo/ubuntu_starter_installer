#!/bin/bash

# Function to print colored messages
print_color() {
    color_code=$1
    message=$2
    tput setaf $color_code
    echo "$message"
    tput sgr0
}

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

# Function to install GNOME tools
install_gnome_tools() {
    print_color 3 "Use TAB to select multiple options and ENTER to confirm."
    selections=$(echo -e "GNOME Tweaks\n Albert launcher\n Chrome GNOME Shell\n Dash to Dock\n GNOME Shell Extensions\n GParted\n Nautilus\n Coffee\n DConf Editor\n Shutter" | fzf --multi --preview="echo {}" --border --height=20 --cycle --no-sort)
    
    if [ -z "$selections" ]; then
        print_color 1 "No GNOME tools selected."
        return
    fi

    # Process selected GNOME tools
    for selection in $selections; do
        case $selection in
            "GNOME Tweaks") sudo apt-get install gnome-tweaks -y && print_color 2 "GNOME Tweaks installed!" ;;
            "Albert launcher") sudo apt-get install albert -y && print_color 2 "Albert launcher installed!" ;;
            "Chrome GNOME Shell") sudo apt-get install chrome-gnome-shell -y && print_color 2 "Chrome GNOME Shell installed!" ;;
            "Dash to Dock") sudo apt install gnome-shell-extension-dash-to-dock -y && print_color 2 "Dash to Dock installed!" ;;
            "GNOME Shell Extensions") sudo apt-get install gnome-shell-extensions -y && print_color 2 "GNOME Shell Extensions installed!" ;;
            "GParted") sudo apt-get install gparted -y && print_color 2 "GParted installed!" ;;
            "Nautilus") sudo apt-get install nautilus -y && print_color 2 "Nautilus file manager installed!" ;;
            "Coffee") sudo apt-get install coffee -y && print_color 2 "Coffee installed!" ;;  # Coffee - a simple GNOME app
            "DConf Editor") sudo apt-get install dconf-editor -y && print_color 2 "DConf Editor installed!" ;;
            "Shutter") sudo apt-get install shutter -y && print_color 2 "Shutter installed!" ;;
            *) print_color 1 "Invalid selection $selection!" ;;
        esac
    done
}

# Function to install productivity apps
install_productivity_apps() {
    print_color 3 "Use TAB to select multiple options and ENTER to confirm."
    selections=$(echo -e "Firefox\n Telegram\n Discord\n Skype\n Teams\n Slack\n Zoom\n Google Chrome\n Microsoft Edge\n Thunderbird\n Notion\n Evernote\n Dropbox\n GDrive" | fzf --multi --preview="echo {}" --border --height=20 --cycle --no-sort)
    
    if [ -z "$selections" ]; then
        print_color 1 "No productivity apps selected."
        return
    fi

    # Process selected productivity apps
    for selection in $selections; do
        case $selection in
            "Firefox") sudo snap install firefox && print_color 2 "Firefox installed!" ;;
            "Telegram") sudo snap install telegram-desktop && print_color 2 "Telegram installed!" ;;
            "Discord") sudo snap install discord && print_color 2 "Discord installed!" ;;
            "Skype") sudo snap install skype && print_color 2 "Skype installed!" ;;
            "Teams") sudo snap install teams && print_color 2 "Teams installed!" ;;
            "Slack") sudo snap install slack && print_color 2 "Slack installed!" ;;
            "Zoom") sudo snap install zoom-client && print_color 2 "Zoom installed!" ;;
            "Google Chrome") sudo apt-get install google-chrome-stable -y && print_color 2 "Google Chrome installed!" ;;
            "Microsoft Edge") sudo apt-get install microsoft-edge-stable -y && print_color 2 "Microsoft Edge installed!" ;;
            "Thunderbird") sudo apt-get install thunderbird -y && print_color 2 "Thunderbird installed!" ;;
            "Notion") sudo snap install notion-snap && print_color 2 "Notion installed!" ;;
            "Evernote") sudo snap install evernote-web && print_color 2 "Evernote installed!" ;;
            "Dropbox") sudo apt install dropbox -y && print_color 2 "Dropbox installed!" ;;
            "GDrive") sudo apt install grive2 -y && print_color 2 "Google Drive installed!" ;;
            *) print_color 1 "Invalid selection $selection!" ;;
        esac
    done
}

# Function to install development tools
install_dev_tools() {
    print_color 3 "Use TAB to select multiple options and ENTER to confirm."
    selections=$(echo -e "Node.js\n npm\n Visual Studio Code\n Docker\n Postman\n Sublime Text\n IntelliJ IDEA\n GitHub Desktop\n PyCharm\n Go\n Ruby\n Eclipse" | fzf --multi --preview="echo {}" --border --height=20 --cycle --no-sort)
    
    if [ -z "$selections" ]; then
        print_color 1 "No development tools selected."
        return
    fi

    # Process selected development tools
    for selection in $selections; do
        case $selection in
            "Node.js") sudo snap install node --classic && print_color 2 "Node.js installed!" ;;
            "npm") sudo apt-get install npm -y && print_color 2 "npm installed!" ;;
            "Visual Studio Code") sudo snap install code --classic && print_color 2 "Visual Studio Code installed!" ;;
            "Docker") sudo apt-get install docker-ce docker-ce-cli containerd.io -y && print_color 2 "Docker installed!" ;;
            "Postman") sudo snap install postman && print_color 2 "Postman installed!" ;;
            "Sublime Text") sudo snap install sublime-text --classic && print_color 2 "Sublime Text installed!" ;;
            "IntelliJ IDEA") sudo snap install intellij-idea-community --classic && print_color 2 "IntelliJ IDEA installed!" ;;
            "GitHub Desktop") sudo snap install github-desktop --classic && print_color 2 "GitHub Desktop installed!" ;;
            "PyCharm") sudo snap install pycharm-community --classic && print_color 2 "PyCharm installed!" ;;
            "Go") sudo apt-get install golang -y && print_color 2 "Go installed!" ;;
            "Ruby") sudo apt-get install ruby -y && print_color 2 "Ruby installed!" ;;
            "Eclipse") sudo snap install eclipse --classic && print_color 2 "Eclipse installed!" ;;
            *) print_color 1 "Invalid selection $selection!" ;;
        esac
    done
}

# Function to install entertainment tools
install_entertainment_tools() {
    print_color 3 "Use TAB to select multiple options and ENTER to confirm."
    selections=$(echo -e "Spotify\n VLC\n Steam\n OBS Studio\n Plex\n Twitch\n Epic Games Launcher\n GOG Galaxy" | fzf --multi --preview="echo {}" --border --height=20 --cycle --no-sort)
    
    if [ -z "$selections" ]; then
        print_color 1 "No entertainment tools selected."
        return
    fi

    # Process selected entertainment tools
    for selection in $selections; do
        case $selection in
            "Spotify") sudo snap install spotify && print_color 2 "Spotify installed!" ;;
            "VLC") sudo apt-get install vlc -y && print_color 2 "VLC installed!" ;;
            "Steam") sudo apt-get install steam -y && print_color 2 "Steam installed!" ;;
            "OBS Studio") sudo apt-get install obs-studio -y && print_color 2 "OBS Studio installed!" ;;
            "Plex") sudo apt-get install plexmediaserver -y && print_color 2 "Plex installed!" ;;
            "Twitch") sudo snap install twitch && print_color 2 "Twitch installed!" ;;
            "Epic Games Launcher") sudo snap install epicgames-launcher && print_color 2 "Epic Games Launcher installed!" ;;
            "GOG Galaxy") sudo snap install gog-galaxy && print_color 2 "GOG Galaxy installed!" ;;
            *) print_color 1 "Invalid selection $selection!" ;;
        esac
    done
}

# Function to install database tools
install_db_tools() {
    print_color 3 "Use TAB to select multiple options and ENTER to confirm."
    selections=$(echo -e "MongoDB\n Redis\n MySQL\n PostgreSQL\n MariaDB\n SQLite\n Cassandra\n Elasticsearch" | fzf --multi --preview="echo {}" --border --height=20 --cycle --no-sort)
    
    if [ -z "$selections" ]; then
        print_color 1 "No database tools selected."
        return
    fi

    # Process selected database tools
    for selection in $selections; do
        case $selection in
            "MongoDB") sudo apt-get install mongodb -y && print_color 2 "MongoDB installed!" ;;
            "Redis") sudo apt-get install redis-server -y && print_color 2 "Redis installed!" ;;
            "MySQL") sudo apt-get install mysql-server -y && print_color 2 "MySQL installed!" ;;
            "PostgreSQL") sudo apt-get install postgresql postgresql-contrib -y && print_color 2 "PostgreSQL installed!" ;;
            "MariaDB") sudo apt-get install mariadb-server -y && print_color 2 "MariaDB installed!" ;;
            "SQLite") sudo apt-get install sqlite3 -y && print_color 2 "SQLite installed!" ;;
            "Cassandra") sudo apt-get install cassandra -y && print_color 2 "Cassandra installed!" ;;
            "Elasticsearch") sudo apt-get install elasticsearch -y && print_color 2 "Elasticsearch installed!" ;;
            *) print_color 1 "Invalid selection $selection!" ;;
        esac
    done
}

# Main menu
main_menu() {
    while true; do
        print_color 6 "Main Menu: "
        print_color 6 "#######################################"
        echo "1. Install Utilities"
        echo "2. Install GNOME Tools"
        echo "3. Install Productivity Apps"
        echo "4. Install Development Tools"
        echo "5. Install Entertainment Tools"
        echo "6. Install Database Tools"
        echo "7. Exit"
        print_color 6 "#######################################"
        read -p "Please select an option (1-7): " choice

        case $choice in
            1) install_utilities ;;
            2) install_gnome_tools ;;
            3) install_productivity_apps ;;
            4) install_dev_tools ;;
            5) install_entertainment_tools ;;
            6) install_db_tools ;;
            7) print_color 5 "Exiting... Goodbye!"; exit 0 ;;
            *) print_color 1 "Invalid option, please try again." ;;
        esac
    done
}

# Start script
main_menu

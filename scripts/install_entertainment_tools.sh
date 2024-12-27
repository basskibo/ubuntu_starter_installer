#!/bin/bash

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

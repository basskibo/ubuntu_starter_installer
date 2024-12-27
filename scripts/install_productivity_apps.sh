#!/bin/bash

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

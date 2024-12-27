#!/bin/bash

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

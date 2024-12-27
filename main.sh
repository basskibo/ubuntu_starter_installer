#!/bin/bash

# Source all the functions from the other scripts
source ./functions.sh
source ./scripts/install_utilities.sh
source ./scripts/install_gnome_tools.sh
source ./scripts/install_productivity_apps.sh
source ./scripts/install_dev_tools.sh
source ./scripts/install_entertainment_tools.sh
source ./scripts/install_db_tools.sh

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

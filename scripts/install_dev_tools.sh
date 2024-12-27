#!/bin/bash

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

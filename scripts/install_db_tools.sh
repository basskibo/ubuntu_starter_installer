#!/bin/bash

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

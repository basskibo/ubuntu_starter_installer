#!/bin/bash

# Function to print colored messages
print_color() {
    color_code=$1
    message=$2
    tput setaf $color_code
    echo "$message"
    tput sgr0
}

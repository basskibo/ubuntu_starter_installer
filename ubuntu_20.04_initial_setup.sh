#!/bin/bash
#    .---------- constant part!
#    vvvv vvvv-- the code from above
RED='\033[0;36m'
NC='\033[0m' # No Color


# Utility
echo "Do you want to install utilities (curl, git, terminator, htop, unzip)? [Y/n]"
read utilityInput
if [[ $utilityInput == "Y" || $utilityInput == "y" ]]; then
    sudo snap install curl
    sudo apt-get install git -y
    sudo apt update
    sudo apt install terminator -y
    sudo apt-get install htop -y
    sudo apt-get install unzip -y
else
    echo "Skipping utilities installation..."
fi

# GNome shell and tweaks
echo "Do you want to install GNOME shell tweaks and Albert launcher? [Y/n]"
read gnomeInput
if [[ $gnomeInput == "Y" || $gnomeInput == "y" ]]; then
    curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
    echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
    sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_21.10/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
    sudo apt update
    sudo apt install albert -y
else
    echo "Skipping GNOME tweaks and Albert installation..."
fi

# zsh and ohmyzsh
echo "Do you want to install zsh and ohmyzsh? [Y/n]"
read zshInput
if [[ $zshInput == "Y" || $zshInput == "y" ]]; then
    sudo apt install zsh -y
    zsh --version
    cd ~
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y
    cp ./.zshrc ~/
    chsh -s $(which zsh)
else
    echo "Skipping zsh and ohmyzsh installation..."
fi

# GNOME shell extensions
echo "Do you want to install chrome-gnome-shell and GNOME tweaks? [Y/n]"
read gnomeShellInput
if [[ $gnomeShellInput == "Y" || $gnomeShellInput == "y" ]]; then
    sudo apt-get install chrome-gnome-shell -y
    sudo apt install gnome-tweaks -y
else
    echo "Skipping GNOME shell extensions installation..."
fi

# Productivity && Social
echo "Do you want to install productivity apps (Firefox, Cacher, Taskade)? [Y/n]"
read productivityInput
if [[ $productivityInput == "Y" || $productivityInput == "y" ]]; then
    sudo snap install firefox
    sudo snap install cacher
    sudo snap install taskade
else
    echo "Skipping productivity apps installation..."
fi

names=(telegram-desktop discord skype teams slack rocketchat-desktop konversation flock-chat)
selected=()
PS3='Choose which communication application you want (e.g. 1 2 to install telegram and discord)? : '
select name in "${names[@]}" ; do
    for reply in $REPLY ; do
        selected+=(${names[reply - 1]})
    done
    [[ $selected ]] && break
done
echo Selected: "${selected[@]}"

for t in ${selected[@]}
do
   echo "Installing $t"
   sudo snap install $t
done

# Development tools
echo "Do you want to install development tools (node, npm, vscode, postman, sublime, etc)? [Y/n]"
read devToolsInput
if [[ $devToolsInput == "Y" || $devToolsInput == "y" ]]; then
    sudo snap install node --classic
    sudo apt-get install npm -y
    sudo npm i n -g
    echo "${RED}Don't forget to select desired node version after installing n!${NC}"

    sudo snap install code --classic
    sudo snap install postman
    npm install -g typescript
    npm install -g npx
    sudo snap install sublime-text --classic
    sudo snap install beekeeper-studio
else
    echo "Skipping development tools installation..."
fi

echo "Do you want to install MongoDB? [Y/n]"
read mongoInput
if [[ $mongoInput == "Y" || $mongoInput == "y" ]]; then
    echo "MongoDB will be installed with Mongo3T ..."
    # Install MongoDB
    echo "${RED}Starting MongoDB installation${NC}"
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    sudo snap install robo3t-snap
else
    echo "Skipping MongoDB installation..."
fi

# Redis and Docker
echo "Do you want to install Redis and RDM? [Y/n]"
read redisInput
if [[ $redisInput == "Y" || $redisInput == "y" ]]; then
    sudo snap install redis
    sudo snap install redis-desktop-manager
else
    echo "Skipping Redis installation..."
fi

echo "Do you want to install Docker and kubectl? [Y/n]"
read dockerInput
if [[ $dockerInput == "Y" || $dockerInput == "y" ]]; then
    echo "Docker will be installed with kubectl ..."
    # Install docker
    echo "${RED}Starting docker installation${NC}"
    sudo apt-get update
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    sudo chmod 666 /var/run/docker.sock
    sudo snap install kubectl --classic
else
    echo "Skipping Docker installation..."
fi

# BigSur theme
echo "Do you want to install BigSur OSX theme? [Y/n]"
read bigSurInput
if [[ $bigSurInput == "Y" || $bigSurInput == "y" ]]; then
    echo "BigSur theme installation ..."
    cd ~
    wget https://github.com/vinceliuice/WhiteSur-gtk-theme/archive/refs/heads/master.zip
    unzip master.zip ${pwd}
    cd WhiteSur-gtk-theme-master/
    ./install.sh
    ./install.sh -N glassy
    ./tweaks.sh -d
    sudo ./tweaks.sh -g -b default
    cd ~
else
    echo "Skipping BigSur theme installation..."
fi

# Entertainment apps
echo "Do you want to install entertainment apps (Spotify, Musixmatch, Orange app)? [Y/n]"
read entertainmentInput
if [[ $entertainmentInput == "Y" || $entertainmentInput == "y" ]]; then
    sudo snap install spotify
    sudo snap install musixmatch
    sudo snap install orange-app
else
    echo "Skipping entertainment apps installation..."
fi

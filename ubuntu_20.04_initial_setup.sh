#    .---------- constant part!
#    vvvv vvvv-- the code from above
RED='\033[0;36m'
NC='\033[0m' # No Color

curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_21.10/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt install albert
# zsh and ohmyzsh
sudo apt install zsh -y
 zsh --version
 cd ~
 sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y
sudo apt-get install git -y
sudo apt-get install npm -y
sudo npm i n -g
echo "${RED}Dont forget to select desired node version after installing n !${NC}"
sudo snap install code --classic
sudo apt update
sudo apt install terminator
sudo apt-get install htop
# sudo update-alternatives --config x-terminal-emulator

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
#sudo docker run hello-world
sudo chmod 666 /var/run/docker.sock

sudo snap install redis-desktop-manager

# GNome shell and tweaks
sudo apt-get install chrome-gnome-shell
sudo apt install gnome-tweaks

# white bih sur theme https://github.com/vinceliuice/WhiteSur-gtk-theme and icons https://github.com/vinceliuice/WhiteSur-icon-theme


# Install MongoDB
echo "${RED}Starting MongoDB installation${NC}"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org



# Entertainment


sudo snap install spotify
sudo snap install musixmatch
sudo snap install orange-app


# Productivity && Social


sudo snap install firefox
sudo snap install cacher
sudo snap install taskade



sudo snap install telegram-desktop
sudo snap install discord
sudo snap install skype
sudo snap install teams
sudo snap install slack



# Development


sudo snap install postman
npm install -g typescript
npm install -g npx
sudo snap install robo3t-snap
sudo snap install sublime-text --classic
sudo snap install beekeeper-studio





cp ./.zshrc ~/
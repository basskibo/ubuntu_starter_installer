#    .---------- constant part!
#    vvvv vvvv-- the code from above
RED='\033[0;36m'
NC='\033[0m' # No Color

sudo snap install skype
sudo snap install spotify
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

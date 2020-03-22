#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "THIS SCRIPT MUST BE RUN AS 'root' USER"
   exit 1
fi

apt-get update -y
apt-get upgrade -y
apt update -y
apt upgrade -y

apt install docker.io -y
#sudo usermod -a -G docker $USER
#newgrp docker

apt install python -y
apt install python3 -y
apt install python-pip -y
apt install python3-pip -y
echo “alias python=python3” >> /etc/bash.bashrc
echo “alias pip=pip3” >> /etc/bash.bashrc
source /etc/bash.bashrc
pip install pipenv

apt-get install php -y
apt-get install r-base -y
apt-get install r-base-dev -y
apt install default-jre -y
apt install default-jdk -y
#VUE OLD NOT WORKING
#apt install nodejs -y
#apt install npm -y
#npm install -g @vue/cli
#VUE OLD NOT WORKING
#VUE NEW/WORKING INSTALL
#sudo apt install curl -y
#curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
#sudo apt-get install -y nodejs
#sudo npm install -g @vue/cli
#VUE NEW/WORKING INSTALL
apt install curl -y
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs
npm install -g @vue/cli

apt-get install exfat-fuse exfat-utils -y
apt install vlc -y

apt install snapd -y
echo “export PATH=\$PATH:/snap/bin” >> /etc/bash.bashrc
source /etc/bash.bashrc

snap install go --classic
snap install code --classic

#https://www.okd.io/download.html
#Download Linux OC Client v3.11.0-0cbc58b-linux-64bit.tar.gz
#tar -xvzf v3.11.0-0cbc58b-linux-64bit.tar.gz
#cd v3.11.0-0cbc58b-linux-64bit.tar.gz
#sudo mv oc /usr/bin/

#code --install-extension ms-python.python --force --user-data-dir
#code --install-extension felixfbecker.php-intellisense --force --user-data-dir
#code --install-extension ms-vscode.cpptools --force --user-data-dir
#code --install-extension ms-vscode.csharp --force --user-data-dir
#code --install-extension ms-azuretools.vscode-docker --force --user-data-dir
#code --install-extension redhat.java --force --user-data-dir
#code --install-extension octref.vetur --force --user-data-dir
#code --install-extension ms-vscode.go --force --user-data-dir
#SET VLC AS DEFAULT AUDIO AND DEFAULT VIDEO

#!/usr/bin/env bash

# This script installs several things I usually need for software development
sudo apt update && sudo apt upgrade -y
sudo apt install ubuntu-restricted-extras -y
sudo apt-get install synaptic -y
sudo apt-get install gnome-tweaks -y
sudo apt-get install tilde -y

# Enable firewall
# sudo ufw status verbose
# sudo ufw enable
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update;sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt purge ubuntu-web-launchers -y
sudo apt install git -y
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt update
sudo apt-get install virtualbox-6.0 -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker danielc
docker run hello-world
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt install gnome-shell-extensions -y
sudo apt install chrome-gnome-shell -y
sudo apt-get install gir1.2-gtop-2.0 gir1.2-networkmanager-1.0  gir1.2-clutter-1.0 -y
sudo apt install gnome-shell-extension-system-monitor -y
sudo apt install vokoscreen -y
# Cisco anyconnect VPN
sudo apt-get install lib32z1 lib32ncurses5 -y
# wget https://it2.umn.edu/services/all/data-network/vpn/downloads/anyconnect-linux64-4.6.03049-predeploy-k9.tar.gz
sudo apt install openconnect -y
# Other VPN's
sudo apt install network-manager-l2tp-gnome strongswan strongswan-plugin-openssl network-manager-l2tp strongswan-libcharon strongswan-charon strongswan-starter libstrongswan libstrongswan-standard-plugins xl2tpd
sudo apt install python3-pip -y
pip3 install awscli --upgrade --user
# eval "$(ssh-agent -s)"
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y
sudo apt-get update;sudo apt-get install remmina remmina-plugin-rdp libfreerdp-plugins-standard -y
sudo apt install wine64
sudo apt install vim
sudo apt upgrade
sudo apt install winetricks -y

# Virtualbox 6.0.6 install
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo apt update
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt install virtualbox-6.0 -y
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
# Other VPN's : Phase1 Algorithms : 3des-sha1-modp1024 Phase2 Algorithms : 3des-sha1 for l2tpsec
sudo apt install network-manager-l2tp-gnome strongswan strongswan-plugin-openssl network-manager-l2tp strongswan-libcharon strongswan-charon strongswan-starter libstrongswan libstrongswan-standard-plugins xl2tpd
sudo apt install python3-pip -y
pip3 install awscli --upgrade --user
# eval "$(ssh-agent -s)"
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y
sudo apt-get update;sudo apt-get install remmina remmina-plugin-rdp libfreerdp-plugins-standard -y
sudo apt install vim
sudo apt upgrade

# Virtualbox 6.0.6 install
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo apt update
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt install virtualbox-6.0 -y

wget https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.deb
sudo dpkg -i vagrant_2.2.4_x86_64.deb
vagrant plugin install vagrant-env

wget https://download.virtualbox.org/virtualbox/6.0.8/Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.0.8.vbox-extpack

sudo add-apt-repository ppa:linuxuprising/shutter -y
sudo apt update
sudo apt install shutter -y
sudo apt install gnome-web-photo
#wget http://ftp.us.debian.org/debian/pool/main/libg/libgoo-canvas-perl/libgoo-canvas-perl_0.06-2+b3_amd64.deb
#wget https://debian.pkgs.org/9/debian-main-amd64/perl-base_5.24.1-3+deb9u5_amd64.deb.html
#dpkg -i
#dpkg -i libgoo-canvas-perl_0.06-2+b3_amd64.deb
#wget http://ftp.us.debian.org/debian/pool/main/g/goocanvas/libgoocanvas3_1.0.0-1_amd64.deb
#dpkg -i libgoocanvas3_1.0.0-1_amd64.deb
#wget http://ftp.us.debian.org/debian/pool/main/g/goocanvas/libgoocanvas-common_1.0.0-1_all.deb
#dpkg -i libgoocanvas-common_1.0.0-1_all.deb

# Check which graphic card is being used:
# See https://nouveau.freedesktop.org/wiki/CodeNames/
# i.e:
# OpenGL vendor string: nouveau
# OpenGL renderer string: NV136 (This code would be GeForce GTX 1060)
# glxinfo|egrep "OpenGL vendor|OpenGL renderer*"

# Install different Java versions. Use openjdk version since the The Oracle JDK License has changed for releases
# starting April 16, 2019. See https://www.oracle.com/technetwork/java/javase/overview/oracle-jdk-faqs.html and
# also https://launchpad.net/~webupd8team/+archive/ubuntu/java. PPA is no longer maintained, thanks Oracle!
# sudo apt --names-only search "openjdk-.*jre$"
sudo apt install openjdk-8-jre -y
# Used for Java Development, previous package only installs runtime
sudo apt install openjdk-8-jdk -y
sudo apt install maven
# sudo apt install openjdk-11-jre -y
# sudo update-alternatives --config java

sudo apt install dconf-tools -y

wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb

# VPN Setup
sudo apt install network-manager-l2tp-gnome strongswan network-manager-l2tp strongswan-libcharon strongswan-charon strongswan-starter libstrongswan libstrongswan-standard-plugins xl2tpd
sudo apt install intltool libtool network-manager-dev libnm-util-dev libnm-glib-dev libnm-glib-vpn-dev libnm-gtk-dev libnm-dev libnma-dev ppp-dev libdbus-glib-1-dev libsecret-1-dev libgtk-3-dev libglib2.0-dev xl2tpd strongswan

# Hamachi needed dependency
sudo apt install lsb -y
wget https://vpn.net/installers/logmein-hamachi_2.1.0.198-1_amd64.deb
sudo dpkg -i logmein-hamachi*.deb
sudo service hamachi start

# Install Haguichi. This is to give GUI control of Hamachi and avoid terminal commands
sudo add-apt-repository -y ppa:webupd8team/haguichi
sudo apt update;sudo apt install -y haguichi

# Install wine
sudo dpkg --add-architecture i386
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
###  Ubuntu 18.10
# sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ cosmic main'
###  Ubuntu 18.04
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
sudo apt update
sudo apt install --install-recommends winehq-stable
# If you face unmet dependencies error during installation,
# use the following commands to install winehq using aptitude.
# sudo apt-get install aptitude
# sudo aptitude install winehq-stable
sudo apt install winetricks -y

# See https://www.percona.com/doc/percona-xtrabackup/LATEST/installation/apt_repo.html
# https://www.percona.com/blog/2018/04/02/migrate-to-amazon-rds-with-percona-xtrabackup/
# Installing Percona XtraBackup from Percona apt repository
wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
sudo dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
sudo percona-release enable-only tools release
sudo apt update;sudo apt install percona-xtrabackup-80 -y
# Uninstall
# sudo apt remove percona-xtrabackup-80



#!/usr/bin/env bash

## Solve issue with openconnect-gnome internal server not resolving

# https://askubuntu.com/questions/1144502/vpn-cisco-anyconnect-openconnect-plugin-stopped-setting-up-dns-on-ubuntu-18-04/1145129
# https://www.andersaaberg.dk/2019/resolve-dns-using-vpn-openconnect-rather-than-default-isp-dns-on-ubuntu-18-04/
#
# However, when the VPN is turned on, it fails to use the DNS from the VPN which means that I cannot access the internal
# websites behind the VPN unless I know the IP-adresses. I have tried many different solutions that didn’t work until I
# found something useful (https://bugs.launchpad.net/ubuntu/+source/network-manager/+bug/1688018). Do the following:
#
# sudo gedit /etc/NetworkManager/system-connections/<NAME_OF_YOUR_VPN_CONNECTION>
# Add the following to the “[ipv4]” section: dns-priority=-1
# Restart the network manager: sudo systemctl restart NetworkManager.service

VPN_CONNECTION_NAME=CiscoAnyConnect
VPN_CONNECTION_PATH="/etc/NetworkManager/system-connections/${VPN_CONNECTION_NAME}"

sudo apt-get install network-manager-openconnect-gnome -y
sudo sed -i '/ipv4/a dns-priority=-1' ${VPN_CONNECTION_PATH}
sudo systemctl restart NetworkManager.service

https://www.andersaaberg.dk/2019/resolve-dns-using-vpn-openconnect-rather-than-default-isp-dns-on-ubuntu-18-04/
https://askubuntu.com/questions/1144502/vpn-cisco-anyconnect-openconnect-plugin-stopped-setting-up-dns-on-ubuntu-18-04/1145129
https://unix.stackexchange.com/questions/171270/openconnect-not-resolving-hostnames

sudo openconnect --user Daniel.Chaves --csd-user danielc --csd-wrapper ~/csd-wrapper-download.sh --authgroup GROUP_OF_VPN us.bitclaw.com/anyconnect
sudo openconnect --user Daniel.Chaves us.bitclaw.com/anyconnect

# Another workaround I'm using is to put the internal VPNs IPs on /etc/hosts
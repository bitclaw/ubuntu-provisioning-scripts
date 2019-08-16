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
sudo apt install openconnect network-manager-openconnect network-manager-openconnect-gnome -y
sudo sed -i '/ipv4/a dns-priority=-1' ${VPN_CONNECTION_PATH}
sudo systemctl restart NetworkManager.service

https://www.andersaaberg.dk/2019/resolve-dns-using-vpn-openconnect-rather-than-default-isp-dns-on-ubuntu-18-04/
https://askubuntu.com/questions/1144502/vpn-cisco-anyconnect-openconnect-plugin-stopped-setting-up-dns-on-ubuntu-18-04/1145129
https://unix.stackexchange.com/questions/171270/openconnect-not-resolving-hostnames
https://websiteforstudents.com/install-openconnect-ssl-vpn-client-on-ubuntu-18-04-18-04/
https://grepitout.com/install-openconnect-ubuntu-vpn-client/
https://askubuntu.com/questions/1032792/openconnect-juniper-vpn-not-working-in-ubuntu-18-04
http://ubuntuhandbook.org/index.php/2014/11/connect-cisco-anyconnect-vpn-ubuntu/
http://www.socsci.uci.edu/~jstern/uci_vpn_ubuntu/ubuntu-openconnect-uci-instructions.html
https://computingforgeeks.com/how-to-connect-to-vpn-server-with-openconnect-ssl-vpn-client-on-linux/
https://github.com/HenrikBengtsson/ucsf-vpn/issues/11
http://www.infradead.org/openconnect/vpnc-script.html
https://bugzilla.redhat.com/show_bug.cgi?id=1497750
https://unix.stackexchange.com/questions/171270/openconnect-not-resolving-hostnames
https://askubuntu.com/questions/124646/cannot-resolve-custom-domains-when-vpn-is-up/126527#126527

https://gist.github.com/markis/7ccba4285655e087022277b0d6196195
https://gist.github.com/l0ki000/56845c00fd2a0e76d688
https://gist.github.com/stefancocora/686bbce938f27ef72649a181e7bd0158
https://gist.github.com/slimbrd/f281083865feb9f93912bc9debfd83cc

openconnect cannot resolve hosts

sudo openconnect --user Daniel.Chaves --csd-user danielc --csd-wrapper ~/csd-wrapper-download.sh --authgroup GROUP_OF_VPN us.bitclaw.com/anyconnect
sudo openconnect --user Daniel.Chaves us.bitclaw.com/anyconnect
sudo openconnect --user Daniel.Chaves us.bitclaw.com/anyconnect --disable-ipv6 --passwd-on-stdin --token-mode=rsa --token-secret=XXX --resolve=HOST:IP --verbose

# Another workaround I'm using is to put the internal VPNs IPs on /etc/hosts

# Google's DNS Servers
# 8.8.8.8
# 8.8.4.4
#
# 2001:4860:4860::8888
# 2001:4860:4860::8844
#
# OpenDNS DNS Servers
# 208.67.222.222
# 208.67.220.220
#
# 2620:119:35::35
# 2620:119:53::53
#!/usr/bin/env bash

# Relevant Links
# https://people.eng.unimelb.edu.au/lucasjb/oc.html
# https://oit.ncsu.edu/campus-it/campus-data-network/vpn/vpn-installation-instructions-for-ubuntu-and-red-hat-linux/
# https://askubuntu.com/questions/1075590/ubuntu-18-04-openconnect-for-cisco-anyconnect-configuration-problem
# https://askubuntu.com/questions/1075590/ubuntu-18-04-openconnect-for-cisco-anyconnect-configuration-problem
# http://git.infradead.org/users/dwmw2/vpnc-scripts.git/blob_plain/HEAD:/vpnc-script

# If you need to use the newer Cisco Anyconnect client, you can install openconnect on Ubuntu using
# sudo apt-get install network-manager-openconnect-gnome This will add an Anyconnect compatible option to the VPN GUI
# under your network settings.

sudo apt-get install network-manager-openconnect-gnome -y
# You can also initiate a connection by entering sudo openconnect YOURVPN.COM in the terminal.
# Use Terminal again to launch the AnyConnect VPN UI program with sudo /opt/cisco/anyconnect/bin/vpnui

# General VPN commands
# sudo add-apt-repository ppa:nm-l2tp/network-manager-l2tp sudo apt-get update sudo apt-get install network-manager-l2tp-gnome
# sudo apt install network-manager-l2tp-gnome strongswan strongswan-plugin-openssl network-manager-l2tp strongswan-libcharon strongswan-charon strongswan-starter libstrongswan libstrongswan-standard-plugins xl2tpd

# Troubleshooting Linux
# journalctl -f -u NetworkManager sudo ike-scan glasses-fw.webair.com
#
# Error: Could not establish IPsec tunnel.
#
# Fix: sudo apt install intltool libtool network-manager-dev libnm-util-dev libnm-glib-dev libnm-glib-vpn-dev libnm-gtk-dev libnm-dev libnma-dev ppp-dev libdbus-glib-1-dev libsecret-1-dev libgtk-3-dev libglib2.0-dev xl2tpd strongswan
#
# sudo ike-scan glasses-fw.webair.com Starting ike-scan 1.9 with 1 hosts (http://www.nta-monitor.com/tools/ike-scan/) 173.239.25.196 Main Mode Handshake returned HDR=(CKY-R=6ff35fb21c5456a1) SA=(Enc=3DES Hash=SHA1 Auth=PSK Group=2:modp1024 LifeType=Seconds LifeDuration(4)=0x00007080) VID=afcad71368a1f1c96b8696fc77570100 (Dead Peer Detection v1.0)
#
# Ending ike-scan 1.9: 1 hosts scanned in 0.199 seconds (5.02 hosts/sec). 1 returned handshake; 0 returned notify
#
# Phase1 Algorithms : 3des-sha1-modp1024 Phase2 Algorithms : 3des-sha1
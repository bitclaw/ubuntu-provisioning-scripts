#!/bin/bash

# Download nomachine software and install
wget https://download.nomachine.com/download/6.7/Linux/nomachine_6.7.6_11_amd64.deb
sudo dpkg -i nomachine_6.7.6_11_amd64.deb

# Uninstall nomachine
# sudo dpkg -r nomachine
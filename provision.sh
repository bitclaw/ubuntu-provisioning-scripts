#!/bin/bash

# Script for provisioning new development environment for Ubuntu 18.04
sudo apt install net-tools -y
mkdir ~/code
chmod 600 ~/.ssh/id_rsa;chmod 600 ~/.ssh/id_rsa.pub
wget https://download.nomachine.com/download/6.7/Linux/nomachine_6.7.6_11_amd64.deb

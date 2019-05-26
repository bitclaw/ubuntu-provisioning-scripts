#!/bin/bash
sudo apt install debconf-utils -y

# Example for getting necessary environment variables to setup MySQL
# sudo apt install mysql-server -y
# debconf-show package
# debconf-get-selections | grep mysql-server
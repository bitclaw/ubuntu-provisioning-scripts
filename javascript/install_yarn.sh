#!/usr/bin/env bash

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# No need to install node.js since I use NVM/FNM
sudo apt update -y;sudo apt install --no-install-recommends yarn -y

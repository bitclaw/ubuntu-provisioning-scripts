#!/bin/bash

sudo apt remove gedit -y
sudo apt install geany -y
git clone https://github.com/codebrainz/geany-themes.git ~/code/github/public/geany-themes
cd ~/code/github/public/geany-themes
bash install.sh
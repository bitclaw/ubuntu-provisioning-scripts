#!/bin/sh

sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo apt-get update
apt-get install handbrake-gtk
apt-get install handbrake-cli
# HandBrakeCLI -i video.mkv -o video.mp4 -e x264 -q 22 -r 15 -b 128 -B 32 -X 320 -Y 240


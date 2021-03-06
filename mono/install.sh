#!/usr/bin/env bash

# Useful links:
# https://andrewlock.net/using-reference-assemblies-to-build-net-framework-libararies-on-linux-without-mono/
# https://medium.com/@hudsonmendes/build-net-4-5-on-linux-in-5-minutes-and-see-what-it-is-like-848ea45fc667

# Ubuntu 18.04
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install -y nuget mono-devel mono-xbuild
sudo apt install mono-complete
nuget update -self
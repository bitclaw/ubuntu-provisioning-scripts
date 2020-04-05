#!/usr/bin/env bash

sudo apt install unzip
wget -P /tmp//terraform https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
cd /tmp/terraform || exit
unzip terraform_0.12.24_linux_amd64.zip
sudo mv terraform /usr/local/bin
terraform --version

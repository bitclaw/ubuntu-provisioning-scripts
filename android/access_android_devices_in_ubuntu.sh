#!/bin/bash

# See https://www.debugpoint.com/2016/03/how-to-access-android-devices-internal-storage-and-sd-card-in-ubuntu-linux-mint-using-media-transfer-protocol-mtp/
# See https://askubuntu.com/questions/1038145/trying-to-install-android-file-transfer-ubuntu-18-04-bionic

sudo apt-get install go-mtpfs -y && sudo apt-get install libmtp9 -y && sudo apt-get install mtpfs mtp-tools -y



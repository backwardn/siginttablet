#!/bin/bash

echo "Installing RPITX transmit library"
if [ ! -d ~/source/rpitx ]; then
    git clone https://github.com/F5OEO/rpitx.git
    cd rpitx
else
    cd rpitx
    git pull
fi
./install.sh
cd ~/source

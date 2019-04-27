#!/bin/bash

cd ~/source
# Install TempestSDR
echo "Installing TempestSDR"
if [ ! -d ~/source/TempestSDR ]; then
    git clone https://github.com/hennichodernich/TempestSDR.git
    cd TempestSDR/JavaGUI
else
    cd TempestSDR
    git pull
    cd JavaGUI
fi
sed -i 's/PLUGINS += TSDRPlugin_HackRF/#PLUGINS += TSDRPlugin_HackRF/g' makefile
make all
cd ~/source

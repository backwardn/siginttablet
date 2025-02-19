#!/bin/bash

cd ~/source
# bluepy
echo "Installing BLEAH Bluetooth low energy"

if [ ! -d ~/source/bluepy ]; then
    git clone https://github.com/IanHarvey/bluepy.git
    cd bluepy
else
    cd bluepy
    git pull
fi
python2 setup.py build
sudo python2 setup.py install

cd ~/source
# bleah
if [ ! -d ~/source/bleah ]; then
    git clone https://github.com/jeffehobbs/bleah.git
    cd bleah
else
    cd bleah
    git pull
fi
python2 setup.py build
sudo python2 setup.py install

cd ~/source

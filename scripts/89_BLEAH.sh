#!/bin/bash

cd ~/source
# BLEAH
echo "Installing BLEAH Bluetooth low energy"

if [ ! -d ~/source/bluepy ]; then
    git clone https://github.com/IanHarvey/bluepy.git
    cd bluepy
else
    cd bluepy
    git pull
fi
cd bluepy
python2 setup.py build
sudo python2 setup.py install


if [ ! -d ~/source/bleah ]; then
    git clone https://github.com/jeffehobbs/bleah.git
    cd bleah
else
    cd bleah
    git pull
fi
cd bleah
python2 setup.py build
sudo python2 setup.py install

cd ~/source

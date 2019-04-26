#!/bin/bash

cd ~/source
# Nordic chipset hacker
# NEEDS: sdcc binutils python python-pip
# NEEDS: sudo pip install -U pip platformio
# NEEDS: sudo pip install -U -I pyusb
echo "Installing Mousejack firmware and tools"
if [ ! -d ~/source/mousejack ]; then
    git clone https://github.com/BastilleResearch/mousejack.git
    cd mousejack
else
    cd mousejack
    git pull
fi
git submodule init
git submodule update
cd ~/source


# Nordic Gnuradio module
# NEEDS:
echo "Installing Mousejack Gnuradio modules."
if [ ! -d ~/source/gr-nordic ]; then
    git clone https://github.com/BastilleResearch/gr-nordic.git
    cd gr-nordic
else
    cd gr-nordic
    git pull
fi
mkdir build
cd build
cmake ..
make
sudo make install
cd ~/source

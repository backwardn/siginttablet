#!/bin/bash

cd ~/source
echo "Installing Gnuradio"
if [ ! -d ~/source/gnuradio ]; then
    git clone --recursive https://github.com/gnuradio/gnuradio.git
    cd gnuradio
else
    cd gnuradio
    git pull
fi
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make -j3
sudo make install
cd ~/source

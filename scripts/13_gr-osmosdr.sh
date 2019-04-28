#!/bin/bash

cd ~/source


echo "OSMO- Open Source Mobile Comms gr module"
if [ ! -d ~/source/gr-osmosdr ]; then
    git clone git://git.osmocom.org/gr-osmosdr
    cd gr-osmosdr
else
    cd gr-osmosdr
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~/source



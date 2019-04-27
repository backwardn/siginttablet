#!/bin/bash

cd ~/source
# rtl_433 telemetry
echo "Installing rtl_433"
if [ ! -d ~/source/rtl_433 ]; then
    git clone https://github.com/merbanan/rtl_433.git
    cd rtl_433
else
    cd rtl_433
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~/source

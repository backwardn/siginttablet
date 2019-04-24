#!/bin/bash

echo "Installing CMake"
if [ ! -d ~/source/CMake ]; then
    git clone https://github.com/Kitware/CMake.git
    cd CMake
else
    cd CMake
    git pull
fi
./bootstrap
make
sudo make install
cd ~/source

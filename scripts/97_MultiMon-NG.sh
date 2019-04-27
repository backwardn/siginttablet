#!/bin/bash

cd ~/source
# multimon-ng plugins
echo "Installing multimon-ng."
if [ ! -d ~/source/multimon-ng ]; then
    git clone https://github.com/EliasOenal/multimon-ng.git
    cd multimon-ng
else
    cd multimon-ng
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~/source

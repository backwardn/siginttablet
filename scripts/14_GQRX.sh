#!/bin/bash

cd ~/source
# GQRX
# NEEDS: A pile of stuff!
echo "Installing GQRX"
if [ ! -d ~/source/gqrx ]; then
    git clone https://github.com/csete/gqrx.git
    cd gqrx
else
    cd gqrx
    git pull
fi
mkdir build
cd build
cmake ..
make -j1
sudo make install
cd ~/source

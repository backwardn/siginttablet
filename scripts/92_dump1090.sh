#!/bin/bash

cd ~/source
echo "Installing dump1090"
if [ ! -d ~/source/dump1090 ]; then
    git clone https://github.com/antirez/dump1090.git
    cd dump1090
else
    cd dump1090
    git pull
fi
make
cd ~/source

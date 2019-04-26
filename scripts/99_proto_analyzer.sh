#!/bin/bash

cd ~/source
# Universal Radio Hacker
# sudo pip3 install urh DOESNT WORK ON RPI :(
if [ ! -d ~/source/urh ]; then
    git clone https://github.com/jopohl/urh.git
    cd urh
else
    cd urh
    git pull
fi
sudo python3 setup.py install
cd ~/source

# Inspectrum 
# NEEDS: cmake >= 2.8.11 , fftw 3.x , liquid-dsp >= v1.3.0 , pkg-config , qt5
echo "installing Inspectrum protocol analyzer"
if [ ! -d ~/source/inspectrum ]; then
    git clone https://github.com/miek/inspectrum.git
    cd inspectrum
else
    cd inspectrum
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~/source


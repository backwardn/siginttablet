#!/bin/bash

cd ~/source
# SoapySDR
# NEEDS: cmake g++ libpython-dev python-numpy swig
echo "installing SoapySDR"
if [ ! -d ~/source/SoapySDR ]; then
    git clone https://github.com/pothosware/SoapySDR.git
    cd SoapySDR
else
    cd SoapySDR
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
sudo ldconfig 
cd ~/source

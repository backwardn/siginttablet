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


cd ~/source
# SoapyAudio
# NEEDS: cmake g++ libpython-dev python-numpy swig
echo "installing SoapyAudio"
if [ ! -d ~/source/SoapyAudio ]; then
    git clone https://github.com/pothosware/SoapyAudio
    cd SoapyAudio
else
    cd SoapyAudio
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
sudo ldconfig 
cd ~/source


cd ~/source
# SoapyRTLSDR
# NEEDS: cmake g++ libpython-dev python-numpy swig
echo "installing SoapyRTLSDR"
if [ ! -d ~/source/SoapyRTLSDR ]; then
    git clone https://github.com/pothosware/SoapyRTLSDR
    cd SoapyRTLSDR
else
    cd SoapyRTLSDR
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
sudo ldconfig 
cd ~/source

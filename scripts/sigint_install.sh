#!/bin/bash

# Remove unneeded software from device
sudo apt-get remove bluej geany greenfoot scratch scratch2 python-sense-emu python3-sense-emu sonic-pi python3-thonny python3-thonny-pi smartsim libreoffice* claws-mail python-games 
sudo apt-get autoremove

# Now we update the base system
sudo apt-get update
sudo apt-get upgrade

# Install requisite libraries and repo software
sudo apt-get install -y build-essential cmake libpcap-dev libpcap0.8 libusb-1.0-0 libnetfilter-queue-dev libnetfilter-queue1 default-jdk apt-file gcc-multilib libudh-dev libboost-all-dev
sudo apt-get install -y gqrx-sdr gnuradio* librtlsdr-dev soapysdr-module-rtlsdr
sudo apt-get install -y gr-analog gr-blocks gr-channel gr-filter
sudo apt-get install -y python3-numpy python3-psutil python3-zmq python3-pyqt5 g++ libpython3-dev python3-pip cython3 qt5-default
sudo apt-get install -y libfftw3-dev pkg-config libliquid-dev sdcc binutils python python-pip
sudo apt-get install -y libqwtplot3d-qt4-0v5 libqwtplot3d-qt4-dev libqwt-dev libqwt-headers
sudo pip install -U tensorflow
sudo pip install -U pip
sudo pip install -U platformio
sudo pip install -U -I pyusb

# Update file package ownership
sudo apt-file update

# Set up sourcecode location for most applications
mkdir ~/source
cd ~/source

# Set up JAVA_HOME
echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))" >> ~/.bash_profile

# Set up GOLANG and variables
wget https://dl.google.com/go/go1.12.1.linux-armv6l.tar.gz
sudo tar -C /usr/local -xzf go1.12.1.linux-armv6l.tar.gz
mkdir ~/go
echo "export GOPATH=$HOME/go" >> ~/.bash_profile
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bash_profile
source ~/.bash_profile


# RPI transmit library
git clone https://github.com/F5OEO/rpitx.git
cd rpitx
./install.sh
cd ~/source

# Spy mic detecter
git clone https://github.com/eldraco/Salamandra.git

# Radio protocol analyzers
# git clone https://github.com/jopohl/urh.git
sudo pip3 install urh

git clone https://github.com/miek/inspectrum.git
cd inspectrum
mkdir build
cd build
cmake ..
make
sudo make install
cd ~/source

# Nordic chipset hacker
git clone https://github.com/BastilleResearch/mousejack.git
cd mousejack
git submodule init
git submodule update
cd ~/source

git clone https://github.com/BastilleResearch/gr-nordic.git
cd gr-nordic
mkdir build
cd build
cmake ..
make
sudo make install
cd ~/source

# SigInt toolbox for gnuradio
git clone https://github.com/gnuradio/gr-inspector.git
cd gr-inspector
mkdir build
cd build
cmake ..
make -j2
sudo make install
cd ~/source

# BTLE and wifi reconnsaisance and hacking
go get github.com/bettercap/bettercap
cd $GOPATH/src/github.com/bettercap/bettercap
make build 
sudo make install
cd ~/source

# Install TempestSDR
git clone https://github.com/hennichodernich/TempestSDR.git
cd TempestSDR/JavaGUI
sed -i 's/PLUGINS += TSDRPlugin_HackRF/#PLUGINS += TSDRPlugin_HackRF/g' makefile
make all

#!/bin/bash

# Install requisite libraries and repo software
echo "Installing SigInt repository software and libraries"
sudo apt-get install -qq -y build-essential libpcap-dev libpcap0.8 libusb-1.0-0 libnetfilter-queue-dev libnetfilter-queue1 default-jdk apt-file libuhd-dev libboost-all-dev libsndfile1-dev imagemagick libfftw3-dev buffer vim libatlas-base-dev wireshark wireshark-qt swig libusb-dev libusb-1.0-0-dev libusb-1.0-doc libcppunit-dev
sudo apt-get install -qq -y python3-numpy python3-psutil python3-zmq python3-pyqt5 g++ libpython3-dev python3-pip cython3 qt5-default autoconf automake libtool libnl-3-dev libnl-genl-3-dev libssl-dev ethtool shtool rfkill zlib1g-dev libpcap-dev libsqlite3-dev libpcre3-dev libhwloc-dev libcmocka-dev hostapd wpasupplicant tcpdump screen iw
sudo apt-get install -qq -y libfftw3-dev pkg-config libliquid-dev sdcc binutils python python-pip doxygen python-numpy python-scipy python-scapy pyqt5-dev python-pyqt5 libqt5svg5 libqt5svg5-dev libpulse-dev
sudo apt-get install -qq -y libqwtplot3d-qt4-0v5 libqwtplot3d-qt4-dev libqwt-dev libqwt-headers libqwt-qt5-6 libqwt-qt5-dev libgmp-dev libczmq-dev libczmq-dbg gsl-bin libgsl-dev libcomedi-dev

# Again, shitty Raspbian old packages causing conflicts. We need this for Gnuradio.

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

# REMOVED because we need manual compiles due to crappy RPi raspbian packages that crash (looking at gr-osmosdr)
# librtlsdr-dev gnuradio* gr-air-modes gr-radar gr-rds gr-iio gr-hpsdr gr-osmosdr gqrx-sdr

sudo pip3 install -U tensorflow
sudo pip3 install -U mako
sudo pip3 install -U pyyaml

sudo pip install -U mako
sudo pip install -U pyyaml
sudo pip install -U pip
sudo pip install -U platformio
sudo pip install -U -I pyusb


# Update file package ownership
sudo apt-file update

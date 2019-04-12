#!/bin/bash

# Install requisite libraries and repo software
echo "Installing SigInt repository software and libraries"
sudo apt-get install -qq -y build-essential cmake libpcap-dev libpcap0.8 libusb-1.0-0 libnetfilter-queue-dev libnetfilter-queue1 default-jdk apt-file libuhd-dev libboost-all-dev libsndfile1-dev imagemagick libfftw3-dev buffer vim libatlas-base-dev wireshark wireshark-qt swig libusb-dev librtlsdr-dev
sudo apt-get install -qq -y gqrx-sdr gnuradio* gr-air-modes gr-radar gr-rds gr-iio gr-hpsdr gr-osmosdr
sudo apt-get install -qq -y python3-numpy python3-psutil python3-zmq python3-pyqt5 g++ libpython3-dev python3-pip cython3 qt5-default autoconf automake libtool libnl-3-dev libnl-genl-3-dev libssl-dev ethtool shtool rfkill zlib1g-dev libpcap-dev libsqlite3-dev libpcre3-dev libhwloc-dev libcmocka-dev hostapd wpasupplicant tcpdump screen iw
sudo apt-get install -qq -y libfftw3-dev pkg-config libliquid-dev sdcc binutils python python-pip doxygen python-numpy python-scipy python-scapy pyqt5-dev python-pyqt5
sudo apt-get install -qq -y libqwtplot3d-qt4-0v5 libqwtplot3d-qt4-dev libqwt-dev libqwt-headers
sudo pip3 install -U tensorflow
sudo pip install -U pip
sudo pip install -U platformio
sudo pip install -U -I pyusb

# Update file package ownership
sudo apt-file update

#!/bin/bash

# :( This works on x86 Raspbian, but not on real hardware... UGH. I found a guide to compile since I was getting hard blocked by volk not supporting arm
# This is a bunch of SAD.

sudo apt-get install -y gnuradio gnuradio-dev libgnuradio*
sudo apt-get remove -y gr-osmosdr

# Provided osmo is *broken*. 13_osmosdr.sh fixes that

#cd ~/source
#echo "Installing Gnuradio"
#if [ ! -d ~/source/gnuradio ]; then
#    git clone --recursive https://github.com/gnuradio/gnuradio.git --branch maint-3.7
#    cd gnuradio
#else
#    cd gnuradio
#    git pull
#fi
#mkdir build
#cd build
#cmake ../ -DINSTALL_UDEV_RULES=ON
#make -j3
#sudo make install
#cd ~/source

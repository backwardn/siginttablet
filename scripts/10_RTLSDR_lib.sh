#!/bin/bash

cd ~/source
echo "Installing RTL_SDR library"
if [ ! -d ~/source/rtl-sdr ]; then
    git clone git://git.osmocom.org/rtl-sdr.git
    cd rtl-sdr
else
    cd rtl-sdr
    git pull
fi
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make -j3
sudo make install
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
sudo sh -c "echo dvb_usb_rtl28xxu > /etc/modprobe.d/Blacklist-rtl.conf"
cd ~/source

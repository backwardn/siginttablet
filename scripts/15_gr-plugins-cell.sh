#!/bin/bash

cd ~/source

# GSM Gnuradio module
# NEEDS: GNU Radio with header files
# NEEDS: development tools: git, cmake, autoconf, libtool, pkg-config, g++, gcc, make, libc6 with headers, libcppunit with headers, swig, doxygen, liblog4cpp with headers, python-scipy
# NEEDS: gr-osmosdr
# NEEDS: libosmocore with header files
echo "Installing GSM Gnuradio modules."
if [ ! -d ~/source/gr-gsm ]; then
    git clone https://git.osmocom.org/gr-gsm
    cd gr-gsm
else
    cd gr-gsm
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
sudo ldconfig
cd ~/source

# GSM IMSI Catcher
# NEEDS:
echo "Installing IMSI Catcher."
if [ ! -d ~/source/IMSI-catcher ]; then
    git clone https://github.com/Oros42/IMSI-catcher.git
    cd IMSI-catcher
else
    cd IMSI-catcher
    git pull
fi
cd ~/source

# LTE Gnuradio module
# NEEDS: ?????????????
echo "Installing LTE Gnuradio modules."
if [ ! -d ~/source/gr-lte ]; then
    git clone https://github.com/kit-cel/gr-lte.git
    cd gr-lte
else
    cd gr-lte
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~/source


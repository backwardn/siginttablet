#!/bin/bash

# Start a transcript
script ~/sigint_transcript_$(date +%F).txt

# Remove unneeded software from device
( exec ./01_remove_packages.sh )

# Enable and start SSH
( exec ./02_enable_ssh.sh )

# Now we update the base system
( exec ./03_upgrade_system.sh )

# Install requisite libraries and repo software
( exec ./04_install_software_from_repo.sh )

# Set up sourcecode location for most applications
( exec ./05_directory_setup.sh )

# Set up JAVA_HOME
( exec ./06_set_ENV_vars.sh )

# RPI transmit library
echo "Installing RPITX transmit library"
if [ ! -d ~/source/rpitx ]; then
    git clone https://github.com/F5OEO/rpitx.git
    cd rpitx
else
    cd rpitx
    git pull
fi
./install.sh
cd ~/source


# Spy mic detecter
# NEEDS: rtl-sdr
echo "Installing Salamandra spy mic detector"
if [ ! -d ~/source/Salamandra ]; then
    git clone https://github.com/eldraco/Salamandra.git
else
    cd Salamandra
    git pull
    cd ~/source
fi


# Radio protocol analyzers
# NEEDS: python3-numpy python3-psutil python3-zmq python3-pyqt5 g++ libpython3-dev python3-pip cython3
echo "Installing Universal Radio Hacker"
# sudo pip3 install urh DOESNT WORK ON RPI :(
if [ ! -d ~/source/urh ]; then
    git clone https://github.com/jopohl/urh.git
    cd urh
else
    cd urh
    git pull
fi
sudo python3 setup.py install


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
cd build
cmake ..
make -j4
sudo make install
cd ~/source


# Nordic chipset hacker
# NEEDS: sdcc binutils python python-pip
# NEEDS: sudo pip install -U pip platformio
# NEEDS: sudo pip install -U -I pyusb
echo "Installing Mousejack firmware and tools"
if [ ! -d ~/source/mousejack ]; then
    git clone https://github.com/BastilleResearch/mousejack.git
    cd mousejack
else
    cd mousejack
    git pull
fi
git submodule init
git submodule update
cd ~/source


# Nordic Gnuradio module
# NEEDS:
echo "Installing Mousejack Gnuradio modules."
if [ ! -d ~/source/gr-nordic ]; then
    git clone https://github.com/BastilleResearch/gr-nordic.git
    cd gr-nordic
else
    cd gr-nordic
    git pull
fi
mkdir build
cd build
cmake ..
make
sudo make install
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


# SigInt toolbox for gnuradio
# NEEDS: GNU Radio 3.7.9.3
# NEEDS: gr-analog, gr-blocks, gr-channel, gr-filter
# NEEDS: QT4
# NEEDS: QWT 6.1.0
# NEEDS: QwtPlot3D
# NEEDS: TensorFlow 0.12
echo "Installing Signal idenitifier gr-inspector in gnu radio."
if [ ! -d ~/source/gr-inspector ]; then
    git clone https://github.com/gnuradio/gr-inspector.git
    cd gr-inspector
else
    cd gr-inspector
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~/source


# gr-air-modes for gnuradio
echo "Installing gr-air-modes in gnu radio."
if [ ! -d ~/source/gr-air-modes ]; then
    git clone https://github.com/bistromath/gr-air-modes.git
    cd gr-air-modes
else
    cd gr-air-modes
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~/source


# multimon-ng plugins
echo "Installing multimon-ng."
if [ ! -d ~/source/multimon-ng ]; then
    git clone https://github.com/EliasOenal/multimon-ng.git
    cd multimon-ng
else
    cd multimon-ng
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~/source


# rtl_433 telemetry
echo "Installing rtl_433"
if [ ! -d ~/source/rtl_433 ]; then
    git clone https://github.com/merbanan/rtl_433.git
    cd rtl_433
else
    cd rtl_433
    git pull
fi
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~/source


## ShinySDR - DONT USE, uses too much resources for RPi 3b+
#echo "Installing Signal idenitifier gr-inspector in gnu radio."
#if [ ! -d ~/source/shinysdr ]; then
#    git clone https://github.com/kpreid/shinysdr.git
#    cd shinysdr
#    ./fetch-js-deps.sh
#else
#    cd shinysdr
#    git pull
#    ./fetch-js-deps.sh
#fi
#python setup.py build
#sudo python setup.py install
#cd ~/source


# GQRX
# NEEDS: A pile of stuff!
echo "Installing GQRX"
if [ ! -d ~/source/gqrx ]; then
    git clone https://github.com/csete/gqrx.git
    cd gqrx
else
    cd gqrx
    git pull
fi
mkdir build
cd build
cmake ..
make -j1
sudo make install
cd ~/source


# BTLE and wifi reconnsaisance and hacking
echo "Installing Bettercap for Wifi/BT/BTLE"
go get github.com/bettercap/bettercap
cd $GOPATH/src/github.com/bettercap/bettercap
make build 
sudo make install
cd ~/source


# Install TempestSDR
echo "Installing TempestSDR"
if [ ! -d ~/source/TempestSDR ]; then
    git clone https://github.com/hennichodernich/TempestSDR.git
    cd TempestSDR/JavaGUI
else
    cd TempestSDR
    git pull
    cd JavaGUI
fi
sed -i 's/PLUGINS += TSDRPlugin_HackRF/#PLUGINS += TSDRPlugin_HackRF/g' makefile
make all


# Install SDRtrunk
echo "Installing SDRTrunk"
if [ ! -d ~/source/sdrtrunk ]; then
    git clone https://github.com/DSheirer/sdrtrunk.git
    cd sdrtrunk
else
    cd sdrtrunk
fi
# Insert sketchy way the program thinks we're on x86 or x64..... :/
cd ~/source


# Install and configure menu items
sudo cp ./start_menu_items/*.desktop /usr/share/applications/

# Refresh the GUI to see the new menu items
lxpanelctl restart


# Exits and saves the transcript command
exit

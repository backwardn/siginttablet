#!/bin/bash

# Remove unneeded software from device
echo "Removing default RasPi packages that don't apply to SigInt"
sudo apt-get remove -qq wolfram-engine realvnc-vnc-viewer minecraft-pi nodered bluej geany greenfoot scratch scratch2 python-sense-emu python3-sense-emu sonic-pi python3-thonny python3-thonny-pi smartsim libreoffice* claws-mail python-games 
sudo apt-get autoremove -qq -y

# Now we update the base system
echo "Updating/Upgrading base system"
sudo apt-get update -qq
sudo apt-get upgrade -qq

# Install requisite libraries and repo software
echo "Installing SigInt repository software and libraries"
sudo apt-get install -qq -y build-essential cmake libpcap-dev libpcap0.8 libusb-1.0-0 libnetfilter-queue-dev libnetfilter-queue1 default-jdk apt-file libuhd-dev libboost-all-dev libsndfile1-dev imagemagick libfftw3-dev buffer vim libatlas-base-dev wireshark wireshark-qt swig
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

# Set up sourcecode location for most applications
echo "Setting up ~/source as base directory"
if [ ! -d ~/source ]; then
    mkdir ~/source
fi

if [ ! -d ~/.grc_gnuradio/ ]; then
    mkdir ~/.grc_gnuradio/
fi

if [ ! -d ~/.gnuradio/ ]; then
    mkdir ~/.gnuradio/
fi

cd ~/source

# Set up JAVA_HOME
echo "Setting up Java env."
if grep -q JAVA_HOME ~/.bash_profile; then
    echo "JAVA_HOME already set. Ignoring."
else
    echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))" >> ~/.bash_profile
    echo "JAVA_HOME set to $(dirname $(dirname $(readlink -f $(which javac))))"
fi


# Set up GOLANG and variables
echo "Downloading, installing, and setting up env for GOLANG"
if wget -c https://dl.google.com/go/go1.12.1.linux-armv6l.tar.gz; then
    sudo tar -C /usr/local -xzf go1.12.1.linux-armv6l.tar.gz

    if [ ! -d ~/go ]; then
         mkdir ~/go
    fi

    if grep -q GOPATH ~/.bash_profile; then
        echo "GOPATH already set. Ignoring."
    else
        echo "export GOPATH=$HOME/go" >> ~/.bash_profile
        echo "GOPATH set to ~/go"
    fi

    if grep -q /usr/local/go/bin ~/.bash_profile; then
        echo "PATH already set. Ignoring."
    else
        echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bash_profile
        echo "PATH set to include /usr/local/go/bin"
    fi

    source ~/.bash_profile
fi

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
cd urh
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
echo "installing Inspectrum protocol analoyzer"
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
    mkdir sdrtrunk
    cd sdrtrunk
else
    cd sdrtrunk
fi
wget -c https://github.com/DSheirer/sdrtrunk/releases/download/v0.4.0-alpha.9/sdr-trunk-0.4.0-alpha.9-linux-x64.zip
unzip sdr-trunk-0.4.0-alpha.9-linux-x64.zip



# Install and configure menu items
sudo cp ./start_menu_items/*.desktop /usr/share/applications/

# Refresh the GUI to see the new menu items
lxpanelctl restart

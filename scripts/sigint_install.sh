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

# RTL_SDR library
( exec ./07_RTLSDR_lib.sh )

# Gnuradio
( exec ./08_gnuradio.sh )

# RPI transmit library
( exec ./09_RPITX_lib.sh )

# RTL-SDR libs
( exec ./10_RTLSDR_lib.sh )

# Mousejack and gr-nordic for keyboard/mouse infiltration
( exec ./11_MOUSEJACK_tools.sh )

# SoapySDR install
( exec ./12_SoapySDR.sh )

# Various GR- plugins
( exec ./13_gr-plugins.sh )


# Spy mic detecter, requires RTL-SDR
( exec ./98_salamandra.sh )

# Radio protocol analyzers
( exec ./99_proto_analyzer.sh )








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

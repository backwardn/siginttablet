#!/bin/bash

# Start a transcript
script ~/sigint_transcript_$(date +%F).txt

# Get the location of this script, wherever the user chose to git clone it to
SIGINT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Remove unneeded software from device
( exec ./01_remove_packages.sh )
cd $SIGINT_PATH

# Enable and start SSH
( exec ./02_enable_ssh.sh )
cd cd $SIGINT_PATH

# Now we update the base system
( exec ./03_upgrade_system.sh )
cd $SIGINT_PATH

# Install requisite libraries and repo software
( exec ./04_install_software_from_repo.sh )
cd $SIGINT_PATH

# Set up sourcecode location for most applications
( exec ./05_directory_setup.sh )
cd $SIGINT_PATH

# Set up JAVA_HOME
( exec ./06_set_ENV_vars.sh )
cd $SIGINT_PATH



# Major libraries and software

# RTL_SDR library
( exec ./07_RTLSDR_lib.sh )
cd $SIGINT_PATH

# Gnuradio
( exec ./08_gnuradio.sh )
cd $SIGINT_PATH

# RPI transmit library
( exec ./09_RPITX_lib.sh )
cd $SIGINT_PATH

# RTL-SDR libs
( exec ./10_RTLSDR_lib.sh )
cd $SIGINT_PATH

# Mousejack and gr-nordic for keyboard/mouse infiltration
( exec ./11_MOUSEJACK_tools.sh )
cd $SIGINT_PATH

# SoapySDR install
( exec ./12_SoapySDR.sh )
cd $SIGINT_PATH

# Various GR- plugins
( exec ./13_gr-plugins.sh )
cd $SIGINT_PATH

# GQRX, warning, this takes a *LOT* of time
( exec ./14_GQRX.sh )
cd $SIGINT_PATH


# Individual programs that are not dependancies on other packages

# Install dump1090, because it's awesome
( exec ./92_dump1090.sh )
cd $SIGINT_PATH

# Sdrtrunk trunking radio receiver.... BROKEN
#( exec ./93_sdrtrunk.sh )
#cd $SIGINT_PATH

# Install TempestSDR
( exec ./94_TempestSDR.sh )
cd $SIGINT_PATH

# Installing Bettercap - BTLE and wifi reconnsaisance and hacking
( exec ./95_bettercap.sh )
cd $SIGINT_PATH

# Install rtl_433 sensor library
( exec ./96_rtl_433.sh )
cd $SIGINT_PATH

# Install MultiMon-NG
( exec ./97_MultiMon-NG.sh )
cd $SIGINT_PATH

# Spy mic detecter, requires RTL-SDR
( exec ./98_salamandra.sh )
cd $SIGINT_PATH

# Radio protocol analyzers
( exec ./99_proto_analyzer.sh )
cd $SIGINT_PATH


# Install and configure menu items
sudo cp ./start_menu_items/*.desktop /usr/share/applications/

# Refresh the GUI to see the new menu items
lxpanelctl restart


# Exits and saves the transcript command
exit

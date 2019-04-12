#!/bin/bash

# Remove unneeded software from device
echo "Removing default RasPi packages that don't apply to SigInt"
sudo apt-get remove -qq wolfram-engine realvnc-vnc-viewer minecraft-pi nodered bluej geany greenfoot scratch scratch2 python-sense-emu python3-sense-emu sonic-pi python3-thonny python3-thonny-pi smartsim libreoffice* claws-mail python-games 
sudo apt-get autoremove -qq -y

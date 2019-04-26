#!/bin/bash

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

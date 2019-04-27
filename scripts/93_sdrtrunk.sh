#!/bin/bash

cd ~/source
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

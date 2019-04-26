#!/bin/bash

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

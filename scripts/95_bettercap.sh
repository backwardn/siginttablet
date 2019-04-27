#!/bin/bash

# BTLE and wifi reconnsaisance and hacking
echo "Installing Bettercap for Wifi/BT/BTLE"
go get github.com/bettercap/bettercap
cd $GOPATH/src/github.com/bettercap/bettercap
make build 
sudo make install
cd ~/source


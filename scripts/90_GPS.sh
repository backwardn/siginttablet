#!/bin/bash

echo "This script sets up GPS for a Raspberry Pi using serial pins. If you're using non-raspi platform, raspi-config will error out."
echo "You will also need to edit /etc/default/gps to the right USB device if using USB"

sudo apt-get install -qq -y gpsd gpsd-clients
sudo sed -i 's#DEVICES=””#DEVICES=”/dev/ttyAMA0”#g' /etc/default/gps
sudo raspi-config nonint do_serial 1
sudo systemctl enable gpsd
sudo systemctl start gpsd

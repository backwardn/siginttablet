#!/bin/bash

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




#!/bin/bash

cd ~/source
# Set up JAVA_HOME
echo "Setting up Java env."
if grep -q JAVA_HOME ~/.bash_profile; then
    echo "JAVA_HOME already set. Ignoring."
else
    echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))" >> ~/.bash_profile
    echo "JAVA_HOME set to $(dirname $(dirname $(readlink -f $(which javac))))"
fi

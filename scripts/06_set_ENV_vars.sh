#!/bin/bash

# Set up JAVA_HOME
echo "Setting up Java env."
if grep -q JAVA_HOME ~/.bash_profile; then
    echo "JAVA_HOME already set. Ignoring."
else
    echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))" >> ~/.bash_profile
    echo "JAVA_HOME set to $(dirname $(dirname $(readlink -f $(which javac))))"
fi


# Set up GOLANG and variables
echo "Downloading, installing, and setting up env for GOLANG"
if wget -c https://dl.google.com/go/go1.12.1.linux-armv6l.tar.gz; then
    sudo tar -C /usr/local -xzf go1.12.1.linux-armv6l.tar.gz

    if [ ! -d ~/go ]; then
         mkdir ~/go
    fi

    if grep -q GOPATH ~/.bash_profile; then
        echo "GOPATH already set. Ignoring."
    else
        echo "export GOPATH=$HOME/go" >> ~/.bash_profile
        echo "GOPATH set to ~/go"
    fi

    if grep -q /usr/local/go/bin ~/.bash_profile; then
        echo "PATH already set. Ignoring."
    else
        echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bash_profile
        echo "PATH set to include /usr/local/go/bin"
    fi

    source ~/.bash_profile
fi

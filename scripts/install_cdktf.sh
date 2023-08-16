#!/bin/bash

# Check RedHat
if [ -e /etc/redhat-release ]; then
    REDHAT_BASED=true
fi

# Install packages
if [ ${REDHAT_BASED} ]; then
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo yum -y install nodejs golang
else
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get -y install nodejs golang
fi

sudo npm install -g cdktf-cli

#!/bin/bash

#cp /etc/apt/sources.list /etc/apt/sources.list.bak 
#sudo sed -i -re 's/([a-z]{2}.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
#sudo apt update
#sudo apt install openssh-server
#sudo apt install git
#sudo apt install make


#Improved script

# Backup sources list
cp /etc/apt/sources.list /etc/apt/sources.list.bak 

# Determine Ubuntu version
if grep -q "eoan" /etc/os-release; then
    UBUNTU_VERSION="eoan"
    REPLACEMENT="old-releases.ubuntu.com"
elif grep -q "focal" /etc/os-release; then
    UBUNTU_VERSION="focal"
    REPLACEMENT="security.ubuntu.com"
else
    echo "Unsupported Ubuntu version"
    exit 1
fi

# Update sources list
sudo sed -i -re "s/([a-z]{2}.)?archive.ubuntu.com|security.ubuntu.com|old-releases.ubuntu.com/$REPLACEMENT/g" /etc/apt/sources.list

# Update and install packages
sudo apt update
sudo apt install -y openssh-server git make

echo "Setup completed for Ubuntu $UBUNTU_VERSION"

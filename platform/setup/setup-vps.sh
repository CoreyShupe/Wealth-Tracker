#!/bin/bash

# Create the new user (change 'fakeuser' to your desired username)
sudo useradd -m -s /usr/sbin/nologin fakeuser

# Check if the user was created successfully
if [ $? -ne 0 ]; then
    echo "Failed to add new user."
    exit 1
fi

# Add the new user to the sudo group
sudo usermod -aG sudo fakeuser

echo "fakeuser ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# Setup new user
sudo -u fakeuser ./setup/setup-fakeuser.sh

export CURRENT_DIR=$(pwd)

sudo usermod -aG docker fakeuser

cd $CURRENT_DIR

sudo -u fakeuser ./setup/ensure-user.sh

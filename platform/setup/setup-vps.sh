#!/bin/bash

cd "$( dirname "$( readlink -f "$0" )" )"
export CURRENT_DIR=$(pwd)

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
sudo -u fakeuser ./setup-fakeuser.sh

sudo usermod -aG docker fakeuser

cd $CURRENT_DIR

sudo -u fakeuser ./ensure-user.sh

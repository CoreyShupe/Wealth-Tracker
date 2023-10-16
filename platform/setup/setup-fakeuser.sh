cd ~

sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf

export LOCK_TIMEOUT=60

# Setup nginx, nodejs, and npm
sudo apt-get -y -o DPkg::Lock::Timeout=$LOCK_TIMEOUT update
sudo apt-get -y -o DPkg::Lock::Timeout=$LOCK_TIMEOUT install \
    nginx \
    nodejs \
    npm

sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'OpenSSH'
echo "y" | sudo ufw enable
sudo ufw status

# Install Docker
sudo apt-get -y -o DPkg::Lock::Timeout=$LOCK_TIMEOUT install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
	| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get -y -o DPkg::Lock::Timeout=$LOCK_TIMEOUT update
sudo apt-get -y -o DPkg::Lock::Timeout=$LOCK_TIMEOUT install docker-ce docker-compose-plugin

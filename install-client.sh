#!/bin/bash

# exit on error
set -e

DEVICE_ID=$1
TOKEN=$2
SERVER_URL=$3 #agri-gaia.localhost
#SERVER_URL=agri-gaia.duckdns.org

mkdir -p hzn
cd hzn

# contact backend to get the config file
if [ ! -e agent-install.cfg ]
then
    echo "agent-install.cfg not found. Downloading..."
    wget -O agent-install.cfg https://api.${SERVER_URL}/edge-devices/${DEVICE_ID}/config?token=${TOKEN}
else
    echo "agent-install.cfg found. Skipping Download!"
fi

# download agent-install.sh
wget -O agent-install.sh https://raw.githubusercontent.com/open-horizon/anax/master/agent-install/agent-install.sh
chmod +x ./agent-install.sh

# run Open Horizon Agent Installation
# b: skip prompts
# s: skip registration
sudo -sE ./agent-install.sh -b -s -i https://github.com/open-horizon/anax/releases

# set env values
eval export $(cat agent-install.cfg)

# register
hzn register

# contact backend to notify successful registration
curl -X POST https://api.${SERVER_URL}/edge-devices/${DEVICE_ID}/register?token=${TOKEN}

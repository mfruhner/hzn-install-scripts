#!/bin/bash

DEVICE_ID=$1
TOKEN=$2
# install deps
sudo apt update
sudo apt install -yqf wget curl

mkdir hzn && cd hzn

# contact backend to get the config file
wget -O agent-install.cfg https://api.agri-gaia.localhost/edge-devices/${DEVICE_ID}/config?token=${TOKEN}

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
curl -X POST https://api.agri-gaia.localhost/edge-devices/${DEVICE_ID}/register?token=${TOKEN}

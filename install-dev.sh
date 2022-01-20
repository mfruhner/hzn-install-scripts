#!/bin/bash

TOKEN=$1
# install deps
apt update
apt install -yqf wget curl

mkdir hzn && cd hzn

# contact backend to get the config file
wget --method=PATCH -O agent-install.cfg https://api.agri-gaia.localhost/edge-devices/config?token=${TOKEN}

# download agent-install.sh
wget -O agent-install.sh https://raw.githubusercontent.com/open-horizon/anax/master/agent-install/agent-install.sh
chmod +x ./agent-install.sh

# run Open Horizon Agent Installation
# b: skip prompts
# s: skip registration
./agent-install.sh -b -s -i https://github.com/open-horizon/anax/releases

# set env values
eval export $(cat agent-install.cfg)

# register
hzn register

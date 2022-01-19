#!/bin/bash

TOKEN=$1
# install deps
sudo apt update
sudo apt install -yqf wget curl

mkdir hzn && cd hzn

# contact backend to get the config file
wget -O agent-install.cfg https://api.agri-gaia.localhost/edge-devices/config

# download agent-install.sh
wget -O agent-install.sh https://raw.githubusercontent.com/open-horizon/anax/master/agent-install/agent-install.sh
chmod +x ./agent-install.sh

# run Open Horizon Agent Installation
# b: skip prompts
# s: skip registration
sudo -sE ./agent-install.sh -b -s

# register
# TODO

# old
#export INPUT_FILE_PATH=$1
#export HZN_EXCHANGE_URL=$2
#export HZN_FSS_CSSURL=$3
#export HZN_AGBOT_URL=$4
#export HZN_ORG_ID=$5
#export HZN_EXCHANGE_USER_AUTH=$6
#export HZN_NODE_ID=$7
# export HZN_EXCHANGE_NODE_AUTH
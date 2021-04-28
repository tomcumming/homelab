#!/bin/bash

source ./secrets.sh

# Shared config
LG_WAN=192.168.122.180 # soon...

LG_IP=10.0.0.100
PI1_IP=10.0.0.1

LG_WG_PUBLIC="zVYPudg62+rsx3yEflDFpJncAXehRCET7ukpU5hZ5zI="
PI1_WG_PUBLIC="P4kbGvEMkvDda27At1Bdf1GQPf7skKgkxd7ncckA9RY="

# Refresh ssh public keys
sed -i '/ mail@tomcumming.co.uk$/d' ~/.ssh/authorized_keys
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILeuUvkmV6/j0m0bd2Cay6PmjFKJZ+f/AScEbMC16y0h mail@tomcumming.co.uk' >> ~/.ssh/authorized_keys

# Add shared packages
apt-get update
apt-get install -y wireguard

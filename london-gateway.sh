#!/bin/bash

source ./shared.sh

# Wireguard
WIREGUARD_CFG="[Interface]
PrivateKey = $LG_WG_PRIVATE
Address = $LG_IP
ListenPort = 51820

[Peer]
PublicKey = $PI1_WG_PUBLIC
AllowedIPs = $PI1_IP
"
echo "$WIREGUARD_CFG" > /etc/wireguard/wg0.conf
wg-quick down wg0
wg-quick up wg0
systemctl enable wg-quick@wg0

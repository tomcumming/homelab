#!/bin/bash

source ./shared.sh

# Wireguard
$WIREGUARD_CFG="[Interface]
PrivateKey = $PI1_WG_PRIVATE
Address = $PI1_IP
ListenPort=51820

[Peer]
PublicKey = $LG_WG_PUBLIC
Endpoint = $LG_WAN:51820
AllowedIPs = $LG_IP
PersistentKeepalive = 25
"
echo "$WIREGUARD_CFG" > /etc/wireguard/wg0.conf
wg-quick down wg0
wg-quick up wg0
systemctl enable wg-quick@wg0

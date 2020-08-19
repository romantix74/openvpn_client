#!/bin/bash

#
# Run the OpenVPN client

if [ "$DEBUG" == "1" ]; then
  set -x
fi

set -e

# nat
iptables -t nat -A POSTROUTING -j MASQUERADE

cd $OPENVPN

echo "Running 'openvpn'"
exec openvpn --config /etc/openvpn/openvpn.conf --remote $OPENVPN_SERVER $OPENVPN_PORT --proto $OPENVPN_PROTO
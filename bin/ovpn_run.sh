#!/bin/bash

#
# Run the OpenVPN client

if [ "$DEBUG" == "1" ]; then
  set -x
fi

set -e

cd $OPENVPN

echo "Running 'openvpn'"
exec openvpn --config /etc/openvpn/openvpn.conf --remote $OPENVPN_SERVER 443
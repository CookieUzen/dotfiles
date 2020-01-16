#!/bin/bash

str=$(expressvpn status | head -n 1 | tail -n 1 | sed 's/\x1B\[[0-9;]*[JKmsu]//g')

case "$str" in
    "Not connected")
        vpn="VPN Off";;

    "Connecting...")
        vpn="Connecting";;

    "Reconnecting...")
        vpn="Reconnecting";;

    "Unable to connect.")
        vpn="Fail";;

    *)
        vpn=$(echo "$str" | sed -r "s/Connected to //");;
esac

echo "   $vpn"

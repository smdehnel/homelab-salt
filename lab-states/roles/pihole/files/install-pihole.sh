#!/bin/bash
set -e

# install unattended, but let us manage dnsmasq extras with salt
curl -sSL https://install.pi-hole.net | PIHOLE_SKIP_OS_CHECK=true bash /dev/stdin --unattended

# set password if provided
if [ -n "$1" ]; then
  pihole -a -p "$1"
fi

# make sure service is enabled
systemctl enable pihole-FTL
systemctl restart pihole-FTL

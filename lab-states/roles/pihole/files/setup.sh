#!/bin/bash
set -e
curl -sSL https://install.pi-hole.net | bash /dev/stdin --unattended
pihole -a -p 'changeme'
systemctl enable pihole-FTL
systemctl restart pihole-FTL

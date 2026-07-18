#!/usr/bin/env bash
set -Eeuo pipefail

# Documentation example only. Review interface and addresses before use.
profile=${1:-lpic-static}
interface=${2:-eth0}
address=${3:-192.0.2.10/24}
gateway=${4:-192.0.2.1}
dns=${5:-192.0.2.53}

printf 'Planned profile: %s\nInterface: %s\nAddress: %s\nGateway: %s\nDNS: %s\n' \
  "$profile" "$interface" "$address" "$gateway" "$dns"

cat <<EOF
sudo nmcli connection add type ethernet ifname "$interface" con-name "$profile" \\
  ipv4.method manual ipv4.addresses "$address" ipv4.gateway "$gateway" ipv4.dns "$dns"
sudo nmcli connection up "$profile"
EOF

printf 'Commands were printed, not executed. Keep console access before changing remote networking.\n'

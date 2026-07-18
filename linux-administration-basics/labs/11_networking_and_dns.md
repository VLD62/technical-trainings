# Lab 11 – Networking and DNS

## Objectives

- Inspect interfaces, addresses, routes, sockets, and NetworkManager profiles
- Troubleshoot connectivity in layers
- Query DNS using multiple tools
- Understand persistent vs runtime configuration

## Baseline

```bash
ip -brief link
ip -brief address
ip route
ip -6 route
ss -lntup
hostnamectl
```

Record the active interface, address, prefix, default route, and hostname.

## NetworkManager

```bash
nmcli device status 2>/dev/null || true
nmcli connection show 2>/dev/null || true
```

If NetworkManager manages the active connection, inspect the profile without changing it:

```bash
PROFILE=$(nmcli -t -f NAME connection show --active | head -n1)
nmcli connection show "$PROFILE"
```

## Layered Troubleshooting

Choose a safe destination and perform:

```bash
ip link show
ip address show
ip route get 1.1.1.1
ping -c 3 127.0.0.1
ping -c 3 "$(ip route | awk '/default/ {print $3; exit}')"
ping -c 3 1.1.1.1
getent hosts example.org
```

ICMP can be filtered. Interpret failure in context rather than treating ping as absolute proof.

## Paths and Ports

```bash
tracepath example.org 2>/dev/null || traceroute example.org
ss -lnt
nc -vz example.org 443
```

Use only authorized targets.

## DNS

```bash
cat /etc/nsswitch.conf | grep '^hosts:'
cat /etc/resolv.conf
dig example.org A
dig example.org AAAA
host example.org
getent ahosts example.org
```

Compare direct DNS queries with `getent`, which follows system name-service policy.

## CIDR Practice

For each network, calculate network address, usable range concept, and broadcast where applicable:

```text
192.168.10.34/24
10.20.30.40/16
172.16.5.9/28
2001:db8:1234::10/64
```

## Validation

- You can distinguish runtime interface state from persistent profile configuration.
- You can identify the default route.
- You can explain the purpose of `/etc/hosts`, `/etc/resolv.conf`, and `/etc/nsswitch.conf`.
- You can isolate link, address, route, DNS, and service-layer failures.

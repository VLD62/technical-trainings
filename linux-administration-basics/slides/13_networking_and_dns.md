---
marp: true
theme: default
paginate: true
---

# Networking and Client-Side DNS

### LPIC-1 objectives 109.1–109.4

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Protocol Fundamentals

- IPv4 uses 32-bit addresses; IPv6 uses 128-bit addresses.
- CIDR notation expresses prefix length.
- TCP is connection-oriented; UDP is datagram-oriented; ICMP supports control and diagnostics.
- Know common service ports listed in the objectives.

---

## Host Configuration

- A host needs addresses, routes, name resolution, and usually a default gateway.
- `/etc/hostname` stores a static hostname on many systems.
- `/etc/hosts` provides local static name mappings.
- `/etc/nsswitch.conf` controls lookup order.

---

## NetworkManager

- `nmcli device status` shows device state.
- `nmcli connection show` lists profiles.
- Persistent changes should modify connection profiles, not only runtime interface state.
- Use checkpoints or console access for remote changes.

---

## iproute2

- `ip address` manages addresses.
- `ip link` manages interface state.
- `ip route` manages routing.
- `ss` inspects sockets and replaces many `netstat` use cases.

---

## Troubleshooting Layers

- Check link state.
- Check addressing and prefix.
- Check routes and gateway reachability.
- Check DNS resolution.
- Check ports, services, and policy controls.

---

## Diagnostic Commands

- Use `ping` or `ping6` for reachability where ICMP is allowed.
- Use `tracepath` or `traceroute` to inspect path behavior.
- Use `ss` for listeners and connections.
- Use `nc` for simple TCP or UDP testing.

---

## Client-Side DNS

- `/etc/resolv.conf` identifies resolver behavior but may be managed dynamically.
- `dig` and `host` query DNS.
- `getent hosts` follows the configured name-service order.
- systemd-resolved may provide a local stub resolver.

---

## Practice

- Run the commands in a disposable lab.
- Capture expected and unexpected output.
- Explain what changed and how to reverse it.
- Complete the matching lab and checklist items.

---

## Key Takeaways

- Understand the concept before memorizing options.
- Know the important commands, files, and failure modes.
- Prefer safe, observable, reversible practice.
- Review the official LPIC-1 objectives as the source of truth.

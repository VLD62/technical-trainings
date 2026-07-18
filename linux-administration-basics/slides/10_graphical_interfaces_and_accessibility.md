---
marp: true
theme: default
paginate: true
---

# Graphical Interfaces and Accessibility

### LPIC-1 objectives 106.1–106.3

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Linux Graphics Stack

- Applications connect to a display server or compositor.
- X11 uses a client-server architecture.
- Wayland is a modern protocol and architecture used by many desktops.
- Desktop environments combine window management, panels, settings, and applications.

---

## X11 Concepts

- `DISPLAY` identifies the target display.
- `xauth` manages authorization cookies.
- `xhost` changes access controls and should be used cautiously.
- X configuration may use `/etc/X11/xorg.conf` and drop-in directories.

---

## Desktop Environments

- GNOME, KDE Plasma, and Xfce are common environments.
- A display manager provides graphical login.
- A window manager controls placement and decoration.
- Different environments can coexist but increase complexity.

---

## Remote Desktop Awareness

- VNC transmits a graphical desktop.
- RDP is widely used across platforms.
- SPICE is common in virtualization.
- X11 forwarding can display individual remote applications.

---

## Accessibility

- High contrast and large text improve visibility.
- Screen readers expose interface content audibly.
- Screen magnifiers enlarge content.
- On-screen keyboards and alternative input support motor accessibility.

---

## Operational Perspective

- Know the components and configuration locations.
- Graphical troubleshooting still relies on logs, processes, permissions, environment variables, and services.
- Do not expose remote desktop services without authentication and network controls.

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

# Exam 102-500 Practice Questions

Complete the questions before opening the answer section. These are original study questions, not real examination questions.

## Questions

1. What is the difference between a shell variable and an exported environment variable?
2. Which variable controls executable command lookup?
3. Which file commonly customizes an interactive Bash shell for a user?
4. What does a shebang do?
5. What does an exit status of zero conventionally mean?
6. Which operator runs the next command only when the previous one succeeds?
7. Why should variable expansions usually be quoted?
8. What does `DISPLAY` identify in X11?
9. Name three major Linux desktop environments.
10. Which protocol is commonly used for remote graphical desktops and is native to Windows ecosystems?
11. Where are local account metadata entries stored?
12. Where are protected password hashes normally stored?
13. Which command queries configured identity sources rather than only local files?
14. Which command adds a user to a supplementary group without replacing existing memberships?
15. Which command displays password aging information?
16. What is the main distinction between cron and at?
17. What activates a systemd timer target operation?
18. Why is `LANG=C` useful in scripts?
19. Which command shows system timezone and NTP state on systemd systems?
20. Which Chrony command shows synchronization tracking?
21. Which journal command filters messages for a service unit?
22. Which command writes a test message to the logging system?
23. What is logrotate used for?
24. Name three common MTAs.
25. Which printing system is commonly used on Linux?
26. What does `/24` mean in IPv4 CIDR notation?
27. Which protocol is connection-oriented: TCP or UDP?
28. Which file maps service names to well-known ports locally?
29. Which `ip` subcommand displays routes?
30. Which command lists listening TCP and UDP sockets?
31. Which NetworkManager command lists connection profiles?
32. Which file controls the order of host lookup sources?
33. Which command queries DNS directly and shows detailed records?
34. Why can `getent hosts` differ from `dig`?
35. Which command safely edits sudo policy?
36. How can you find files with SUID or SGID bits?
37. What is the difference between an SSH host key and a user key?
38. Where are authorized SSH public keys commonly stored for a user?
39. What does encryption provide that a digital signature does not?
40. What does a digital signature provide?

---

## Answer Key

1. Exported variables are inherited by child processes.
2. `PATH`.
3. `~/.bashrc`.
4. It identifies the interpreter used to execute a script.
5. Success.
6. `&&`.
7. To avoid unintended word splitting and pathname expansion.
8. The target X display server and screen.
9. Examples: GNOME, KDE Plasma, and Xfce.
10. RDP.
11. `/etc/passwd`.
12. `/etc/shadow`.
13. `getent`.
14. `usermod -aG group user`.
15. `chage -l user`.
16. Cron schedules recurring jobs; at schedules one-time jobs.
17. A timer unit activates its associated service or specified unit.
18. It makes many command messages and sorting behavior predictable and locale-neutral.
19. `timedatectl`.
20. `chronyc tracking`.
21. `journalctl -u unit-name`.
22. `logger`.
23. Rotating, compressing, retaining, and removing log files according to policy.
24. Postfix, Sendmail, and Exim.
25. CUPS.
26. The first 24 bits are the network prefix.
27. TCP.
28. `/etc/services`.
29. `ip route`.
30. `ss -lntup`.
31. `nmcli connection show`.
32. `/etc/nsswitch.conf`.
33. `dig`.
34. `getent` follows system name-service policy, while `dig` queries DNS.
35. `visudo`.
36. For example: `find / -xdev -type f -perm /6000 2>/dev/null`.
37. A host key identifies the server; a user key authenticates a user or client identity.
38. `~/.ssh/authorized_keys`.
39. Confidentiality.
40. Integrity and authenticity verification, assuming trusted key identity.

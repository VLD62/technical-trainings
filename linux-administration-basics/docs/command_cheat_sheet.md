# Linux Administration Command Cheat Sheet

Use this as a recall aid after practicing the commands. It is not a substitute for understanding options and side effects.

## System and Hardware

```bash
uname -a
cat /etc/os-release
lscpu
lsmem
lsblk -f
lspci
lsusb
lsmod
modinfo module_name
sudo modprobe module_name
dmesg -T | less
```

## Boot and systemd

```bash
systemctl get-default
systemctl list-units --type=service
systemctl list-unit-files
systemctl status ssh
systemctl is-enabled ssh
systemctl is-active ssh
journalctl -b
journalctl -b -1
journalctl -u ssh --since today
sudo systemctl isolate rescue.target
sudo systemctl set-default multi-user.target
sudo shutdown -r +5 "Planned reboot"
wall "Maintenance begins in five minutes"
```

## Disks and Filesystems

```bash
lsblk -o NAME,SIZE,TYPE,FSTYPE,UUID,MOUNTPOINTS
blkid
findmnt
sudo fdisk -l
sudo parted -l
df -hT
df -i
du -xhd1 /var | sort -h
sudo fsck -N /dev/example
sudo mount UUID=example /mnt/example
sudo umount /mnt/example
```

## Packages

```bash
# Debian family
apt search package
apt show package
sudo apt update
sudo apt install package
dpkg -l
dpkg -L package
dpkg -S /path/to/file

# RPM family
dnf search package
dnf info package
sudo dnf install package
rpm -qa
rpm -ql package
rpm -qf /path/to/file
rpm -V package

# openSUSE
zypper repos
zypper search package
sudo zypper install package
```

## Files and Archives

```bash
pwd
ls -la
stat file
file file
cp -a source destination
mv old new
rm -i file
find /var/log -type f -mtime -1 -size +1M
find . -type f -print0 | xargs -0 sha256sum
tar -czf archive.tar.gz directory/
tar -tf archive.tar.gz
tar -xzf archive.tar.gz
```

## Text Processing

```bash
head -n 20 file
tail -f /var/log/syslog
cut -d: -f1 /etc/passwd
sort file | uniq -c | sort -nr
grep -E '^(root|daemon):' /etc/passwd
sed 's/old/new/g' file
tr '[:lower:]' '[:upper:]'
wc -l file
command 2>&1 | tee output.log
```

## Processes

```bash
ps aux
ps -eo pid,ppid,user,stat,ni,comm --sort=-%cpu | head
top
pgrep -a process_name
kill -TERM PID
kill -KILL PID
nice -n 10 command
sudo renice 5 -p PID
jobs
fg %1
bg %1
nohup command >command.log 2>&1 &
```

## Permissions and Links

```bash
id
namei -l /path/to/file
chmod u=rw,g=r,o= file
chmod 640 file
chown user:group file
umask 027
ln source hard-link
ln -s target symbolic-link
find / -xdev -perm /6000 -type f 2>/dev/null
```

## Users and Groups

```bash
getent passwd username
getent group groupname
sudo useradd -m -s /bin/bash username
sudo usermod -aG groupname username
sudo passwd username
sudo chage -l username
sudo userdel -r username
sudo groupadd groupname
```

## Scheduling

```bash
crontab -e
crontab -l
at 18:00
atq
atrm job_number
systemctl list-timers --all
systemd-analyze calendar 'Mon..Fri 09:00'
```

## Time, Locale, and Logs

```bash
date
timedatectl
locale
localectl status
LANG=C command
chronyc tracking
chronyc sources
journalctl -p warning --since today
logger -p user.notice "LPIC lab message"
logrotate -d /etc/logrotate.conf
```

## Networking and DNS

```bash
ip -brief address
ip link
ip route
ss -lntup
ping -c 4 gateway.example
tracepath example.org
nmcli device status
nmcli connection show
hostnamectl
getent hosts example.org
dig example.org
host example.org
```

## Security, SSH, and GPG

```bash
who
w
last -n 10
sudo -l
sudo visudo
lsof -i
ssh-keygen -t ed25519
ssh-add ~/.ssh/id_ed25519
ssh -L 8080:internal.example:80 user@jump.example

gpg --full-generate-key
gpg --list-keys
gpg --encrypt --recipient user@example.org file
gpg --decrypt file.gpg
gpg --detach-sign file
gpg --verify file.sig file
```

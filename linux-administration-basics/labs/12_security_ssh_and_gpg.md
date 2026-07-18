# Lab 12 – Security, SSH, and GPG

## Objectives

- Review users, sessions, privileges, listeners, and special-permission files
- Generate and inspect an SSH key pair
- Use an SSH agent and local forwarding conceptually
- Generate a temporary GPG key and encrypt, sign, and verify data

## Host Review

```bash
who
w
last -n 10
sudo -l
ss -lntup
find /usr/bin /usr/sbin -xdev -type f -perm /6000 -ls 2>/dev/null | head -n 30
```

Do not assume every SUID file is malicious. Identify package ownership and intended function.

## Service Review

```bash
systemctl --type=service --state=running
systemctl list-sockets --all
```

Choose one listener from `ss` and map it to a process and service.

## SSH Key Practice

```bash
LAB_DIR=$(mktemp -d /tmp/lpic-security.XXXXXX)
chmod 700 "$LAB_DIR"
ssh-keygen -t ed25519 -f "$LAB_DIR/id_ed25519" -C 'lpic-lab' -N ''
ls -l "$LAB_DIR"
ssh-keygen -lf "$LAB_DIR/id_ed25519.pub"
```

Start a temporary agent in the current shell:

```bash
eval "$(ssh-agent -s)"
ssh-add "$LAB_DIR/id_ed25519"
ssh-add -l
ssh-add -D
ssh-agent -k
```

Explain `known_hosts`, `authorized_keys`, host keys, and user keys.

## SSH Forwarding Concepts

Write example commands for:

- Local forwarding: local port to a service reachable from the SSH server
- Remote forwarding: remote port to a service reachable from the client
- Dynamic forwarding: local SOCKS proxy

Do not expose listeners publicly during the lab.

## GPG Practice

Use an isolated home:

```bash
export GNUPGHOME="$LAB_DIR/gnupg"
mkdir -m 700 "$GNUPGHOME"
cat > "$LAB_DIR/keyparams" <<'EOF'
Key-Type: eddsa
Key-Curve: ed25519
Subkey-Type: ecdh
Subkey-Curve: cv25519
Name-Real: LPIC Lab
Name-Email: lpic-lab@example.invalid
Expire-Date: 1d
%no-protection
%commit
EOF
gpg --batch --generate-key "$LAB_DIR/keyparams"
gpg --list-keys --fingerprint
printf 'confidential lab text\n' > "$LAB_DIR/message.txt"
gpg --batch --yes --trust-model always --recipient lpic-lab@example.invalid --encrypt "$LAB_DIR/message.txt"
gpg --batch --yes --output "$LAB_DIR/decrypted.txt" --decrypt "$LAB_DIR/message.txt.gpg"
gpg --batch --yes --detach-sign "$LAB_DIR/message.txt"
gpg --verify "$LAB_DIR/message.txt.sig" "$LAB_DIR/message.txt"
```

## Cleanup

```bash
unset GNUPGHOME
rm -rf "$LAB_DIR"
```

## Validation

- You can review active sessions and listeners.
- You can explain least privilege and sudo policy safety.
- You can distinguish SSH host and user keys.
- You can explain encryption vs digital signatures.
- You can verify a GPG fingerprint and signature.

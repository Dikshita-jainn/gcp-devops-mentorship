# Week 02 - SSH Validation

## 1. Objective

Verify that the OpenSSH server is installed, enabled, running, and listening on TCP port 22. Test an SSH connection to the local Ubuntu system.

## 2. Check SSH Service Status

**Command:**
```bash
sudo systemctl status ssh --no-pager
```

**Observed result:**
- Service: `ssh.service`
- Status: `active (running)`
- Startup: `enabled`

**Explanation:** The SSH service is running and configured to start automatically at boot.

## 3. Verify Port 22

**Command:**
```bash
sudo ss -ltnp 'sport = :22'
```

**Observed result:**
- SSH is listening on `0.0.0.0:22` for IPv4.
- SSH is listening on `[::]:22` for IPv6.
- The SSH server process is `sshd`.

**Explanation:** Port 22 is listening for SSH connections on the available IPv4 and IPv6 interfaces.

## 4. Test SSH Locally

**Command:**
```bash
ssh dikshita@localhost
```

**Observed result:** The host authenticity prompt appeared on the first connection. After accepting the host key and entering the Ubuntu account password, the SSH login succeeded and displayed the Ubuntu welcome message.

**Explanation:** The SSH client successfully connected to the SSH server on the same Ubuntu system. Inside Ubuntu, `localhost` refers to Ubuntu itself.

## 5. Key Learning

- SSH stands for Secure Shell and supports secure remote command-line access.
- Port 22 is the standard SSH port.
- `systemctl status ssh` checks the SSH service state.
- `ss -ltnp` can identify TCP listening sockets and their associated processes.
- A successful localhost SSH test confirms local connectivity and authentication.

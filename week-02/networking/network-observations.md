# Week 02 - Networking Observations

## 1. Environment

- Host OS: Windows 11 Enterprise
- Guest OS: Ubuntu 26.04.1 LTS
- VirtualBox Network Adapter 1: NAT
- Ubuntu network interface: enp0s3

## 2. Identify Network Interfaces and IP Addresses

### Command 1: ip addr

**Purpose:** Displays network interfaces and their assigned IP addresses.

**Observed results:**
- Loopback interface: `lo`
- Loopback IPv4 address: `127.0.0.1/8`
- Loopback IPv6 address: `::1/128`
- Active network interface: `enp0s3`
- Guest IPv4 address: `10.0.2.15/24`
- Guest IPv6 address: `fd17:625c:f037:2:a00:27ff:fe83:795d/64`

**Explanation:** The `lo` interface is used for communication within the same Ubuntu system. The `enp0s3` interface connects the Ubuntu VM to its VirtualBox NAT network.

### Command 2: hostname -I

**Purpose:** Displays IP addresses assigned to the system.

**Observed output:**
`10.0.2.15 fd17:625c:f037:2:a00:27ff:fe83:795d`

**Explanation:** The output contains the Ubuntu VM's IPv4 and IPv6 addresses.

### Command 3: ip route

**Purpose:** Displays the IPv4 routing table.

**Observed output:**
```text
default via 10.0.2.2 dev enp0s3 proto dhcp src 10.0.2.15 metric 100
10.0.2.0/24 dev enp0s3 proto kernel scope link src 10.0.2.15 metric 100

```

**Explanation:**
- `10.0.2.2` is the default gateway in this VirtualBox NAT setup.
- `enp0s3` is the network interface used to send traffic.
- `10.0.2.15` is the Ubuntu VM's IPv4 address.
- `10.0.2.0/24` represents the local IPv4 network.

## 3. Key Learning

- `127.0.0.1` refers to the local Ubuntu system when used inside Ubuntu.
- `10.0.2.15` is the Ubuntu VM's IPv4 address.
- `10.0.2.2` is the VirtualBox NAT gateway.
- The default route tells Ubuntu where to send IPv4 traffic when no more specific route matches.

## 4. How VirtualBox NAT Provides Internet Access

In NAT mode, Ubuntu sends network traffic through its `enp0s3` interface.
For destinations outside its local network, Ubuntu uses the default gateway
`10.0.2.2`. VirtualBox NAT translates the guest's traffic so it can use the
host's network connection to reach the internet. Responses return through
VirtualBox NAT to the Ubuntu VM. Outbound connections generally work without
manual port forwarding, but inbound connections to guest services usually
require a port-forwarding rule.

## 5. NAT vs Bridged Networking

### NAT
- The Ubuntu VM uses a private VirtualBox network.
- The VM can usually access the internet through the host's network connection.
- Inbound connections to guest services generally require port forwarding.

### Bridged
- The Ubuntu VM connects to the same external network as the host.
- The VM typically receives its own IP address from the external network.
- Other devices may connect directly to the VM if network and firewall rules allow it.

### Simple diagrams

NAT:

Ubuntu VM (10.0.2.15)
    |
VirtualBox NAT gateway (10.0.2.2)
    |
Windows host network connection
    |
Internet

Bridged:

Ubuntu VM --------\
                   Router / Network ---- Internet
Windows host -----/

## 6. Host and Guest

The host is the physical computer running VirtualBox. In this lab, the host
operating system is Windows 11 Enterprise. The guest is the operating system
running inside the virtual machine, which is Ubuntu 26.04.1 LTS. Ubuntu has
its own virtual CPU, memory, network interface, IP addresses, and services.
The guest uses resources allocated to it by VirtualBox from the host computer.


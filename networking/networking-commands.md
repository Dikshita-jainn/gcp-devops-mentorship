# Networking Commands

## 1. ip addr

Command:

    ip addr

What it tells me:

Shows the network interfaces on the system and the IP addresses assigned to each interface.

My Ubuntu example:
- enp0s3 → 10.0.2.15
- lo → 127.0.0.1


## 2. hostname -I

Command:

    hostname -I

What it tells me:

Displays the IP addresses assigned to the Ubuntu system.


## 3. ip route

Command:

    ip route

What it tells me:

Shows the routing table, including the default gateway and network routes.

My Ubuntu example:

    default via 10.0.2.2 dev enp0s3

This means 10.0.2.2 is the default gateway.


## 4. ping

Command:

    ping google.com

What it tells me:

Checks network connectivity by sending ICMP echo requests and checking whether responses are received.


## 5. getent ahosts

Command:

    getent ahosts google.com

What it tells me:

Resolves the domain name google.com and displays the IP addresses associated with it.

The output can contain both IPv4 and IPv6 addresses.


## 6. ss

Command:

    ss -tulnp

What it tells me:

Shows listening network sockets and helps identify which ports are being used by services.

For example, when Nginx is running, port 80 can appear as a listening port.


## 7. curl

Command:

    curl https://google.com

What it tells me:

Sends an HTTPS request to Google and displays the server's HTTP response.

My result was:

    301 Moved

This means Google redirected the request to another URL:

    https://www.google.com/

The 301 response indicates a permanent redirect.

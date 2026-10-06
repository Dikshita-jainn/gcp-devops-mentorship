# Networking Basics

1. What is an IP Address?

An IP address is a unique address assigned to a network interface so that a device can be identified and network communication can be directed to it.

Example from my Ubuntu VM:
- Network interface: enp0s3
- IP address: 10.0.2.15

The IP address helps identify where network communication should be sent.

2. Public IP vs Private IP

A private IP address is used inside a private network and is not directly routable on the public Internet.

A public IP address is an Internet-routable address used for communication over the public Internet.

My Ubuntu VM has the private IP address 10.0.2.15 because it belongs to the private IP range 10.0.0.0/8.

Private IPv4 ranges include:
- 10.0.0.0/8
- 172.16.0.0/12
- 192.168.0.0/16

Private IP addresses do not need to be globally unique because different private networks can reuse the same addresses.

Private IP does not mean the device cannot access the Internet. My Ubuntu VM can access the Internet through VirtualBox NAT.


3. What is DNS and Why is it Required?

DNS stands for Domain Name System.

DNS is used to find the IP address associated with a domain name.

Humans can easily remember names such as google.com, but network communication needs an IP address. DNS helps resolve the domain name to an IP address so that a connection can be established.

Example:

google.com → DNS lookup → IP address → connection


4. What is TCP?

TCP stands for Transmission Control Protocol.

TCP provides reliable and ordered communication between applications over a network.

TCP helps ensure that data is delivered reliably and in the correct order.

Technical memory:

TCP → reliable + ordered communication


5. What is a Port?

A port is a number used to identify a network service on a computer.

The IP address identifies the system or network interface, while the port identifies the service that should receive the communication.

Example:

10.0.2.15:80

Here:
- 10.0.2.15 = IP address
- 80 = port number
- Nginx = web service listening on port 80

Common ports:
- HTTP → 80
- HTTPS → 443
- SSH → 22


6. HTTP vs HTTPS

HTTP stands for Hypertext Transfer Protocol.

HTTP is used for communication between a client and a web server.

HTTPS is HTTP secured using TLS encryption.

HTTPS protects communication between the client and server by encrypting the data.

Common ports:
- HTTP → 80
- HTTPS → 443

Technical memory:

HTTP → web communication

HTTPS → encrypted web communication


7. What Does a Firewall Do?

A firewall is a security mechanism that allows or blocks network traffic based on defined rules.

For example, a firewall can allow traffic to port 80 and block traffic to another port.

A service may be running and listening on a port, but a firewall can still prevent network traffic from reaching that port.

Technical memory:

Firewall → controls traffic → allow/block


8. What is a Load Balancer?

A load balancer distributes incoming network traffic across multiple servers.

It helps prevent all traffic from going to a single server and allows multiple servers to handle requests.

This can improve availability and help distribute the workload between servers.

Technical memory:

Load balancer → receives traffic → distributes traffic


9. What Happens When You Type a Website URL in a Browser?

For example, when I enter:

https://google.com

The high-level flow is:

1. DNS resolves google.com to an IP address.
2. The browser connects using port 443 for HTTPS.
3. TCP provides reliable and ordered communication.
4. TLS secures the HTTPS communication by encrypting it.
5. The web server receives and processes the request.
6. The web server sends a response back.
7. The browser receives the response and displays the webpage.

Technical memory:

URL → DNS → IP → Port 443 → TCP → HTTPS/TLS → Web Server → Response → Browser

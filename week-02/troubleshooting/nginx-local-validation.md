# Week 02: Nginx Local Validation

## Objective
Verify that Nginx is running, listening on HTTP port 80, and responding to local requests.

## Environment
- Guest OS: Ubuntu 26.04.1 LTS
- Virtualization: Oracle VirtualBox
- Network mode: NAT
- Ubuntu IPv4 address: 10.0.2.15
- Web server: Nginx
- HTTP port: 80

## Check 1: Nginx Service Status

Command:
sudo systemctl status nginx

Result:
The service was reported as active.

Explanation:
The Nginx service is running.

## Check 2: Local HTTP Request

Command:
curl http://localhost

Result:
The Nginx Welcome page HTML was returned.

Explanation:
Ubuntu can access its own web server through localhost.

## Check 3: Listening Port

Command:
sudo ss -ltnp | grep ':80'

Result:
Nginx was listening on port 80 on IPv4 (0.0.0.0:80) and IPv6 ([::]:80).

Explanation:
Nginx has listening TCP sockets on port 80. This alone does not prove external connectivity.

## Check 4: HTTP Response Headers Through Ubuntu's IPv4 Address

Command:
curl -I http://10.0.2.15

Result:
HTTP/1.1 200 OK
Server: nginx/1.28.3 (Ubuntu)
Content-Type: text/html
Content-Length: 615

Explanation:
The request to Ubuntu's assigned IPv4 address succeeded and returned HTTP 200 OK.

## Current Findings

- Nginx service is running.
- Localhost HTTP request succeeds.
- Nginx is listening on port 80.
- HTTP request to Ubuntu's own IPv4 address succeeds.
- Access from the Windows host has not yet been tested.

## Troubleshooting Principle

Check the service, listening port, local connectivity, logs, and network path separately. A successful local request does not guarantee that another machine can reach the service.
## Check 5: Access Nginx from the Windows Host

### Initial Test

URL:
http://10.0.2.15

Result:
The Windows browser could not reach the page.

### Investigation

VirtualBox Adapter 1 was configured to use NAT.

Explanation:
The guest's NAT IP was not directly reachable from the Windows host through the default NAT configuration.

### Fix Applied

Configured a VirtualBox NAT port-forwarding rule:

- Protocol: TCP
- Host IP: blank
- Host port: 8080
- Guest IP: 10.0.2.15
- Guest port: 80

### Verification

URL:
http://127.0.0.1:8080

Result:
The Nginx Welcome page appeared in the Windows browser.

### Root Cause

The Windows host did not have a direct incoming connection path to Nginx through the default VirtualBox NAT configuration.

### Resolution

Configured port forwarding from Windows host port 8080 to Ubuntu guest port 80.

### Learning

A service can be running and responding locally while remaining inaccessible from another machine. Troubleshooting must check the service, listening port, and network path separately.

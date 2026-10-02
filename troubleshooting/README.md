# Break and Fix Troubleshooting

## Problem

Nginx was intentionally stopped to simulate a service failure.

## Step 1: Stop Nginx

sudo systemctl stop nginx

- Stops the Nginx service.

## Step 2: Check Service Status

systemctl status nginx

- Checks whether the Nginx service is running.

Result:
Nginx showed `inactive (dead)`.

## Step 3: Test the Web Server

curl http://localhost

- Sends an HTTP request to the local web server.

Result:
The request failed because Nginx was stopped.

## Step 4: Check Listening Ports

ss -tulnp

- Displays listening TCP/UDP ports and the processes using them.

Result:
Port 80 was not listening because Nginx was stopped.

## Step 5: Fix the Problem

sudo systemctl start nginx

- Starts the Nginx service.

## Step 6: Verify the Fix

systemctl status nginx

- Confirms that Nginx is running.

ss -tulnp

- Confirms that port 80 is listening.

curl http://localhost

- Confirms that the Nginx web server responds to an HTTP request.

## Conclusion

The issue was caused by the Nginx service being stopped. Service status, HTTP testing, and port inspection were used to identify the problem. Starting Nginx restored the web service.

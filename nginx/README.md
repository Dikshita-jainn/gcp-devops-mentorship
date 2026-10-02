# Nginx Installation and Service Management

## Nginx

Nginx is a web server used to handle HTTP requests and serve web content.

## Service Management

systemctl is the command-line tool used to communicate with systemd, the system and service manager.

sudo systemctl status nginx
- Checks the current status of the Nginx service.

sudo systemctl start nginx
- Starts Nginx if it is stopped.

sudo systemctl stop nginx
- Stops the Nginx service.

sudo systemctl restart nginx
- Stops Nginx and starts it again.

## Ports and Listening Services

ss -tulnp
- Displays TCP and UDP listening ports and the processes using them.

Port 80 was found listening on the Ubuntu system, indicating that Nginx was listening for HTTP connections.

## HTTP Testing

curl
- A command-line tool used to send requests to a web server.

curl was used to send an HTTP request to Nginx and verify that the web server was responding.

The Nginx page was also validated through a web browser.


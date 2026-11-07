# Scenario A — Nginx is Stopped

## 1. Objective

To simulate an Nginx service failure, identify the problem using the Bash health-check scripts, restore the service, and verify recovery.

## 2. Symptom

The website became unavailable because the Nginx service was stopped.

## 3. Evidence — Failure Detection

**Command used to simulate the failure:**

```bash
sudo systemctl stop nginx
```

**Nginx health check:**

```bash
./week-05/bash/nginx-health.sh
```

**Actual output:**

```text
Nginx is NOT running
```

**HTTP health check:**

```bash
./week-05/bash/http-health.sh
```

**Actual output:**

```text
Website is unhealthy
```

Both scripts detected the failure:
- `nginx-health.sh` detected that the Nginx service was not running.
- `http-health.sh` detected that the local website was not returning the expected HTTP 200 response.

## 4. Root Cause

The Nginx service had been deliberately stopped using `systemctl stop nginx`.

As a result, Nginx could not serve HTTP requests on port 80, causing the HTTP health check to report an unhealthy website.

## 5. Fix

Restarted the Nginx service:

```bash
sudo systemctl start nginx
```

This restored the web server service.

## 6. Verification — Recovery Confirmed

**HTTP health check:**

```bash
./week-05/bash/http-health.sh
```

**Actual output:**

```text
Website is healthy
```

**Nginx health check:**

```bash
./week-05/bash/nginx-health.sh
```

**Actual output:**

```text
Nginx is running
```

Both scripts confirmed that Nginx and the website had recovered successfully.

## 7. Conclusion

The controlled failure test was successful. The Nginx health-check script identified the stopped service, while the HTTP health-check script identified the website response failure. After restarting Nginx, both scripts confirmed recovery.

This demonstrates how Bash scripts can help detect service failures and verify application health.

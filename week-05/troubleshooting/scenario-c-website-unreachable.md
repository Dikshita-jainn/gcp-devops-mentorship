# Scenario C — Website Unreachable

## 1. Objective

To troubleshoot external website connectivity by distinguishing an Nginx service issue from a GCP firewall/network access issue.

## 2. Symptom

The website was initially accessible externally. After disabling the GCP HTTP firewall rule, a fresh external HTTP request from Windows timed out.

## 3. Evidence — Before and During Failure

### Initial local health checks

**Command:**

```bash
systemctl is-active nginx
```

**Actual output:**

```text
active
```

**Command:**

```bash
curl -I http://localhost
```

**Actual response:**

```text
HTTP/1.1 200 OK
Server: nginx/1.24.0 (Ubuntu)
```

### Initial external access

VM external IP:

```text
35.207.255.143
```

The Nginx welcome page opened in the Windows browser.

### Firewall failure simulation

Disabled the GCP firewall rule:

```text
default-allow-http
```

This rule allows ingress TCP traffic on port 80.

### Local test after disabling firewall

**Actual result:**

```text
Nginx: active
HTTP: 200 OK
```

This confirmed that the Nginx service continued working locally.

### External test after disabling firewall

**Windows PowerShell command:**

```powershell
curl.exe -I --max-time 10 http://35.207.255.143
```

**Actual output:**

```text
curl: (28) Connection timed out after 10014 milliseconds
```

## 4. Root Cause

The GCP `default-allow-http` firewall rule was disabled.

As a result, external HTTP traffic could not reach the VM on TCP port 80, even though Nginx was running and responding to local requests.

## 5. Fix

Re-enabled the GCP firewall rule:

```text
default-allow-http
```

The rule permits ingress TCP traffic on port 80.

## 6. Verification — External Access Restored

Repeated the external PowerShell HTTP test against:

```text
http://35.207.255.143
```

The user confirmed that the request worked after the firewall rule was re-enabled.

This verified that external website access was restored.

## 7. Conclusion

The controlled firewall test demonstrated the difference between application health and network accessibility.

Nginx remained active and returned HTTP 200 locally while external HTTP traffic timed out. Re-enabling the GCP HTTP firewall rule restored external access.

Therefore, the root cause was the GCP firewall/network access path, not the Nginx service.

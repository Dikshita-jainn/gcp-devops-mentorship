# Week 02 - DNS Validation

## 1. Objective

Verify DNS resolution from the Ubuntu VM and identify the difference between IPv4 A records and IPv6 AAAA records.

## 2. General DNS Lookup

**Command:**
```bash
nslookup google.com
```

**Observed result:**
- DNS resolver shown: `127.0.0.53`
- DNS port: `53`
- The query returned multiple IPv4 and IPv6 addresses for `google.com`.

**Explanation:** DNS translates domain names into IP addresses that clients can use to connect to services. `127.0.0.53` is Ubuntu's local DNS stub resolver address.

## 3. IPv4 A Record Lookup

**Command:**
```bash
nslookup -type=A google.com
```

**Observed result:** The lookup returned multiple IPv4 addresses, including `192.178.193.102` and `192.178.211.139`.

**Explanation:** An A record maps a domain name to an IPv4 address. A domain can have multiple A records.

## 4. IPv6 AAAA Record Lookup

**Command:**
```bash
nslookup -type=AAAA google.com
```

**Observed result:** The lookup returned multiple IPv6 addresses, including `2404:6800:4000:1025::66`.

**Explanation:** An AAAA record maps a domain name to an IPv6 address. A domain can have multiple AAAA records.

## 5. Key Learning

- DNS helps clients find IP addresses associated with domain names.
- IPv4 addresses are commonly written in dotted-decimal notation.
- IPv6 addresses use hexadecimal groups separated by colons.
- A records return IPv4 addresses.
- AAAA records return IPv6 addresses.
- DNS responses can contain multiple addresses and may vary over time.

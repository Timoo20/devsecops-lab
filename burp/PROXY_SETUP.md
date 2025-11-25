## Burp Suite Proxy Setup Guide

This guide explains how to configure Burp Suite as an interception proxy for browser traffic. The setup outlined here works on Kali Linux, Windows, and macOS.

---

## 1. Objective

To route browser traffic through Burp Suite for analysis, modification, interception, and security testing.

---

## 2. Requirements

* Burp Suite Community or Professional installed
* Firefox or Chromium browser
* Burp CA certificate installed in browser (for HTTPS interception)

---

## 3. Configure the Burp Proxy Listener

Burp Suite is configured by default to listen on:

* Interface: 127.0.0.1
* Port: 8080

To verify:

1. Open Burp Suite
2. Open the Proxy tab
3. Open the Options sub-tab
4. Confirm an entry: 127.0.0.1:8080 is active

If missing:

* Click Add
* Bind to 127.0.0.1
* Port 8080
* Save

---

## 4. Configure Browser to Use Burp

### Option A: Manual Proxy Configuration (Recommended)

#### Firefox

1. Open Preferences
2. Navigate to Network Settings
3. Select Manual proxy configuration
4. Enter:

   * HTTP Proxy: 127.0.0.1
   * Port: 8080
5. Check "Use this proxy for all protocols"
6. Save

#### Chromium/Chrome

Install "FoxyProxy" extension then:

1. Add new proxy
2. Host: 127.0.0.1
3. Port: 8080
4. Save and enable

---

## 5. Install Burp CA Certificate

Interception of HTTPS requires trust in Burp’s CA.

Steps:

1. Open browser configured to proxy Burp
2. Visit: [http://burp](http://burp)
3. Click "CA Certificate"
4. Save the file
5. In browser settings, import the certificate as a trusted authority

For Firefox:

* Preferences → Privacy & Security → Certificates → View Certificates → Authorities → Import

Choose:

* "Trust this CA to identify websites"

---

## 6. Verify Proxy Functionality

1. Open Burp Suite → Proxy → Intercept
2. Ensure "Intercept is on"
3. Visit any website in the browser
4. You should see the request appear in Burp

If not appearing:

* Ensure browser is using the proxy
* Ensure Burp is listening on 8080
* Ensure no firewall blocking local traffic

---

## 7. Best Practices for Penetration Testing

* Disable intercept when not required
* Use different Burp projects per application
* Avoid proxying non-lab traffic to prevent noise
* Use Repeater for testing payloads instead of constant interception

---

## 8. Troubleshooting

### Common Issue: SSL Certificate Errors

Cause: Browser does not trust Burp CA.
Fix: Reinstall Burp CA certificate.

### Common Issue: No Traffic in Proxy

Cause: Browser not configured to use Burp.
Fix: Verify proxy settings and active listener.

### Common Issue: HTTPS Sites Not Loading

Cause: Missing or incorrect CA trust.
Fix: Import certificate under Authorities.

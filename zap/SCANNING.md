# ZAP Scanning Guide (SCANNING.md)

This document provides a complete, technically detailed guide on performing web application security scans using **OWASP ZAP** inside your Kali Linux lab environment.

---

# 1. Introduction

OWASP ZAP (Zed Attack Proxy) is a powerful open‑source web security testing tool used for:

* Automated vulnerability discovery
* Manual penetration testing
* API security scanning
* Proxy‑based traffic inspection
* Active & Passive scanning

This guide documents ZAP scanning techniques end‑to‑end.

---

# 2. Start ZAP

Run ZAP normally inside Kali:

```
zap
```

Or start it in daemon mode (for pipelines or automation):

```
zap.sh -daemon -config api.disablekey=true
```

Ensure your browser proxy is set to:

* **127.0.0.1:8080**

---

# 3. Passive Scanning

Passive scanning occurs automatically as traffic flows through ZAP.
It does **not** modify requests and is completely safe for production‑like environments.

## Steps

1. Configure browser proxy to route traffic through ZAP.
2. Visit all pages of the target application manually.
3. Observe findings under:

```
Alerts → Risk Levels → Vulnerabilities
```

## What ZAP Identifies via Passive Scan

* Missing security headers
* Cookies without security flags
* Mixed content issues
* Information leakage
* Session anomalies

---

# 4. Spidering (Crawling)

ZAP Spider discovers all reachable URLs.

## GUI Method

```
Right‑click the target → Attack → Spider
```

## Recommended Settings

* Maximum children: 0 (unlimited)
* Handle HTTP redirects: enabled
* Form submission: enabled

## Purpose

The spider improves scanning accuracy by ensuring ZAP knows all application endpoints.

---

# 5. AJAX Spider

Used for applications built with:

* Angular
* React
* Vue
* SPA‑style frontends

## Run AJAX Spider

```
Right‑click target → Attack → AJAX Spider
```

## Notes

* Requires a browser engine
* Excellent for modern JS‑heavy applications

---

# 6. Active Scanning

Active scanning attempts to exploit vulnerabilities.
Use only on vulnerable lab targets.

## Start Active Scan

```
Right‑click target → Attack → Active Scan
```

## What Active Scan Tests

* SQL Injection
* OS Command Injection
* XSS (reflected/stored)
* Path Traversal
* CSRF Weaknesses
* Server-side template injections
* Weak authentication

Active scan is the most powerful ZAP feature.

---

# 7. API Security Scanning

ZAP supports OpenAPI/Swagger.

## Import OpenAPI Definition

```
Import → Import OpenAPI definition from URL or file
```

## After importing

* ZAP automatically loads all API endpoints
* You can run **Spider**, **Passive**, and **Active** scans

---

# 8. Context Configuration (Mandatory for Accurate Scans)

A Context allows ZAP to understand authentication boundaries.

## Steps

1. Right‑click target → Include in context
2. Define:

   * Logged‑in indicator
   * Logged‑out indicator
   * Auth parameters
   * Session management

### Example: Form‑Based Login

```
Username field: email
Password field: password
Login URL: /login
```

### Authentication Testing

ZAP automatically checks:

* Session fixation
* Weak logout behavior
* Broken authentication flows

---

# 9. Forced Browse (Directory & File Discovery)

Useful for discovering hidden resources.

### Run

```
Forced Browse → Start
```

ZAP uses wordlists to brute‑force common directory names.

---

# 10. Manual Request Editing (Fuzzing)

ZAP has a built‑in fuzzer for testing injections.

### Start Fuzzing

```
Right‑click request → Fuzz
```

### Common Payload Categories

* SQL injection
* XSS injection
* Path traversal
* Command injection
* Authentication bypass

---

# 11. Reporting

Generate professional scan reports.

### Export HTML Report

```
Report → Generate HTML Report
```

### Export XML/JSON

Useful for CI/CD processing.

```
Report → Export → JSON/XML
```

---

# 12. Automation (CLI Mode)

ZAP supports fully automated scans.

### Quick Scan

```
zap.sh -quickurl http://localhost:3000 -quickout report.html
```

### Baseline Scan

```
zap-baseline.py -t http://localhost:3000 -r baseline.html
```

### Full Scan

```
zap-full-scan.py -t http://localhost:3000 -r fullscan.html
```

---

# 13. DevSecOps Integration

ZAP can be integrated with:

* Jenkins
* GitHub Actions
* GitLab CI
* Azure DevOps

### Example Jenkins Pipeline Snippet

```
sh 'zap-baseline.py -t http://dvwa.local -r zap-report.html'
archiveArtifacts artifacts: 'zap-report.html'
```

---

# 14. Best Practices

* Always configure a context before scanning
* Authenticate before active scans
* Use Spider + AJAX Spider for full coverage
* Perform manual verification for critical findings
* Never scan production systems without permission

---

# 15. Conclusion

This guide equips you with everything required to perform effective scanning in your application security lab.

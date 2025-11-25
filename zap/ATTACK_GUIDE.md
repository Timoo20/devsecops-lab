# ZAP ATTACK GUIDE

This guide provides a comprehensive, technical, and structured approach to performing offensive security testing using **OWASP Zed Attack Proxy (ZAP)** inside your DevSecOps lab.
---

## 1. Introduction

OWASP ZAP is an open‑source web application security scanner designed for discovering security flaws in modern web applications. It supports proxy‑based analysis, active scanning, fuzzing, authentication testing, API testing, and automation.

This guide is designed for:

* Vulnerability researchers
* DevSecOps engineers
* Penetration testers
* Students conducting security labs

---

## 2. Starting ZAP

### Graphical Mode

```bash
zap-x.sh
```

### Headless Mode (for automation)

```bash
zap.sh -daemon -port 8081 -config api.key=12345
```

---

## 3. ZAP Proxy Configuration

ZAP acts as a proxy between the browser and the target application.

### Browser Proxy Setup

Configure Firefox or Chromium:

* Proxy Address: `127.0.0.1`
* Proxy Port: `8080`

Import ZAP CA certificate to enable HTTPS inspection:

1. In ZAP, open **Tools → Options → Certificate**.
2. Generate root CA.
3. Import into the browser's trusted store.

---

## 4. Application Reconnaissance

ZAP automatically records:

* URLs visited
* Parameters
* Cookies
* Headers
* Authentication flows
* API endpoints

View results in:

* **Sites Tree**
* **History Tab**
* **Request/Response Panel**

---

## 5. Passive Scanning

Passive scanning occurs while you browse the application.

ZAP detects:

* Missing security headers
* Cookies without `HttpOnly` or `Secure`
* Disclosure of server information
* URL structure anomalies
* HTML injection surfaces

No traffic modification occurs.

---

## 6. Active Scanning (Offensive Testing)

Active scanning is intrusive and used to discover exploitable vulnerabilities.

### Start an Active Scan

Right‑click target → **Attack → Active Scan**.

ZAP performs:

* SQL injection payloads
* Command injection attempts
* XSS payload injection
* Path traversal tests
* Server‑side request forgery attempts
* Authentication bypass tests
* Deserialization payloads (when applicable)

### Configure Scan Policies

Enable or disable rules:

1. **Analyze → Scan Policy Manager**
2. Customize:

   * Injection attacks
   * Input vectors
   * CSRF detection
   * File upload checks

---

## 7. Fuzzing

ZAP has a built‑in fuzzer for testing parameters, headers, cookies, and JSON bodies.

### Performing a Fuzz Operation

1. Select a request → **Right‑click → Attack → Fuzz**.
2. Add payload lists:

   * SQLi wordlists
   * XSS payloads
   * Command injection patterns
   * File upload bypass sequences
3. Monitor responses by size, code, and timing.

Common fuzz locations:

* Query parameters
* JSON request bodies
* HTTP headers
* Cookies

---

## 8. Authentication Testing

ZAP supports complex authentication workflows.

### Supported Methods

* Form-based login
* HTTP Basic / Digest
* Token-based (JWT)
* OAuth2

### Configuring Authentication

1. Right‑click site → **Include in Context**.
2. Configure login and logout URLs.
3. Configure session management.
4. Add valid user credentials.

ZAP will now attack authenticated routes.

---

## 9. API Security Testing

ZAP can import and test:

* OpenAPI (Swagger) specs
* Postman collections
* GraphQL schemas

### Import OpenAPI

```bash
Tools → Import OpenAPI Definition
```

Active scan these endpoints for modern API vulnerabilities.

---

## 10. Automated Scan (Quick Attack Mode)

For rapid assessments:

### Quick Start → Automated Scan

Provide target URL → ZAP crawls and scans.

Suitable for:

* CI/CD pipelines
* Bulk scanning environments

---

## 11. Reporting

Export results to:

* HTML
* Markdown
* XML
* JSON

### Example

```bash
zap-cli report -o zap_report.html -f html
```

### Recommended Fields in Reports

* Vulnerability title
* Evidence
* Attack vector
* Affected endpoints
* Remediation guidance
* CVSS score

---

## 12. Advanced Attacks

ZAP supports deeper exploitation workflows.

### 12.1 Script‑Based Attacks

ZAP supports:

* JavaScript
* Python (Jython)
* Kotlin
* Zest

Use cases:

* Token replay
* Custom payload manipulation
* Automated brute forcing

### 12.2 WebSocket Testing

Analyze:

* Real‑time applications
* Chat interfaces
* Event-driven APIs

### 12.3 Forced Browsing (Hidden Content Discovery)

ZAP attempts to discover unlinked paths via wordlists.

---

## 13. Integration With DevSecOps Pipelines

ZAP can be integrated into:

* GitHub Actions
* GitLab CI
* Jenkins
* Azure DevOps

Example CLI automation:

```bash
zap.sh -daemon -port 8081
zap-cli open-url http://target
zap-cli active-scan
zap-cli alerts -f json > results.json
```

---

## 14. Best Practices

* Use contexts to separate authenticated vs unauthenticated scans.
* Always enable passive scanning early.
* Customize scan policies for the target stack.
* Use fuzzing for deeper parameter testing.
* Never scan production environments.

---

## 15. Conclusion

This guide provides a deep, technical, and structured approach to conducting offensive security assessments using ZAP. Use it as the reference file for your DevSecOps lab and as a baseline for further automation and advanced exploitation scenarios.
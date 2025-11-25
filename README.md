# DevSecOps Advanced Lab

High‑Grade Application Security, Secure Coding, SIEM Engineering & DevSecOps Practice Environment

This repository provides a complete hands‑on offensive and defensive security lab. It includes intentionally vulnerable applications, guided exploitation labs, payload libraries, SIEM detection engineering, threat‑hunting guides, automation scripts, and security tooling documentation.

The lab is structured so that each directory contains:

* **INSTALL.md** – How to set up the environment
* **LABS.md** – Step‑by‑step exploitation or testing labs
* **PAYLOADS.md / RULES.md** – Payloads, detection rules, correlation guides
* **SCRIPTS** – Automation and tooling for red/blue team workflows

---

# 1. Vulnerable Applications

These applications are included for web exploitation, DevSecOps training, and OWASP Top 10 demonstrations.

## **Juice Shop**

OWASP Juice Shop exploitation and DevSecOps security testing.

* **Folder:** [https://github.com/Timoo20/devsecops-lab/tree/main/juice-shop](https://github.com/Timoo20/devsecops-lab/tree/main/juice-shop)
* **Installation:** [https://github.com/Timoo20/devsecops-lab/blob/main/juice-shop/INSTALL.md](https://github.com/Timoo20/devsecops-lab/blob/main/juice-shop/INSTALL.md)
* **Labs:** [https://github.com/Timoo20/devsecops-lab/blob/main/juice-shop/LABS.md](https://github.com/Timoo20/devsecops-lab/blob/main/juice-shop/LABS.md)
* **Payloads:** [https://github.com/Timoo20/devsecops-lab/blob/main/juice-shop/PAYLOADS.md](https://github.com/Timoo20/devsecops-lab/blob/main/juice-shop/PAYLOADS.md)

---

## **Mutillidae II**

Large vulnerability coverage for web pentesting and OWASP awareness.

* **Folder:** [https://github.com/Timoo20/devsecops-lab/tree/main/mutillidae](https://github.com/Timoo20/devsecops-lab/tree/main/mutillidae)
* **Installation:** [https://github.com/Timoo20/devsecops-lab/blob/main/mutillidae/INSTALL.md](https://github.com/Timoo20/devsecops-lab/blob/main/mutillidae/INSTALL.md)
* **Labs:** [https://github.com/Timoo20/devsecops-lab/blob/main/mutillidae/LABS.md](https://github.com/Timoo20/devsecops-lab/blob/main/mutillidae/LABS.md)
* **Payloads:** [https://github.com/Timoo20/devsecops-lab/blob/main/mutillidae/PAYLOADS.md](https://github.com/Timoo20/devsecops-lab/blob/main/mutillidae/PAYLOADS.md)

---

## **WebGoat**

Interactive web application security lessons by OWASP.

* **Folder:** [https://github.com/Timoo20/devsecops-lab/tree/main/webgoat](https://github.com/Timoo20/devsecops-lab/tree/main/webgoat)
* **Installation:** [https://github.com/Timoo20/devsecops-lab/blob/main/webgoat/INSTALL.md](https://github.com/Timoo20/devsecops-lab/blob/main/webgoat/INSTALL.md)
* **Labs:** [https://github.com/Timoo20/devsecops-lab/blob/main/webgoat/LABS.md](https://github.com/Timoo20/devsecops-lab/blob/main/webgoat/LABS.md)

---

# 2. SIEM & Threat Detection Engineering

A full SIEM engineering suite including Wazuh deployment, detection rules, and log correlation playbooks.

## **Wazuh SIEM**

* **Folder:** [https://github.com/Timoo20/devsecops-lab/tree/main/siem](https://github.com/Timoo20/devsecops-lab/tree/main/siem)
* **Wazuh Installation Guide:** [https://github.com/Timoo20/devsecops-lab/blob/main/siem/WAZUH_INSTALL.md](https://github.com/Timoo20/devsecops-lab/blob/main/siem/WAZUH_INSTALL.md)
* **Detection Rules:** [https://github.com/Timoo20/devsecops-lab/blob/main/siem/DETECTION_RULES.md](https://github.com/Timoo20/devsecops-lab/blob/main/siem/DETECTION_RULES.md)
* **Log Correlation:** [https://github.com/Timoo20/devsecops-lab/blob/main/siem/LOG_CORRELATION.md](https://github.com/Timoo20/devsecops-lab/blob/main/siem/LOG_CORRELATION.md)

---

# 3. Security Automation Scripts

Automation to accelerate DevSecOps, logging, and attack simulation.

* **Scripts folder:** [https://github.com/Timoo20/devsecops-lab/tree/main/scripts](https://github.com/Timoo20/devsecops-lab/tree/main/scripts)
* **attack-automation.sh:** [https://github.com/Timoo20/devsecops-lab/blob/main/scripts/attack-automation.sh](https://github.com/Timoo20/devsecops-lab/blob/main/scripts/attack-automation.sh)
* **log-collector.sh:** [https://github.com/Timoo20/devsecops-lab/blob/main/scripts/log-collector.sh](https://github.com/Timoo20/devsecops-lab/blob/main/scripts/log-collector.sh)
* **start-dvwa.sh:** [https://github.com/Timoo20/devsecops-lab/blob/main/scripts/start-dvwa.sh](https://github.com/Timoo20/devsecops-lab/blob/main/scripts/start-dvwa.sh)

---

# 4. ZAP (OWASP Zed Attack Proxy)

Guides for automated and manual scanning using ZAP.

* **Folder:** [https://github.com/Timoo20/devsecops-lab/tree/main/zap](https://github.com/Timoo20/devsecops-lab/tree/main/zap)
* **Attack Guide:** [https://github.com/Timoo20/devsecops-lab/blob/main/zap/ATTACK_GUIDE.md](https://github.com/Timoo20/devsecops-lab/blob/main/zap/ATTACK_GUIDE.md)
* **Scanning Guide:** [https://github.com/Timoo20/devsecops-lab/blob/main/zap/SCANNING.md](https://github.com/Timoo20/devsecops-lab/blob/main/zap/SCANNING.md)

---

# 5. Burp Suite Professional Workflow

Comprehensive proxy configuration and advanced web exploitation steps.

* **Folder:** [https://github.com/Timoo20/devsecops-lab/tree/main/burp](https://github.com/Timoo20/devsecops-lab/tree/main/burp)
* **Hacking Guide:** [https://github.com/Timoo20/devsecops-lab/blob/main/burp/HACKING_GUIDE.md](https://github.com/Timoo20/devsecops-lab/blob/main/burp/HACKING_GUIDE.md)
* **Proxy Setup:** [https://github.com/Timoo20/devsecops-lab/blob/main/burp/PROXY_SETUP.md](https://github.com/Timoo20/devsecops-lab/blob/main/burp/PROXY_SETUP.md)

---

# 6. Project Structure Overview

```
devsecops-lab/
│
├── juice-shop/
│   ├── INSTALL.md
│   ├── LABS.md
│   └── PAYLOADS.md
│
├── mutillidae/
│   ├── INSTALL.md
│   ├── LABS.md
│   └── PAYLOADS.md
│
├── webgoat/
│   ├── INSTALL.md
│   └── LABS.md
│
├── siem/
│   ├── DETECTION_RULES.md
│   ├── LOG_CORRELATION.md
│   └── WAZUH_INSTALL.md
│
├── scripts/
│   ├── attack-automation.sh
│   ├── log-collector.sh
│   └── start-dvwa.sh
│
├── zap/
│   ├── ATTACK_GUIDE.md
│   └── SCANNING.md
│
├── burp/
│   ├── HACKING_GUIDE.md
│   └── PROXY_SETUP.md
│
└── README.md
```

---

# 7. Purpose of This Repository

This lab is designed for:

* DevSecOps Engineers
* Cybersecurity Analysts
* Penetration Testers
* SOC Analysts
* Students preparing for real‑world offensive and defensive security tasks

Each module provides structured and reproducible exercises that simulate enterprise‑grade security operations and attack scenarios.

---

# 8. Contributions

Pull requests are welcome. Ensure new content is:

* Technically accurate
* Written in clear Markdown
* Structured into INSTALL.md, LABS.md, or PAYLOADS/RULES

---

# 9. License

MIT License.

---

# 10. Maintainer

Tim Murkomen
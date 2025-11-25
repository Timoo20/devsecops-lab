# SIEM Detection Rules

This document provides a curated set of high‑fidelity, enterprise‑grade detection rules tailored for Wazuh, Elastic Stack, and general SIEM operations. All rules focus on:

* High‑signal, low‑noise alerting
* Financial‑industry threat models
* MITRE ATT&CK mapping
* File integrity, authentication, endpoint, API, and DevSecOps pipeline telemetry

---

## 1. Brute‑Force Authentication Detection

**Purpose:** Detect multiple failed login attempts within a short time window.

**MITRE ATT&CK:** T1110 – Brute Force

**Rule Logic:**

* Track repeated authentication failures from the same source IP.
* Alert when threshold is exceeded.

**Example (Wazuh Rule):**

```
<group name="authentication_failures,">  
  <rule id="80001" level="7">  
    <if_sid>5710</if_sid>  
    <match>authentication failure</match>  
    <frequency>5</frequency>  
    <timeframe>120</timeframe>  
    <description>Multiple authentication failures from same source</description>  
    <mitre_attack_id>T1110</mitre_attack_id>  
  </rule>
</group>
```

---

## 2. Suspicious Privilege Escalation

**Purpose:** Detect users elevating privileges unexpectedly.

**MITRE ATT&CK:** T1068 – Privilege Escalation

**Indicators:**

* `sudo` executed by non‑admin accounts
* ACL changes
* Role-switching in applications

**Example Rule:**

```
<rule id="80002" level="9">  
  <match>sudo:.*COMMAND=.*</match>  
  <description>Privilege escalation attempt via sudo</description>
  <mitre_attack_id>T1068</mitre_attack_id>  
</rule>
```

---

## 3. Execution of Unexpected Binaries

**Purpose:** Detect when binaries not in the approved list are executed.

**MITRE ATT&CK:** T1204 – User Execution

**Rule Logic:**

* Maintain an allowlist of approved executables.
* Trigger when unknown binaries launch.

**Example Rule:**

```
<rule id="80003" level="10">  
  <match>process started</match>  
  <regex>/(tmp|home|dev)/.*</regex>  
  <description>Execution of unauthorized binary</description>
  <mitre_attack_id>T1204</mitre_attack_id>  
</rule>
```

---

## 4. File Integrity Monitoring (Core Banking Systems)

**Purpose:** Detect unauthorized changes to:

* Core banking configs
* API gateway settings
* Authentication modules

**MITRE ATT&CK:** T1565 – Data Manipulation

**Rule Example:**

```
<rule id="80004" level="10">  
  <match>ossec: fim</match>  
  <match>modified</match>
  <description>Critical system file modified</description>
  <mitre_attack_id>T1565</mitre_attack_id>  
</rule>
```

---

## 5. Suspicious Network Connections (C2 Behaviors)

**Purpose:** Detect exfiltration or command‑and‑control activity.

**MITRE ATT&CK:** T1071 – C2

**Indicators:**

* Odd ports (e.g., 4444, 8081, 1337)
* Irregular outbound traffic spikes
* Connections to known malicious IPs

**Wazuh Rule:**

```
<rule id="80005" level="12">  
  <match>connection attempt</match>
  <regex>(4444|8081|1337)</regex>  
  <description>Suspicious outbound connection pattern</description>
  <mitre_attack_id>T1071</mitre_attack_id>
</rule>
```

---

## 6. Docker / DevOps Pipeline Attacks

**Purpose:** Detect unauthorized execution inside CI/CD components.

**MITRE ATT&CK:** T1525 – Container Breakout

**Examples of anomalies:**

* `docker exec` run by unknown user
* Registry access using leaked tokens
* Script execution in build servers not triggered by Jenkins/GitLab

**Rule:**

```
<rule id="80006" level="10">  
  <match>docker exec</match>  
  <description>Suspicious docker exec execution</description>
  <mitre_attack_id>T1525</mitre_attack_id>  
</rule>
```

---

## 7. SQL Injection Detection (Web Applications)

**Purpose:** Detect SQLi patterns in requests.

**MITRE ATT&CK:** T1190 – Exploit Public-Facing Application

**Payload Indicators:** `' OR 1=1--`, `UNION SELECT`, `sleep(`

**Rule:**

```
<rule id="80007" level="8">  
  <regex>(' OR 1=1|UNION SELECT|sleep\s*\()</regex>
  <description>SQL Injection Attempt Detected</description>
  <mitre_attack_id>T1190</mitre_attack_id>  
</rule>
```

---

## 8. Cross-Site Scripting (XSS) Detection

**Purpose:** Detect script injection attempts.

**MITRE ATT&CK:** T1059 – Command and Scripting

**Patterns:** `<script>`, `<img src=x onerror=`, `javascript:`

**Rule:**

```
<rule id="80008" level="7">  
  <regex>(<script>|onerror=|javascript:)</regex>  
  <description>Possible XSS Attempt</description>
  <mitre_attack_id>T1059</mitre_attack_id>  
</rule>
```

---

## 9. Ransomware Behavior Detection

**Purpose:** Detect rapid file modifications typical of ransomware.

**MITRE ATT&CK:** T1486 – Data Encryption for Impact

**Rule Logic:**

* Detect large bursts of file writes/deletes within seconds.

**Rule:**

```
<rule id="80009" level="12">  
  <match>ossec: fim</match>
  <frequency>40</frequency>  
  <timeframe>20</timeframe>  
  <description>Potential ransomware activity</description>
  <mitre_attack_id>T1486</mitre_attack_id>  
</rule>
```

---

## 10. API Abuse and Rate Limit Violations

**Purpose:** Detect abnormal API call bursts.

**MITRE ATT&CK:** T1190 – Application Exploitation

**Example Scenarios:**

* DoS attempts
* Credential stuffing
* Automated scraping

**Rule:**

```
<rule id="80010" level="8">  
  <match>/api/</match>
  <frequency>100</frequency>  
  <timeframe>60</timeframe>  
  <description>API Rate Limit Violation</description>
  <mitre_attack_id>T1190</mitre_attack_id>  
</rule>
```

---

## 11. Suspicious Admin Login from New Geo‑Location

**Purpose:** Detect potential account compromise.

**MITRE ATT&CK:** T1078 – Valid Accounts

**Rule Logic:**

* Compare user geo‑location with historical patterns.

**Rule:**

```
<rule id="80011" level="10">  
  <match>admin login</match>
  <description>Admin login from unusual geo‑location</description>
  <mitre_attack_id>T1078</mitre_attack_id>  
</rule>
```

---

## 12. Suspicious Cron Job Creation

**Purpose:** Detect persistence mechanisms via cron.

**MITRE ATT&CK:** T1053 – Scheduled Task

**Rule:**

```
<rule id="80012" level="8">  
  <match>CRON</match>  
  <match>added</match>
  <description>New cron job created</description>
  <mitre_attack_id>T1053</mitre_attack_id>  
</rule>
```

---

## Summary

These rules provide:

* Threat‑driven monitoring
* Strong coverage of MITRE ATT&CK techniques
* SIEM detection logic for endpoints, network, apps, and CI/CD
* Banking‑grade monitoring standards

---

## Burp Suite Hacking Guide

This guide explains how to perform structured application penetration testing using Burp Suite Community or Professional. It is written to match a practical lab workflow for offensive security testing.

---

## 1. Overview of Burp Suite

Burp Suite is an integrated web application security testing platform. It allows interception, modification, and analysis of HTTP/S traffic. Its major components are:

* Proxy
* Repeater
* Intruder (limited in Community edition)
* Decoder
* Comparer
* Scanner (Pro only)

---

## 2. Lab Preparation

Before running tests, ensure:

* A running vulnerable application (DVWA, Juice Shop, Mutillidae, WebGoat)
* Browser configured to use Burp Suite as a proxy
* Interception set to OFF unless actively modifying traffic
* Project file saved to track findings

---

## 3. Methodology for Application Testing

This step-by-step workflow ensures full application coverage.

### Step 1: Map the Application

* Use the browser normally while Burp is running.
* Capture URLs, parameters, authentication flows, and API calls.
* Review the Site Map under the Target tab.

### Step 2: Identify Attack Surfaces

Look for:

* GET/POST parameters
* Cookies
* Headers
* Authentication endpoints
* File upload features
* Hidden fields

### Step 3: Manual Testing Using Repeater

Repeater allows sending customized requests repeatedly.

Use it for:

* SQL Injection validation
* XSS payload delivery
* Parameter tampering
* Broken authentication testing
* API endpoint fuzzing

### Step 4: Automated Testing (Optional)

* Use the Scanner (Pro only) for automated vulnerability discovery.
* Use Intruder for brute forcing or fuzzing.

---

## 4. Practical Attack Examples

### 4.1 SQL Injection

1. Capture vulnerable request.
2. Send to Repeater.
3. Modify parameter values with SQL payloads.
4. Analyze differences in responses.

### 4.2 Cross-Site Scripting (XSS)

1. Identify HTML injection points.
2. Test reflected XSS using Repeater.
3. Inspect browser responses for execution.

### 4.3 Broken Authentication

1. Intercept login request.
2. Manipulate tokens or session cookies.
3. Attempt session fixation or privilege escalation.

### 4.4 Business Logic Testing

Modify:

* Quantities
* Prices
* Authorization headers

Check for responses that violate expected logic.

---

## 5. Reporting Findings

Document each vulnerability with:

* Affected endpoint
* Request/response evidence
* Impact
* Suggested fix
* Steps to reproduce

---

## 6. Additional Tips

* Disable interception during scanning.
* Use Comparer to analyze differences after payload submissions.
* Use Decoder to manipulate encoded/hashed values.
* Always maintain clean project files per application.

---
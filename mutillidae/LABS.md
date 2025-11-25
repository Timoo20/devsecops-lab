


# Mutillidae Web Security Labs

All labs assume Mutillidae is running at: `http://localhost/mutillidae`
Each lab includes objective, background, execution steps, and expected behavior.

---

## Lab 01 – SQL Injection (Authentication Bypass)

### Objective

Bypass login authentication using SQLi.

### Steps

1. Navigate to:

```
OWASP Top 10 → A1 Injection → Login
```

2. Use payload:

```
' OR '1'='1
```

3. Submit the form.

### Expected Behavior

Application logs you in without valid credentials.

---

## Lab 02 – Reflected XSS in Search

### Objective

Observe JavaScript execution via unsanitized input.

### Steps

1. Navigate to search function.
2. Enter:

```html
<script>alert('XSS')</script>
```

3. Submit.

### Expected Behavior

Browser executes alert.

---

## Lab 03 – Stored XSS in User Profile

### Objective

Store persistent XSS.

### Steps

1. Go to:

```
OWASP Top 10 → A7 XSS → User Info
```

2. Insert script into profile fields.

### Expected Behavior

Script executes for every visitor to the page.

---

## Lab 04 – CSRF Exploitation

### Objective

Trigger state-changing action via forged request.

### Steps

1. Create an HTML file containing a POST request targeting Mutillidae.
2. Open it in the browser.

### Expected Behavior

Victim session performs action without consent.

---

## Lab 05 – Command Injection

### Objective

Execute system commands.

### Steps

1. Navigate to DNS lookup feature.
2. Input:

```
127.0.0.1; whoami
```

### Expected Behavior

Output includes system user info.

---

## Lab 06 – File Upload Bypass

### Objective

Upload a malicious file.

### Steps

1. Navigate to file upload.
2. Upload `.php` disguised as `.jpg`.

---

## Lab 07 – Parameter Tampering

### Objective

Manipulate hidden fields.

### Steps

Intercept form, modify price field.

---

## Lab 08 – Weak Password Reset Flow

Manipulate predictable tokens.

---

## Lab 09 – Insecure Direct Object Reference

Access objects by modifying URL IDs.

---

## Lab 10 – Session Fixation

Set session ID before login.

---


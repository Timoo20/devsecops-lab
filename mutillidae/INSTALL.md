# Mutillidae Documentation

Comprehensive installation, labs, and payload references for your DevSecOps Lab. Use only in an isolated Kali VM.

---

## INSTALL.md

# Mutillidae Installation Guide

Running Inside Kali Linux (Single VM)

Mutillidae II is an intentionally vulnerable web application for learning web application security, OWASP Top 10, and penetration testing methodologies.

### 1. Install Required Dependencies

Mutillidae runs on a LAMP stack.

```bash
sudo apt update
sudo apt install apache2 mysql-server php php-mysql php-gd php-xml -y
```

### 2. Download Mutillidae to Web Directory

Place it inside `/var/www/html`.

```bash
cd /var/www/html
sudo git clone https://github.com/webpwnized/mutillidae.git
sudo chown -R www-data:www-data mutillidae
```

### 3. Configure Database

Log into MySQL:

```bash
sudo mysql -u root
```

Create database:

```sql
CREATE DATABASE mutillidae;
```

Import schema:

```bash
cd /var/www/html/mutillidae
sudo mysql mutillidae < databases/create_mutillidae_database.sql
```

### 4. Enable Apache and Start Services

```bash
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl restart mysql
```

### 5. Access the Application

Open browser:

```
http://localhost/mutillidae
```

Set security level to **0 (insecure)** for labs.

---

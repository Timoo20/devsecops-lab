# DVWA Installation Guide (Kali Linux - Single VM Lab)

Damn Vulnerable Web Application (DVWA) is one of the best platforms for practicing real‑world web exploitation techniques such as SQLi, XSS, CSRF, command injection, file upload bypasses, and more.

This document explains how to install, configure, and run DVWA **inside your Kali Linux VM** without using a second machine.

---

##  1. Install Required Packages

DVWA requires Apache, PHP, and MariaDB/MySQL.  
Kali already includes most of them, but we install/verify them anyway.

```bash
sudo apt update
sudo apt install apache2 mariadb-server php php-mysqli php-gd php-zip php-curl -y
```

---

##  2. Clone DVWA into Kali Web Directory

```bash
sudo git clone https://github.com/digininja/DVWA.git /var/www/html/dvwa
```

Set correct permissions:

```bash
sudo chown -R www-data:www-data /var/www/html/dvwa
sudo chmod -R 755 /var/www/html/dvwa
```

---

##  3. Configure the Database

Start MariaDB:

```bash
sudo systemctl start mariadb
sudo mysql_secure_installation
```

When asked about root password — you can set a simple lab password like:

```
root / toor / dvwa123 (your choice)
```

Create DVWA database:

```bash
sudo mysql -u root -p
```

Then inside MySQL:

```sql
CREATE DATABASE dvwa;
CREATE USER 'dvwa'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON dvwa.* TO 'dvwa'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

---

##  4. Configure DVWA Settings

Edit config file:

```bash
sudo nano /var/www/html/dvwa/co

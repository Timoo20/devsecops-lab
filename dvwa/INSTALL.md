# DVWA Installation Guide  
Damn Vulnerable Web Application (DVWA)  
Author: Tim’s Application Hacking Lab  

---

## ⚠ Legal & Ethical Note
This lab is **ONLY** for legal penetration testing and cybersecurity learning.  
Do **NOT** expose DVWA to the public internet.

---

# 1. Prerequisites

You only need **Kali Linux VM**:

DVWA requires:
- Apache2
- PHP 7+
- MariaDB / MySQL
- Git
- PHP modules

---

# 2. Install DVWA (Kali Linux)

### Step 1 — Update system
```bash
sudo apt update && sudo apt upgrade -y




Step 2 — Install LAMP stack
sudo apt install apache2 mariadb-server php php-mysqli php-gd php-curl php-zip php-mbstring git -y

Step 3 — Clone DVWA into web directory
sudo git clone https://github.com/digininja/DVWA.git /var/www/html/dvwa

Step 4 — Set permissions
sudo chown -R www-data:www-data /var/www/html/dvwa
sudo chmod -R 755 /var/www/html/dvwa

Step 5 — Configure database
sudo mysql -u root -e "CREATE DATABASE dvwa;"
sudo mysql -u root -e "CREATE USER 'dvwa'@'localhost' IDENTIFIED BY 'p@ssw0rd';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON dvwa.* TO 'dvwa'@'localhost';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

Step 6 — Edit DVWA config
sudo cp /var/www/html/dvwa/config/config.inc.php.dist /var/www/html/dvwa/config/config.inc.php


Edit:

$_DVWA[ 'db_user' ] = 'dvwa';
$_DVWA[ 'db_password' ] = 'p@ssw0rd';
$_DVWA[ 'recaptcha_public_key' ] = '';
$_DVWA[ 'recaptcha_private_key' ] = '';

Step 7 — Restart Apache
sudo systemctl restart apache2

3. Access DVWA

Open browser inside Kali:

http://127.0.0.1/dvwa


Login:

Username: admin
Password: password


Initialize database → Click "Create / Reset Database".

4. Set Security Level

DVWA → Security tab:

Low

Medium

High

Impossible

Set to LOW when doing labs.

5. Fix Common Permission Error

If “Unable to write to /hackable/uploads”:

sudo chmod 777 /var/www/html/dvwa/hackable/uploads/


If “PHP GD not installed”:

sudo apt install php-gd -y
sudo systemctl restart apache2

6. Extra: Run DVWA via Docker (Optional)
docker run --rm -it -p 80:80 vulnerables/web-dvwa





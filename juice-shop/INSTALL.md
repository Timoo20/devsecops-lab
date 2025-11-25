# OWASP Juice Shop Installation Guide  
Running Inside Kali Linux (Single VM)

OWASP Juice Shop is an intentionally vulnerable web application used for secure coding practice, DevSecOps learning, and OWASP Top 10 exploitation labs.  
This guide documents installation and execution inside a single Kali Linux VM.

---

## 1. Verify Node.js and NPM Installation

Juice Shop requires Node.js (LTS recommended).

Check existing installation:

```bash
node -v
npm -v
If Node.js is missing:

bash
Copy code
sudo apt update
sudo apt install nodejs npm -y
2. Download Juice Shop Source Code
Install it inside /opt or any preferred directory.

bash
Copy code
cd /opt
sudo git clone https://github.com/juice-shop/juice-shop.git
cd juice-shop
3. Install Application Dependencies
bash
Copy code
sudo npm install
This installs all Node modules required to run Juice Shop.

4. Start the Application
bash
Copy code
npm start
Expected output:

nginx
Copy code
Listening on port 3000
5. Access the Web Interface
Open a browser inside Kali:

arduino
Copy code
http://localhost:3000
You should now see the Juice Shop main page.

6. Optional: Run Juice Shop in the Background
Option A: Using nohup
bash
Copy code
nohup npm start &
Option B: Using PM2
bash
Copy code
sudo npm install pm2 -g
pm2 start server.js
7. Important Security Warning
Juice Shop is intentionally vulnerable.
Do not:

Expose it to your host network

Expose it to the internet

Run it on a production environment

Use it only inside your isolated Kali VM.
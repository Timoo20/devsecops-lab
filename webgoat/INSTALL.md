## WebGoat Installation Guide (Kali Linux VM)

WebGoat is an intentionally vulnerable Java-based application created by OWASP for teaching and practicing secure coding, application security, and exploitation of the OWASP Top 10.

This installation guide documents the **full setup inside a single Kali Linux VM**, without requiring additional VMs.

---

## 1. Install Java (OpenJDK 11)

WebGoat requires Java (Java 11 recommended).

Check if Java is installed:

```
java -version
```

If missing or incorrect version, install:

```
sudo apt update
sudo apt install openjdk-11-jdk -y
```

Verify again:

```
java -version
```

---

## 2. Download WebGoat & WebWolf

Install into `/opt` or a workspace directory.

```
cd /opt
sudo mkdir webgoat
cd webgoat
```

Download the latest JAR files:

```
wget https://github.com/WebGoat/WebGoat/releases/latest/download/webgoat-server.jar
wget https://github.com/WebGoat/WebGoat/releases/latest/download/webwolf-server.jar
```

---

## 3. Start WebGoat

Run WebGoat on default port 8080:

```
sudo java -jar webgoat-server.jar
```

When running correctly, you should see:

```
Tomcat started on port(s): 8080...
```

Access in browser:

```
http://localhost:8080/WebGoat
```

---

## 4. Start WebWolf (Optional but recommended)

WebWolf is needed for **email, SSRF, and advanced web exploitation labs**.

Run WebWolf on default port 9090:

```
sudo java -jar webwolf-server.jar
```

Access:

```
http://localhost:9090/WebWolf
```

---

## 5. Running Both in Background (PM2)

Install PM2:

```
sudo npm install -g pm2
```

Start apps:

```
pm2 start "java -jar /opt/webgoat/webgoat-server.jar" --name webgoat
pm2 start "java -jar /opt/webgoat/webwolf-server.jar" --name webwolf
```

Check status:

```
pm2 status
```

Start on boot:

```
pm2 startup
pm2 save
```

---

## 6. Important Security Warning

WebGoat is intentionally vulnerable.
Do **NOT** expose:

* To the host machine
* To the internet
* To production environments

Use only inside your isolated Kali Linux VM.

---

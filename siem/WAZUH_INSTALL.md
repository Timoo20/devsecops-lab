# Wazuh SIEM Installation Guide

Running on Ubuntu 22.04 (Single-Node Setup)

This document explains how to deploy a complete Wazuh SIEM stack including:

* Wazuh Manager
* Wazuh Indexer (OpenSearch)
* Wazuh Dashboard
* Agent installation steps

This setup is suitable for DevSecOps labs, log analysis practice, and SOC monitoring simulations.

---

## 1. System Requirements

* OS: Ubuntu Server 22.04 LTS
* RAM: 4 GB minimum
* Disk: 20 GB+
* User: root or sudo privileges

Update system:

```bash
sudo apt update && sudo apt upgrade -y
```

---

## 2. Download and Run Wazuh Installation Script

The official installation script automates the deployment of the three main components.

```bash
curl -sO https://packages.wazuh.com/4.7/wazuh-install.sh
sudo bash wazuh-install.sh -a
```

This installs:

* Wazuh Manager
* Wazuh Indexer
* Wazuh Dashboard

---

## 3. Access Wazuh Dashboard

After installation, the script prints admin credentials.

Default access:

```
https://<your-server-ip>
```

Example:

```
https://192.168.56.10
```

Login using the credentials generated.

---

## 4. Install Wazuh Agent (Kali or Ubuntu)

### Install agent package

```bash
curl -s https://packages.wazuh.com/4.7/wazuh-agent.sh -o wazuh-agent.sh
sudo bash wazuh-agent.sh
```

### Configure agent

Edit the agent config file:

```bash
sudo nano /var/ossec/etc/ossec.conf
```

Set your manager:

```xml
<server>
  <address>192.168.56.10</address>
</server>
```

Enable and start the agent:

```bash
sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
```

---

## 5. Verify Agent Registration

From the Wazuh Manager:

```bash
/var/ossec/bin/agent_control -l
```

You should see your agent listed.

---

## 6. Basic Troubleshooting

### Check manager status:

```bash
systemctl status wazuh-manager
```

### Check logs:

```bash
tail -f /var/ossec/logs/ossec.log
```

### Check agent connection:

```bash
/var/ossec/bin/agent_control -i <ID>
```

---

## 7. Security Notes

* Do not expose the Wazuh Manager to the internet.
* Use isolated networks for lab setups.
* Control access to the dashboard.
* Set strong passwords and TLS certificates for agents.

---

Wazuh is now fully deployed and ready for SIEM log analysis and detection engineering.

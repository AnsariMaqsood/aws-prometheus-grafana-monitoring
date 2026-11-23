# Grafana Installation on AWS EC2

## 1. Infrastructure
- Cloud Provider: AWS
- Compute: EC2
- Operating System: Ubuntu Linux
- Monitoring Tool: Grafana

## 2. Installation
The Grafana installation script is available at:
scripts/install-grafana.sh

Execute on the Ubuntu EC2 instance:

sudo bash install-grafana.sh

## 3. Service Management

Check service:
sudo systemctl status grafana-server

Start service:
sudo systemctl start grafana-server

Enable at boot:
sudo systemctl enable grafana-server

## 4. Port Verification

sudo ss -tulnp | grep 3000

Grafana default web port: 3000

## 5. AWS Security Group

Configure inbound access:
- Protocol: TCP
- Port: 3000
- Source: Trusted administrator public IP/32

Do not expose Grafana publicly without appropriate access controls.

## 6. Web Access

http://EC2-PUBLIC-IP:3000

Change the default admin password immediately after first login.

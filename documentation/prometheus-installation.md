# Prometheus Installation on AWS EC2

## 1. Infrastructure
- Cloud Provider: AWS
- Service: EC2
- Operating System: Ubuntu 26.04 LTS
- Monitoring: Prometheus
- Web Interface Port: 9090

## 2. Installation

Install Prometheus:

sudo apt update
sudo apt install prometheus -y

## 3. Start Prometheus

sudo systemctl enable --now prometheus

## 4. Verify Service

sudo systemctl status prometheus

## 5. Verify Listening Port

sudo ss -tulnp | grep 9090

## 6. Health Check

curl http://localhost:9090/-/healthy

## 7. Readiness Check

curl http://localhost:9090/-/ready

## 8. Web Interface

http://EC2-PUBLIC-IP:9090

## 9. Prometheus Configuration

Main configuration file:

/etc/prometheus/prometheus.yml

## 10. Security Group

Configured inbound rule:
- Protocol: TCP
- Port: 9090
- Source: 0.0.0.0/0 (as configured for this lab)

Security note:
Restrict Prometheus access to trusted IP addresses in production.

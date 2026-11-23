# Node Exporter Integration with Prometheus

## Infrastructure
- Platform: AWS EC2
- OS: Ubuntu 26.04 LTS
- Prometheus: Port 9090
- Node Exporter: Port 9100

## 1. Installation

sudo apt update
sudo apt install prometheus-node-exporter -y

## 2. Start Service

sudo systemctl enable --now prometheus-node-exporter

## 3. Verify Service

sudo systemctl status prometheus-node-exporter

## 4. Verify Metrics

curl http://localhost:9100/metrics

## 5. Prometheus Configuration

Configuration file:
/etc/prometheus/prometheus.yml

Node Exporter scrape job:

- job_name: 'node'
  static_configs:
    - targets: ['localhost:9100']

## 6. Verify Prometheus Target

Open:
http://EC2-PUBLIC-IP:9090/targets

Expected:
node - UP

## 7. Security

Node Exporter is accessed through localhost.
No public Security Group rule for port 9100 is required.

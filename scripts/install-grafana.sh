#!/usr/bin/env bash

set -euo pipefail

# Install Grafana on Ubuntu using the official Grafana APT repository.

if [[ "$EUID" -ne 0 ]]; then
    echo "Please run this script with sudo."
    exit 1
fi

echo "Updating Ubuntu package index..."
apt-get update

echo "Installing prerequisites..."
apt-get install -y apt-transport-https software-properties-common wget gpg

echo "Creating APT keyring directory..."
install -d -m 0755 /etc/apt/keyrings

echo "Adding Grafana repository signing key..."
wget -q -O - https://apt.grafana.com/gpg.key \
    | gpg --dearmor --yes -o /etc/apt/keyrings/grafana.gpg

chmod 644 /etc/apt/keyrings/grafana.gpg

echo "Adding Grafana APT repository..."
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" \
    > /etc/apt/sources.list.d/grafana.list

echo "Updating package index..."
apt-get update

echo "Installing Grafana..."
apt-get install -y grafana

echo "Enabling and starting Grafana..."
systemctl enable --now grafana-server

echo "Checking Grafana service..."
systemctl --no-pager --full status grafana-server

echo "Grafana installation completed."

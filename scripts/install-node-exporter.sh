#!/usr/bin/env bash

set -euo pipefail

# Install Node Exporter on Ubuntu.

if [[ "$EUID" -ne 0 ]]; then
    echo "Please run this script with sudo."
    exit 1
fi

echo "Updating package index..."
apt update

echo "Installing Node Exporter..."
apt install -y prometheus-node-exporter

echo "Enabling and starting Node Exporter..."
systemctl enable --now prometheus-node-exporter

echo "Checking Node Exporter version..."
prometheus-node-exporter --version

echo "Checking Node Exporter service..."
systemctl --no-pager --full status prometheus-node-exporter

echo "Node Exporter installation completed."

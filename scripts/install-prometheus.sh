#!/usr/bin/env bash

set -euo pipefail

# Install Prometheus on Ubuntu using APT.

if [[ "$EUID" -ne 0 ]]; then
    echo "Please run this script with sudo."
    exit 1
fi

echo "Updating Ubuntu package index..."
apt update

echo "Installing Prometheus..."
apt install -y prometheus

echo "Enabling and starting Prometheus..."
systemctl enable --now prometheus

echo "Checking Prometheus version..."
prometheus --version

echo "Checking Prometheus service..."
systemctl --no-pager --full status prometheus

echo "Prometheus installation completed."

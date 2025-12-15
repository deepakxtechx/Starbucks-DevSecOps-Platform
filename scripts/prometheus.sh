#!/bin/bash
#this script belong to "CLOUDASEEM" YOUTUBE CHANNEL

# Define Prometheus version
PROMETHEUS_VERSION="2.51.2"

# Update system and install necessary packages
echo "Updating system and installing dependencies..."
sudo apt update -y
sudo apt install -y wget tar

# Create Prometheus user
echo "Creating Prometheus user..."
sudo useradd --no-create-home --shell /bin/false prometheus

# Create Prometheus directory
echo "Creating /etc/prometheus directory..."
sudo mkdir -p /etc/prometheus

# Download and extract Prometheus
echo "Downloading and extracting Prometheus..."
cd /tmp
wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
tar -xvzf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz

# Move all extracted files to /etc/prometheus
echo "Moving Prometheus files to /etc/prometheus..."
sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/* /etc/prometheus/

# Set ownership and permissions
echo "Setting permissions..."
sudo chown -R prometheus:prometheus /etc/prometheus

# Create symbolic links for binaries
echo "Creating symlinks for Prometheus binaries..."
sudo ln -s /etc/prometheus/prometheus /usr/local/bin/prometheus
sudo ln -s /etc/prometheus/promtool /usr/local/bin/promtool

# Create Prometheus systemd service
echo "Creating systemd service..."
cat <<EOF | sudo tee /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus Monitoring System
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \\
  --config.file=/etc/prometheus/prometheus.yml \\
  --storage.tsdb.path=/etc/prometheus/data \\
  --web.console.templates=/etc/prometheus/consoles \\
  --web.console.libraries=/etc/prometheus/console_libraries

Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd, enable and start Prometheus
echo "Starting Prometheus..."
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus

# Check Prometheus status
echo "Prometheus installation completed!"
sudo systemctl status prometheus --no-pager

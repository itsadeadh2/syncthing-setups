#!/bin/sh

# Install syncthing (taken from: https://apt.syncthing.net/)
echo "Installing syncthing..."
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update -y
sudo apt-get install syncthing -y

# Create syncthing systemd service
echo "Setting up syncthing service..."
cat > /etc/systemd/system/syncthing.service <<EOF
[Unit]
Description=Syncthing - Open Source Continuous File Synchronization for %i
After=network.target

[Service]
User=ark
ExecStart=/usr/bin/syncthing serve --gui-address=0.0.0.0:8443
Restart=on-failure
RestartSec=10
StartLimitInterval=60
StartLimitBurst=4

[Install]
WantedBy=multi-user.target
EOF

# Start syncthing systemd service
echo "Starting syncthing service..."
sudo systemctl daemon-reload
sudo systemctl enable syncthing
sudo systemctl start syncthing


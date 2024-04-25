#!/bin/sh

cd $HOME
ST_PATH="$HOME/syncthing"

# Download/Extract syncthing for ARM64
echo "Downloading Syncthing v1.27.6"
curl -L -o syncthing-linux-arm64-v1.27.6.tar.gz https://github.com/syncthing/syncthing/releases/download/v1.27.6/syncthing-linux-arm64-v1.27.6.tar.gz
tar -xzf syncthing-linux-arm64-v1.27.6.tar.gz  -C .
rm -f syncthing-linux-arm64-v1.27.6.tar.gz
mv syncthing-linux-arm64-v1.27.6 $ST_PATH

# Create syncthing systemd service
echo "Creating syncthing service"
mkdir $HOME/services
cat > $HOME/.config/system.d/syncthing.service <<EOF
[Unit]
Description=Syncthing - Open Source Continuous File Synchronization for %i
After=network.target

[Service]
Environment="HOME=/storage"
WorkingDirectory=/storage
ExecStart=/storage/syncthing/syncthing serve --gui-address=0.0.0.0:8443
Restart=on-failure
RestartSec=10
StartLimitInterval=60
StartLimitBurst=4

[Install]
WantedBy=multi-user.target
EOF

# Reload and start syncthing service
echo "Starting syncthing service"
systemctl daemon-reload
systemctl enable syncthing
systemctl start syncthing

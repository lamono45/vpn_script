#!/bin/bash

# ------------------------------------------
# ipvps.sh – Simpan IP VPS ke dalam file conf
# ------------------------------------------

CONFIG_DIR="/etc/vpn"
mkdir -p "$CONFIG_DIR"

# Ambil IP publik dari layanan IP checker
MYIP=$(wget -qO- ipv4.icanhazip.com)

# Simpan ke file
echo "$MYIP" > "$CONFIG_DIR/ipvps.conf"

echo "✅ IP VPS ($MYIP) disimpan di $CONFIG_DIR/ipvps.conf"

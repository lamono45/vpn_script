#!/bin/bash

# ----------------------------------------
# domain.sh – Input domain atau fallback ke IP VPS
# Bagian dari: vpn-script by lamono45
# ----------------------------------------

CONFIG_DIR="/etc/vpn"
mkdir -p "$CONFIG_DIR"

read -rp "🌐 Masukkan domain/subdomain Anda (biarkan kosong untuk pakai IP VPS): " DOMAIN

if [[ -z $DOMAIN ]]; then
    DOMAIN=$(wget -qO- ipv4.icanhazip.com)
    echo "ℹ️ Tidak ada domain dimasukkan, menggunakan IP VPS: $DOMAIN"
fi

# Simpan ke 2 file: domain.conf dan ipserver (untuk kompatibilitas lama)
echo "$DOMAIN" > "$CONFIG_DIR/domain.conf"
echo "$DOMAIN" > "/etc/vpn-script/config/ipserver"

# Tampilkan informasi
echo "✅ Domain/IP disimpan di:"
echo "  • /etc/vpn/domain.conf"
echo "  • /etc/vpn-script/config/ipserver (kompatibilitas lama)"

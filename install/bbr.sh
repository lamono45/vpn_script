#!/bin/bash

echo "🔧 Mengaktifkan TCP BBR..."

# Aktifkan BBR
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p

# Cek apakah sudah aktif
BBR_STATUS=$(sysctl net.ipv4.tcp_congestion_control | awk '{print $3}')
if [[ "$BBR_STATUS" == "bbr" ]]; then
  echo "✅ TCP BBR berhasil diaktifkan."
else
  echo "❌ Gagal mengaktifkan BBR."
fi

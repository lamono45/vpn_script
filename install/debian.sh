#!/bin/bash

# ----------------------
# Auto Installer VPN
# By: lamono45 (GitHub)
# ----------------------

clear
echo -e "\033[1;32m▶️ Memulai proses instalasi VPN...\033[0m"

# Cek apakah root
if [ "$(id -u)" -ne 0 ]; then
  echo -e "\033[1;31m❌ Script ini harus dijalankan sebagai root!\033[0m"
  exit 1
fi

# Tentukan IP VPS
MYIP=$(wget -qO- ipv4.icanhazip.com)
echo -e "\033[1;36m🖥️ IP VPS: $MYIP\033[0m"

# Buat direktori kerja
mkdir -p /etc/vpn-script
cd /etc/vpn-script || exit

# Source repo
GITHUB_USER="lamono45"
REPO="vpn-script"
BASE_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO/main"

# Unduh script komponen
echo -e "\033[1;34m⬇️ Mengunduh script komponen...\033[0m"
wget -q --show-progress "$BASE_URL/install/kyt.sh" -O kyt.sh
wget -q --show-progress "$BASE_URL/install/premi.sh" -O premi.sh

chmod +x kyt.sh premi.sh

# Jalankan script kyt.sh (instalasi utama)
echo -e "\033[1;33m⚙️ Menjalankan kyt.sh...\033[0m"
./kyt.sh

# Jalankan script premi.sh (fitur premium)
echo -e "\033[1;33m✨ Menjalankan premi.sh...\033[0m"
./premi.sh

# Selesai
echo -e "\n\033[1;32m✅ Instalasi selesai!\033[0m"
echo -e "\033[1;36mSilakan ketik 'menu' untuk memulai.\033[0m"

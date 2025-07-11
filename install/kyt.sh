#!/bin/bash

# --------------------------------------------------
# kyt.sh – Setup dasar server & konfigurasi menu
# Bagian dari: https://github.com/lamono45/vpn-script
# --------------------------------------------------

# Warna
RED="\033[1;31m"
GREEN="\033[1;32m"
NC="\033[0m"

clear
echo -e "${GREEN}▶️ Memulai konfigurasi server VPN...${NC}"

# --- Menampilkan Logo ---
echo -e "${GREEN}🖼️ Menampilkan logo...${NC}"
bash "$(pwd)/install/logo.sh"

# --- Konfigurasi Domain ---
echo -e "${GREEN}🌐 Konfigurasi domain...${NC}"
bash "$(pwd)/install/domain.sh"

# --- Optimasi Jaringan BBR ---
echo -e "${GREEN}🚀 Mengaktifkan TCP BBR...${NC}"
bash "$(pwd)/install/bbr.sh"

# --- Instalasi Tools Tambahan ---
echo -e "${GREEN}🛠️ Menginstal tools tambahan...${NC}"
bash "$(pwd)/install/tools.sh"

# --- Salin Semua Script Menu dan Premium ke /usr/local/bin ---
echo -e "${GREEN}📦 Menyalin script ke /usr/local/bin...${NC}"

for file in premium/*; do
    cp "$file" /usr/local/bin/
done

for file in menu/*; do
    cp "$file" /usr/local/bin/
done

# Menu utama
cp install/menu1122.sh /usr/local/bin/menu
chmod +x /usr/local/bin/*

# Tambahkan agar menu muncul otomatis saat login
if ! grep -q "menu" ~/.bashrc; then
  echo "menu" >> ~/.bashrc
fi

echo -e "${GREEN}✅ Setup selesai. Silakan ketik 'menu' untuk menggunakan fitur VPN Anda.${NC}"

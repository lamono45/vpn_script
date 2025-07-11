#!/bin/bash

# ----------------------------------
# menu1122.sh – Menu Utama VPN
# Bagian dari: https://github.com/lamono45/vpn-script
# ----------------------------------

clear
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[1;32m       MENU UTAMA VPN         \e[0m"
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"

echo -e "1. Tambah Akun Premium"
echo -e "2. Tambah Akun Trial"
echo -e "3. Cek User Login"
echo -e "4. Hapus Akun"
echo -e "5. Perpanjang Akun"
echo -e "6. Batasi Akun Aktif"
echo -e "7. AutoKill Akun Melebihi Limit"
echo -e "8. Menu Tambahan"
echo -e "9. Restart Semua Layanan"
echo -e "10. Update Script Menu"
echo -e "0. Keluar"
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"

read -rp "Pilih opsi [0-10]: " menu

case $menu in
  1)
    clear
    bash /usr/local/bin/add-prem
    ;;
  2)
    clear
    bash /usr/local/bin/add-trial
    ;;
  3)
    clear
    bash /usr/local/bin/cek-user
    ;;
  4)
    clear
    bash /usr/local/bin/del-user
    ;;
  5)
    clear
    bash /usr/local/bin/renew-user
    ;;
  6)
    clear
    bash /usr/local/bin/limit-user
    ;;
  7)
    clear
    bash /usr/local/bin/autokill
    ;;
  8)
    clear
    bash /usr/local/bin/add-ip
    ;;
  9)
    clear
    echo "👉 Merestart semua layanan..."
    systemctl restart ssh
    systemctl restart nginx
    systemctl restart xray
    echo "✅ Semua layanan berhasil direstart."
    ;;
  10)
    clear
    echo "👉 Mengupdate script menu..."
    wget -q -O /usr/local/bin/menu https://raw.githubusercontent.com/lamono45/vpn-script/main/menu/menu1122.sh
    chmod +x /usr/local/bin/menu
    echo "✅ Menu berhasil diupdate."
    ;;
  0)
    echo "Keluar dari menu..."
    exit 0
    ;;
  *)
    echo "❌ Pilihan tidak valid!"
    sleep 1
    ;;
esac

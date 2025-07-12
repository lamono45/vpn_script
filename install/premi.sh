#!/bin/bash

# --------------------------------------------------
# premi.sh – Konfigurasi fitur akun premium & trial
# Bagian dari: https://github.com/lamono45/vpn_script
# --------------------------------------------------

clear
echo -e "\033[1;32m▶️ Menyiapkan fitur akun premium & trial...\033[0m"

# Cek dan buat direktori data user
mkdir -p /etc/vpn-script/premium
mkdir -p /etc/vpn-script/trial

# Konfigurasi auto-limitasi akun
echo -e "\033[1;34m🔒 Menyiapkan limitasi akun VPN...\033[0m"

GITHUB_USER="lamono45"
REPO="vpn-script"
BASE_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO/main"

SYSTEMD_UNITS=("limitshadowsocks.service" "limittrojan.service" "limitvless.service" "limitvmess.service" "runn.service")

for svc in "${SYSTEMD_UNITS[@]}"; do
    wget -q -O "/etc/systemd/system/$svc" "$BASE_URL/systemd/$svc"
    systemctl enable "$svc"
done

systemctl daemon-reexec
systemctl daemon-reload

# Unduh script tambahan untuk akun premium & trial
echo -e "\033[1;34m⬇️ Mengunduh script akun premium...\033[0m"

mkdir -p /usr/local/bin

PREMIUM_SCRIPTS=("add-trial" "add-prem" "cek-user" "del-user" "renew-user" "limit-user" "autokill")

for scr in "${PREMIUM_SCRIPTS[@]}"; do
    wget -q --show-progress "$BASE_URL/premium/$scr" -O "/usr/local/bin/$scr"
    chmod +x "/usr/local/bin/$scr"
done

# Jadwalkan autokill user
echo -e "\033[1;34m📅 Menjadwalkan autokill user harian...\033[0m"
cat > /etc/cron.d/autokill <<-EOF
*/5 * * * * root /usr/local/bin/autokill
EOF

# Selesai
echo -e "\n\033[1;32m✅ Fitur akun premium & trial selesai dikonfigurasi.\033[0m"
echo -e "\033[1;36mKetik 'menu' untuk mulai mengelola akun VPN Anda.\033[0m"

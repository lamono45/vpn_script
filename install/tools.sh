#!/bin/bash

echo "🛠️ Menginstall tools tambahan..."
apt install -y neofetch htop vnstat screenfetch net-tools bmon

# Jalankan neofetch saat login (opsional)
echo "neofetch" >> ~/.bashrc

echo "✅ Tools tambahan berhasil diinstall."

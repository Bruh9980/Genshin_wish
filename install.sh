#!/data/data/com.termux/files/usr/bin/bash

# --- Colors ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}[1/3] Installing dependencies...${NC}"
pkg update -y
pkg install android-tools termux-api -y

echo -e "${YELLOW}[2/3] Setting up executable...${NC}"
# Memberi izin eksekusi ke skrip utama
chmod +x genshin_wish_extractor.sh

# Memindahkan/Copy ke folder bin agar bisa dipanggil tanpa ./
# Kita beri nama alias 'wishlog' agar mudah diketik
cp genshin_wish_extractor.sh $PREFIX/bin/wishlog
chmod +x $PREFIX/bin/wishlog

echo -e "${YELLOW}[3/3] Finalizing...${NC}"
# Memastikan plugin termux-api bisa jalan
if [[ ! -f "$PREFIX/bin/termux-clipboard-set" ]]; then
    echo -e "${YELLOW}Warning: Please make sure 'Termux:API' app is installed from F-Droid.${NC}"
fi

echo -e "${GREEN}Installation Complete!${NC}"
echo -e "You can now run the script by simply typing: ${YELLOW}wishlog${NC}"

#!/data/data/com.termux/files/usr/bin/bash

# --- Color Palette ---
CL_BLUE='\033[0;34m'
CL_GREEN='\033[0;32m'
CL_RED='\033[0;31m'
CL_YELLOW='\033[1;33m'
CL_CYAN='\033[0;36m'
NC='\033[0m'

clear

echo -e "${CL_BLUE}====================================================${NC}"
echo -e "${CL_GREEN}       GENSHIN IMPACT WISH HISTORY EXTRACTOR        ${NC}"
echo -e "${CL_CYAN}            ( ADB Wireless Mobile )            ${NC}"
echo -e "${CL_BLUE}====================================================${NC}"

# 2. Connection Menu
echo -e "\n${CL_YELLOW}[1/2] ADB Connection Setup${NC}"
echo -e "1) New Pairing (First time only)"
echo -e "2) Connect Directly (If already paired)"
echo -e "3) Exit"
read -p "Select choice [1-3]: " menu_choice

case $menu_choice in
    1)
        echo -e "\n${CL_CYAN}Instruction:${NC} Go to Wireless Debugging > Pair device with pairing code"
        read -p "Enter Pairing Port: " p_port
        echo -e "${CL_YELLOW}Running adb pair...${NC}"
        adb pair "localhost:$p_port"
        ;;
    2)
        echo -e "${CL_BLUE}Skipping pairing step...${NC}"
        ;;
    3)
        exit 0
        ;;
    *)
        echo -e "${CL_RED}Invalid option.${NC}"
        exit 1
        ;;
esac

# Connection Port
echo -e "\n${CL_CYAN}Instruction:${NC} Enter the port from 'IP address & Port' section"
read -p "Enter Connection Port: " c_port
echo -e "${CL_YELLOW}Connecting...${NC}"
adb connect "localhost:$c_port"

# Verification
if ! adb devices | grep -q "localhost:$c_port"; then
    echo -e "${CL_RED}Error: Failed to connect to localhost:$c_port${NC}"
    exit 1
fi

echo -e "${CL_GREEN}Device Connected!${NC}"

# 3. Wish Extraction
echo -e "\n${CL_YELLOW}[2/2] Extraction Mode${NC}"
echo -e "${CL_BLUE}----------------------------------------------------${NC}"
echo -e "1. Open ${CL_CYAN}Genshin Impact${NC}"
echo -e "2. Go to ${CL_CYAN}Wish Menu > History${NC}"
echo -e "3. Wait for the page to load completely"
echo -e "${CL_BLUE}----------------------------------------------------${NC}"
echo -e "${CL_YELLOW}Waiting for link... (Process will auto-exit on success)${NC}"

# Clear logs
adb logcat -c

# Run the command you requested in background
(
    adb logcat -m 1 -e "OnGetWebViewPageFinish.+https.+/log" | grep -oE "https.+/log" | tee >(termux-clipboard-set) | sed "s/^/\n${CL_GREEN}RESULT: ${NC}/"
    
    echo -e "\n${CL_GREEN}Success! The link has been copied to your clipboard.${NC}"
    
    # Auto kill adb to save battery
    adb kill-server &> /dev/null
    echo -e "\n${CL_YELLOW}Session closed. Press ENTER to exit.${NC}"
) &

# Loop until user finishes
read -p ""
kill $! 2>/dev/null
adb kill-server
echo -e "${CL_GREEN}Done. Now you can open paimon.moe. Hppy flexing${NC}"

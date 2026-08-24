#!/bin/bash
# ================================================================
#  PROXC — Linux / macOS Uninstaller
#  Author  : Mithun A
#  Version : v1.0.4
# ================================================================

DEFAULT_INSTALL_DIR="/usr/local/bin"
USER_INSTALL_DIR="${HOME}/.local/bin"

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

echo ""
echo -e "  ${CYAN}${BOLD}PROXC — Uninstaller${RESET}"
echo -e "  ${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

REMOVED=0

# Remove proxc
if [[ -f "${DEFAULT_INSTALL_DIR}/proxc" ]]; then
    if [[ $EUID -ne 0 ]]; then
        echo -e "  ${RED}[!] Sudo required to remove ${DEFAULT_INSTALL_DIR}/proxc. Run: sudo bash uninstall.sh${RESET}"
        echo ""
        exit 1
    fi
    rm -f "${DEFAULT_INSTALL_DIR}/proxc"
    echo -e "  ${GREEN}[✔] Removed ${DEFAULT_INSTALL_DIR}/proxc${RESET}"
    REMOVED=1
fi

if [[ -f "${USER_INSTALL_DIR}/proxc" ]]; then
    rm -f "${USER_INSTALL_DIR}/proxc"
    echo -e "  ${GREEN}[✔] Removed ${USER_INSTALL_DIR}/proxc${RESET}"
    REMOVED=1
fi

# Clean legacy proxychk binary if present
if [[ -f "${DEFAULT_INSTALL_DIR}/proxychk" ]]; then
    if [[ $EUID -eq 0 ]]; then
        rm -f "${DEFAULT_INSTALL_DIR}/proxychk"
        echo -e "  ${GREEN}[✔] Removed legacy ${DEFAULT_INSTALL_DIR}/proxychk${RESET}"
    fi
fi
if [[ -f "${USER_INSTALL_DIR}/proxychk" ]]; then
    rm -f "${USER_INSTALL_DIR}/proxychk"
    echo -e "  ${GREEN}[✔] Removed legacy ${USER_INSTALL_DIR}/proxychk${RESET}"
fi

if [[ $REMOVED -eq 0 ]]; then
    echo -e "  ${RED}[!] PROXC was not found in standard system locations.${RESET}"
fi

echo ""

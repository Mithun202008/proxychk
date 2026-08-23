#!/bin/bash
# ================================================================
#  proxychk — Linux / macOS Uninstaller
#  Author  : Mithun A
#  Version : v1.0.0
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
echo -e "  ${CYAN}${BOLD}proxychk — Uninstaller${RESET}"
echo -e "  ${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

REMOVED=0

if [[ -f "${DEFAULT_INSTALL_DIR}/proxychk" ]]; then
    if [[ $EUID -ne 0 ]]; then
        echo -e "  ${RED}[!] Sudo required to remove ${DEFAULT_INSTALL_DIR}/proxychk. Run: sudo bash uninstall.sh${RESET}"
        echo ""
        exit 1
    fi
    rm -f "${DEFAULT_INSTALL_DIR}/proxychk"
    echo -e "  ${GREEN}[✔] Removed ${DEFAULT_INSTALL_DIR}/proxychk${RESET}"
    REMOVED=1
fi

if [[ -f "${USER_INSTALL_DIR}/proxychk" ]]; then
    rm -f "${USER_INSTALL_DIR}/proxychk"
    echo -e "  ${GREEN}[✔] Removed ${USER_INSTALL_DIR}/proxychk${RESET}"
    REMOVED=1
fi

if [[ $REMOVED -eq 0 ]]; then
    echo -e "  ${RED}[!] proxychk was not found in standard system locations.${RESET}"
fi

echo ""

#!/bin/bash
# ================================================================
#  proxychk — Linux / macOS System-Wide Installer
#  Author  : Mithun A
#  Version : v1.0.0
# ================================================================

TOOL="proxychk"
DEFAULT_INSTALL_DIR="/usr/local/bin"
USER_INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

echo ""
echo -e "  ${CYAN}${BOLD}proxychk — System Installer (Linux / macOS)${RESET}"
echo -e "  ${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

# Check Python 3
if ! command -v python3 &>/dev/null && ! command -v python &>/dev/null; then
    echo -e "  ${RED}[!] Python 3 is required but not found. Please install Python 3 and retry.${RESET}"
    echo ""
    exit 1
fi

PYTHON_CMD="python3"
if ! command -v python3 &>/dev/null; then
    PYTHON_CMD="python"
fi

# Determine target directory
if [[ $EUID -eq 0 ]]; then
    TARGET_DIR="${DEFAULT_INSTALL_DIR}"
else
    if [[ -d "${USER_INSTALL_DIR}" ]] || mkdir -p "${USER_INSTALL_DIR}" 2>/dev/null; then
        TARGET_DIR="${USER_INSTALL_DIR}"
    else
        echo -e "  ${RED}[!] Root privileges required to install to ${DEFAULT_INSTALL_DIR}.${RESET}"
        echo -e "  ${DIM}    Run: sudo bash install.sh${RESET}"
        echo ""
        exit 1
    fi
fi

# Copy tool & set permissions
cp "${SCRIPT_DIR}/${TOOL}" "${TARGET_DIR}/${TOOL}"
chmod +x "${TARGET_DIR}/${TOOL}"

echo -e "  ${GREEN}[✔] Installed binary →  ${TARGET_DIR}/${TOOL}${RESET}"
echo -e "  ${GREEN}[✔] Python Runtime  →  $(${PYTHON_CMD} --version)${RESET}"
echo ""
echo -e "  ${BOLD}You can now run proxychk from anywhere:${RESET}"
echo -e "  ${CYAN}  proxychk proxies.csv${RESET}"
echo -e "  ${CYAN}  proxychk proxies.csv https://example.com 3${RESET}"
echo -e "  ${CYAN}  proxychk --help${RESET}"
echo ""
echo -e "  ${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

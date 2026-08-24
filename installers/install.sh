#!/bin/bash
# ================================================================
#  PROXC — Linux / macOS System-Wide Installer
#  Author  : Mithun A
#  Version : v1.0.2
# ================================================================

TOOL="proxc"
DEFAULT_INSTALL_DIR="/usr/local/bin"
USER_INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

echo ""
echo -e "  ${CYAN}${BOLD}PROXC — System Installer (Linux / macOS)${RESET}"
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
        echo -e "  ${DIM}    Run: sudo bash installers/install.sh${RESET}"
        echo ""
        exit 1
    fi
fi

# Copy tool & set permissions
cp "${ROOT_DIR}/${TOOL}" "${TARGET_DIR}/${TOOL}"
chmod +x "${TARGET_DIR}/${TOOL}"

# Create symlink in /usr/bin for universal sudo PATH compatibility
if [[ $EUID -eq 0 ]] && [[ "${TARGET_DIR}" != "/usr/bin" ]] && [[ -d "/usr/bin" ]]; then
    ln -sf "${TARGET_DIR}/${TOOL}" "/usr/bin/${TOOL}" 2>/dev/null || true
fi

echo -e "  ${GREEN}[✔] Installed binary →  ${TARGET_DIR}/${TOOL}${RESET}"
echo -e "  ${GREEN}[✔] Python Runtime  →  $(${PYTHON_CMD} --version)${RESET}"
echo ""
echo -e "  ${BOLD}You can now run proxc from anywhere:${RESET}"
echo -e "  ${CYAN}  proxc examples/proxies.csv${RESET}"
echo -e "  ${CYAN}  proxc examples/proxies.csv https://example.com 3${RESET}"
echo -e "  ${CYAN}  proxc --help${RESET}"
echo ""
echo -e "  ${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

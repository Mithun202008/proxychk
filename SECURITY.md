# Security Policy

## Supported Versions

The following table outlines the currently supported version of **PROXC (proxychk)** for security updates and bug fixes:

| Version | Supported | Notes |
|---|---|---|
| `v1.0.6` | ✅ Yes | Current stable release |
| `< 1.0.6` | ❌ No | Legacy releases; users are advised to upgrade |

Older versions are not actively maintained and may not receive security fixes. Users are strongly encouraged to always upgrade to the latest stable release (e.g., via `proxc --update` or `pip install --upgrade`).

---

## Reporting a Security Vulnerability

We take the security of PROXC seriously. If you discover or suspect a security vulnerability, please report it responsibly.

> [!IMPORTANT]
> **Please do NOT publicly disclose exploitable security vulnerabilities in public GitHub Issues, discussions, or pull requests.**

### How to Submit a Report

1. **GitHub Private Security Advisory (Recommended)**:  
   If enabled on this repository, please report the vulnerability privately via GitHub's [Private Vulnerability Reporting](https://github.com/Mithun202008/proxychk/security/advisories/new) tool.

2. **Alternative Private Contact**:  
   If GitHub Private Vulnerability Reporting is unavailable, please contact the repository owner ([Mithun202008](https://github.com/Mithun202008)) privately via their GitHub profile or security message options before making any public disclosure.

### Information to Include in Your Report

To help us investigate and resolve the issue efficiently, please include as much detail as possible in your report:

- **PROXC Version**: Exact version number (e.g., `1.0.6` checked via `proxc --version`).
- **Operating System**: OS name and version (e.g., Linux / Kali Linux, macOS 14, Windows 11).
- **Reproduction Steps**: Step-by-step instructions to reproduce the vulnerability.
- **Expected vs. Actual Behavior**: Detailed description of what should happen versus what actually happens.
- **Relevant Logs & Output**: Terminal logs, tracebacks, or command invocation output.
- **Proof of Concept (PoC)**: A minimal PoC script or command demonstration, where appropriate.

---

## Response Expectations

- **Acknowledgement**: We aim to acknowledge receipt of security vulnerability reports as reasonably soon as possible upon receiving the private report.
- **Assessment**: We will investigate and attempt to reproduce the reported vulnerability.
- **Remediation**: If verified, we will develop, test, and release a security patch in an upcoming version.
- *Note: As an open-source project, response times are on a best-effort basis without strict SLA guarantees.*

---

## Responsible Disclosure Guidance

We kindly ask security researchers and reporters to:

- Allow reasonable time for investigation, patching, and release before publicly disclosing any details.
- Avoid accessing, modifying, or destroying third-party data during your testing.
- Act in good faith to avoid privacy violations, degradation of service, or disruption to target systems.

---

## Scope

### In-Scope

The security policy applies to security issues within the official PROXC codebase and components:

- PROXC core engine source code (`proxc.py`, `proxc`)
- Official installer and uninstaller scripts (`installers/install.sh`, `installers/install.ps1`, etc.)
- Debian / Kali packaging configurations (`debian/`)
- CLI command-line argument parsing and input handling behavior

### Out-of-Scope

The following items are outside the scope of PROXC security reports:

- **Third-Party Proxy Servers**: Security, availability, or behavior of third-party proxies tested using PROXC.
- **Local Network Configurations**: User firewall rules, ISP routing, or local network security settings.
- **Third-Party Dependencies & Services**: Vulnerabilities in external target endpoints (e.g., `httpbin.org`) or standard Python libraries, unless they directly compromise PROXC's safe local execution.

---

## Authorized & Ethical Use Statement

**PROXC** is designed and intended strictly for legitimate network security testing, proxy validation, authorized security assessments, and network administration tasks. Users are responsible for ensuring that their use of PROXC complies with all applicable local, national, and international laws and regulations.

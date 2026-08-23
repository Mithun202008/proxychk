# PROXYCHK — Proxy Validation & Analysis Engine

```text
                               __         __  
    ____  _________  _  ______/ /_  _____/ /__
   / __ \/ ___/ __ \| |/_/ __  / / / / __/ //_/
  / /_/ / /  / /_/ />  </ /_/ / /_/ / /_/ ,<   
 / .___/_/   \____/_/|_|\__,_/\__, /\__/_/|_|  
/_/                           /____/            

  PROXYCHK v1.0.0 — Proxy Validation & Analysis Engine
  Author: Mithun A | GitHub: https://github.com/Mithun202008/proxychk
```

[![Python 3.6+](https://img.shields.io/badge/python-3.6+-blue.svg)](https://www.python.org/downloads/)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-green.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red.svg)]()

**PROXYCHK** is a high-performance, zero-dependency, cross-platform CLI tool for validating proxy lists. It features real-time streaming output, intelligent CSV field auto-detection, multi-threaded checking, full HTTP/HTTPS/SOCKS4/SOCKS5 protocol support, and comprehensive metadata detail cards for working proxies.

---

## 📁 Repository Structure

```text
proxychk/
├── proxychk                # Main cross-platform Python CLI binary engine
├── setup.py                # Standard Python package setup
├── README.md               # Repository documentation
├── LICENSE                 # Open-source MIT License
├── .gitignore              # Git ignore configuration
├── installers/             # Platform-specific installer scripts
│   ├── install.sh          # Linux & macOS installer
│   ├── uninstall.sh        # Linux & macOS uninstaller
│   ├── install.ps1         # Windows PowerShell installer
│   ├── uninstall.ps1       # Windows PowerShell uninstaller
│   └── proxychk.cmd        # Windows CMD/PowerShell helper launcher
└── examples/               # Sample CSV proxy lists
    ├── proxies.csv         # Standard test proxy list
    └── Free_Proxy_List.csv # Multi-column test proxy list
```

---

## 🛠️ Installation Links by Operating System

Select your operating system for direct step-by-step installation instructions:

- [🐧 Linux & Kali Linux Installation](#-linux--kali-linux-installation)
- [🪟 Windows Installation](#-windows-installation)
- [🍎 macOS Installation](#-macos-installation)
- [🐍 Universal Python / Pip Installation](#-universal-python--pip-installation)

---

### 🐧 Linux & Kali Linux Installation

1. **Clone the repository and enter the directory**:
   ```bash
   git clone https://github.com/Mithun202008/proxychk.git
   cd proxychk
   ```

2. **Run the Linux installer**:
   ```bash
   sudo bash installers/install.sh
   ```
   *(To install without root privileges into `~/.local/bin`, run `bash installers/install.sh`)*

3. **Verify installation**:
   ```bash
   proxychk --help
   ```

---

### 🪟 Windows Installation

1. **Clone the repository and enter the directory**:
   ```powershell
   git clone https://github.com/Mithun202008/proxychk.git
   cd proxychk
   ```

2. **Run the PowerShell installer**:
   ```powershell
   powershell -ExecutionPolicy Bypass -File installers/install.ps1
   ```

3. **Restart PowerShell** to refresh your PATH variable, then test:
   ```powershell
   proxychk --help
   ```

---

### 🍎 macOS Installation

1. **Clone the repository and enter the directory**:
   ```bash
   git clone https://github.com/Mithun202008/proxychk.git
   cd proxychk
   ```

2. **Run the installer**:
   ```bash
   sudo bash installers/install.sh
   ```

3. **Verify installation**:
   ```bash
   proxychk --help
   ```

---

### 🐍 Universal Python / Pip Installation

You can also install `proxychk` directly via Python standard package installer on any operating system:

```bash
git clone https://github.com/Mithun202008/proxychk.git
cd proxychk
pip install .
```

---

## 🚀 Usage & Examples

Once installed, `proxychk` can be executed from **any directory** in your terminal!

### 1. Basic Scan (Default Target & Timeout)
```bash
proxychk examples/proxies.csv
```

### 2. Test Against a Custom Endpoint
```bash
proxychk examples/proxies.csv https://example.com
```

### 3. Custom Timeout (e.g., 3 Seconds per Proxy)
```bash
proxychk examples/proxies.csv https://example.com 3
```

### 4. High Performance Multi-Threaded Scan ⚡
Scan large proxy lists concurrently (**10 worker threads**, **3s timeout**):
```bash
proxychk examples/proxies.csv http://httpbin.org/ip 3 10
```

### 5. Using Command Flags
```bash
# Set target (-u), timeout (-w), threads (-t), and custom output file (-o)
proxychk -t 20 -w 3 -u https://httpbin.org/ip -o live_proxies.txt examples/proxies.csv
```

---

## 🚩 Command Line Options & Flags

| Flag | Long Flag | Description | Default |
|---|---|---|---|
| `-h` | `--help` | Show help menu and supported CSV fields | — |
| `-v` | `--version` | Display tool version and author info | — |
| `-u` | `--target` | Target URL to test proxies against | `http://httpbin.org/ip` |
| `-w` | `--timeout` | Seconds per proxy attempt before timing out | `5` |
| `-t` | `--threads` | Number of concurrent worker threads | `1` |
| `-o` | `--output` | Custom destination file for working proxies | `working_proxies_TIMESTAMP.txt` |

---

## 📋 Supported CSV Fields

`proxychk` automatically detects headers in your CSV regardless of column order or naming conventions:

| Property | Supported Header Names |
|---|---|
| **IP Address** | `ip`, `host`, `ipaddress`, `ip_address`, `address` |
| **Port** | `port` |
| **Protocol** | `protocols`, `protocol`, `type`, `proxytype`, `proto` |
| **Country** | `country`, `countrycode`, `country_code`, `cc` |
| **Anonymity** | `anonymitylevel`, `anonymity`, `anon`, `level` |
| **ASN** | `asn` |
| **Organization** | `org`, `organization` |
| **ISP** | `isp`, `provider` |
| **Latency** | `latency`, `responsetime`, `response_time`, `ping` |
| **Speed** | `speed` |
| **UpTime** | `uptime`, `up_time`, `uptimesuccesscount`, `uptimetrycount` |
| **Updated At** | `updated_at`, `lastseen`, `last_checked`, `updated`, `date` |

---

## 🗑️ Uninstallation

- **Linux / Kali / macOS**: `sudo bash installers/uninstall.sh`
- **Windows**: `powershell -ExecutionPolicy Bypass -File installers/uninstall.ps1`

---

## 👤 Author & License

- **Author / Origin**: Mithun A ([@Mithun202008](https://github.com/Mithun202008))
- **Repository**: [https://github.com/Mithun202008/proxychk](https://github.com/Mithun202008/proxychk)
- **License**: Open Source under the [MIT License](LICENSE)

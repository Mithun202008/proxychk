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

## ✨ Features

- ⚡ **Cross-Platform**: Native support for **Linux** (Kali, Ubuntu, Debian), **macOS**, and **Windows** (PowerShell, CMD).
- 📦 **Zero External Dependencies**: Built entirely with Python 3 standard library (no `pip` installs required).
- 🔍 **Auto CSV Header Detection**: Intelligently parses CSV files regardless of column order or naming (`ip`, `port`, `protocol`, `country`, `anonymity`, `latency`, `isp`, `uptime`, etc.).
- 🌐 **Full Protocol Support**: Validates `HTTP`, `HTTPS`, `SOCKS4`, and `SOCKS5` proxies natively.
- 🎯 **Custom Target & Timeout**: Test proxies against custom endpoints and set custom timeouts.
- 🚀 **Multi-Threaded Execution**: Concurrent worker pool (`-t` / `--threads`) for scanning thousands of proxies quickly.
- 📊 **Real-Time Streaming Output**: Watch liveness results stream live with HTTP status codes and latency.
- 📝 **Auto Save Results**: Exports working proxies with full metadata to formatted text files (`working_proxies_YYYYMMDD_HHMMSS.txt`).

---

## 🛠️ Step-by-Step Installation Guide

Follow these simple steps to download, install, and run `proxychk` on your system.

### Step 1: Clone the Repository

Open your terminal and clone the repository using `git`:

```bash
git clone https://github.com/Mithun202008/proxychk.git
cd proxychk
```

---

### Step 2: System Installation (Choose Your Operating System)

#### 🐧 Option A: Linux & Kali Linux Setup

Install `proxychk` system-wide to `/usr/local/bin` so you can type `proxychk` from any directory:

```bash
sudo bash install.sh
```

*(Optional: To run without root privileges, run `bash install.sh` to install to `~/.local/bin`)*

#### 🪟 Option B: Windows Setup (PowerShell)

Open **PowerShell** inside the `proxychk` folder and run:

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

*(Note: Restart your PowerShell terminal after installation to refresh your system PATH variable)*

#### 🍎 Option C: macOS Setup

```bash
sudo bash install.sh
```

#### 🐍 Option D: Universal Python / Pip Install (Any OS)

```bash
pip install .
```

---

## 🚀 Usage & Examples

Once installed, `proxychk` can be launched directly from **any directory** in your terminal!

### 1. Basic Scan (Default Target & Timeout)
```bash
proxychk proxies.csv
```

### 2. Test Against a Custom Endpoint
```bash
proxychk proxies.csv https://example.com
```

### 3. Custom Timeout (e.g., 3 Seconds per Proxy)
```bash
proxychk proxies.csv https://example.com 3
```

### 4. High Performance Multi-Threaded Scan ⚡
Scan large proxy lists concurrently (**10 worker threads**, **3s timeout**):
```bash
proxychk proxies.csv http://httpbin.org/ip 3 10
```

### 5. Using Command Flags
```bash
# Set target (-u), timeout (-w), threads (-t), and custom output file (-o)
proxychk -t 20 -w 3 -u https://httpbin.org/ip -o live_proxies.txt proxies.csv
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

- **Linux / Kali / macOS**: `sudo bash uninstall.sh`
- **Windows**: `powershell -ExecutionPolicy Bypass -File uninstall.ps1`

---

## 👤 Author & License

- **Author / Origin**: Mithun A ([@Mithun202008](https://github.com/Mithun202008))
- **Repository**: [https://github.com/Mithun202008/proxychk](https://github.com/Mithun202008/proxychk)
- **License**: Open Source under the [MIT License](LICENSE)

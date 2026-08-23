# proxychk — Proxy Validation & Analysis Engine

```text
┌──────────────────────────────────────────────────────────────────┐
│  PROXYCHK v1.0.0 — Proxy Validation & Analysis Engine            │
│  Author: Mithun A                                                │
└──────────────────────────────────────────────────────────────────┘
```

**proxychk** is a high-performance, zero-dependency, cross-platform CLI tool for validating proxy lists. It features real-time streaming output, intelligent CSV field auto-detection, multi-threaded checking, full HTTP/HTTPS/SOCKS4/SOCKS5 protocol support, and comprehensive metadata detail cards for working proxies.

---

## ✨ Features

- ⚡ **Cross-Platform**: Runs natively on **Linux**, **macOS**, and **Windows** (PowerShell, CMD, Bash).
- 📦 **Zero External Dependencies**: Powered by Python 3 standard library (no third-party dependencies required).
- 🔍 **Auto CSV Header Detection**: Supports any column ordering and fuzzy header matching (`ip`, `port`, `protocol`, `country`, `anonymity`, `latency`, `isp`, `uptime`, etc.).
- 🌐 **All Protocols Supported**: Validates `HTTP`, `HTTPS`, `SOCKS4`, and `SOCKS5` proxies natively.
- 🎯 **Custom Target & Timeout**: Test proxies against custom endpoint URLs and set per-proxy connection timeouts.
- 🚀 **Multi-Threaded Execution**: Concurrent worker pool (`-t` / `--threads`) for scanning thousands of proxies quickly.
- 📊 **Real-Time Streaming Output**: Watch liveness results stream live with HTTP status codes and response latency.
- 📝 **Auto Save Results**: Exports working proxies with full metadata to formatted text files (`working_proxies_YYYYMMDD_HHMMSS.txt`).

---

## 🚀 Installation

### Linux & macOS

Run the installer via bash:

```bash
sudo bash install.sh
```

Or install for user local bin:

```bash
bash install.sh
```

### Windows (PowerShell)

Open PowerShell and execute:

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

### Python / pip (Any System)

```bash
pip install .
```

---

## 💡 Quick Start & Usage

```bash
# Basic scan (uses default target http://httpbin.org/ip and 5s timeout)
proxychk proxies.csv

# Custom target URL
proxychk proxies.csv https://example.com

# Custom target URL + timeout (3 seconds)
proxychk proxies.csv https://example.com 3

# High performance multi-threaded scan (10 threads, 3s timeout)
proxychk proxies.csv http://httpbin.org/ip 3 10

# Using flags
proxychk -t 20 -w 3 -u https://httpbin.org/ip -o live_proxies.txt proxies.csv
```

---

## 🚩 Command Flags

| Flag | Long Flag | Description | Default |
|---|---|---|---|
| `-h` | `--help` | Show usage menu and supported CSV fields | — |
| `-v` | `--version` | Display version and author info | — |
| `-u` | `--target` | Endpoint URL to test proxies against | `http://httpbin.org/ip` |
| `-w` | `--timeout` | Seconds per proxy attempt before timing out | `5` |
| `-t` | `--threads` | Number of concurrent threads | `1` |
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

- **Linux & macOS**: `sudo bash uninstall.sh`
- **Windows**: `powershell -ExecutionPolicy Bypass -File uninstall.ps1`

---

## 👤 Author & License

- **Author**: Mithun A
- **License**: MIT License

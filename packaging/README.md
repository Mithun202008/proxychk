# PROXC Debian & Kali Linux Packaging Guide

This directory and the accompanying `debian/` directory contain the official packaging specifications for building Debian (`.deb`) packages for **PROXC** (`proxychk`).

---

## 📋 Prerequisites

To build and validate the Debian package, install standard Debian/Kali build tools:

```bash
sudo apt update
sudo apt install -y build-essential debhelper dh-python python3-all python3-setuptools lintian
```

---

## 🛠️ Building the Debian Package

To build the package using standard Debian tooling:

```bash
# Clone repository or navigate to source root
cd proxychk

# Build binary and source packages without signing
dpkg-buildpackage -us -uc
```

The resulting package file `proxc_1.0.6-0kali1_all.deb` will be created in the parent directory.

---

## 🔍 Package Inspection & Lintian Validation

Run `lintian` against the generated package to verify policy compliance:

```bash
lintian ../proxc_1.0.6-0kali1_all.deb
```

Ensure no errors (`E:`) or warnings (`W:`) are present before submitting for distribution.

---

## 🧪 Installation & Testing

1. **Install locally built package**:
   ```bash
   sudo apt install ../proxc_1.0.6-0kali1_all.deb
   ```

2. **Verify global command execution**:
   ```bash
   cd /tmp
   proxc --help
   proxc --version
   ```

3. **Verify uninstallation**:
   ```bash
   sudo apt remove proxc
   ```

---

## 🐉 Kali Linux Submission Process

To submit **PROXC** for inclusion into official Kali Linux repositories:

1. Ensure the package builds cleanly with `dpkg-buildpackage` and passes `lintian`.
2. Follow Kali Linux tool submission guidelines at [https://www.kali.org/docs/policy/submission/](https://www.kali.org/docs/policy/submission/).
3. Submit a new package request via Kali Linux GitLab repository tracker / issue tracker.
4. Once reviewed and accepted by Kali maintainers, users will be able to install `proxc` directly using:
   ```bash
   sudo apt update
   sudo apt install proxc
   ```

# Contributing to PROXC

Thank you for your interest in contributing to **PROXC (proxychk)**! We welcome bug reports, feature proposals, documentation improvements, and pull requests from the open-source community.

Please take a moment to review this guide before contributing to ensure a smooth collaboration process.

---

## 🚀 Getting Started

To contribute code or documentation to PROXC:

1. **Fork the repository** on GitHub.
2. **Clone your fork** to your local environment.
3. **Create a dedicated development branch** for your work (e.g., `git checkout -b feature/my-new-feature` or `git checkout -b fix/cli-parsing-bug`).
4. **Prerequisite**: Ensure **Python 3** (Python 3.6 or higher) is installed on your system.

---

## 🛠️ Development Setup

Set up your local development workspace by cloning the repository:

```bash
git clone https://github.com/Mithun202008/proxychk.git
cd proxychk
python3 --version
```

> [!NOTE]
> **Zero-Dependency Philosophy**: PROXC is designed as a lightweight, zero-dependency Python CLI tool that relies exclusively on Python standard library modules (`urllib`, `http`, `socket`, `threading`, `csv`, `json`, `argparse`, `unittest`, etc.).  
> **Please do not introduce external third-party dependencies** (such as `requests`, `aiohttp`, etc.) unless explicitly discussed and approved.

---

## 💻 Running PROXC Locally

You can test PROXC directly using Python or the standalone script launcher during local development:

```bash
# Verify CLI help options
python3 proxc.py --help

# Verify CLI version output
python3 proxc.py --version

# Run executable script directly (Linux/macOS)
./proxc --help
```

On Windows PowerShell:
```powershell
python proxc.py --help
python proxc.py --version
```

---

## 🧪 Running Tests

PROXC uses Python's built-in `unittest` framework. Before making changes or submitting a pull request, run the test suite to ensure all unit tests pass cleanly:

```bash
python3 -m unittest discover -s tests -v
```

On Windows:
```powershell
python -m unittest discover -s tests -v
```

All existing tests must pass before submitting your changes. If you add a new feature or fix a bug, please write corresponding tests inside the `tests/` directory.

---

## 📝 Guidelines for Making Changes

When making contributions to the codebase:

- **Keep Changes Focused**: Submit small, atomic pull requests that address a single bug or feature rather than large, monolithic changes.
- **Python Style & Readability**: Follow clean Python practices (PEP 8 standard formatting guidelines). Keep functions clean and self-contained.
- **Preserve Cross-Platform Compatibility**: PROXC is cross-platform and must run seamlessly on **Linux, Kali Linux, macOS, and Windows**. Avoid OS-specific shell assumptions or non-portable file paths.
- **Maintain CLI Output Consistency**: Ensure terminal output, colorized status badges, tables, and real-time streaming displays match PROXC's established UI aesthetic.
- **Update Documentation**: Update `README.md` or relevant help strings whenever CLI options or tool behaviors are added or modified.
- **Add & Update Unit Tests**: Add unit tests under `tests/` covering bug fixes or new functionality.

---

## 🔢 Versioning Policy

PROXC follows semantic-style versioning (e.g., `1.0.6`).

- **Do NOT bump or modify the version number** in `proxc.py`, `setup.py`, `README.md`, or packaging files for standard code contributions or bug fixes.
- Version bumps are reserved for official project release events managed intentionally by the maintainer.

---

## 📦 Debian / Kali Linux Packaging

Packaging files for Debian and Kali Linux distributions are maintained under the `debian/` directory:

```text
debian/
├── changelog
├── control
├── copyright
├── rules
└── source/
```

If you modify packaging configurations or files in `debian/`:
1. Test package generation using standard Debian packaging tools (e.g., `dpkg-buildpackage`, `debuild`, or `lintian`).
2. Ensure the upstream application logic continues to pass the complete test suite (`python3 -m unittest discover -s tests -v`).

*Note: While PROXC includes Debian/Kali packaging files for compatibility and `.deb` installation, inclusion in official Kali Linux or Debian distribution mirrors is managed by distribution package maintainers.*

---

## 🔀 Submitting Pull Requests (PRs)

When your changes are ready, open a Pull Request against the `main` branch of the official repository.

### PR Requirements

Your pull request description should include:
- **Summary of Changes**: What was changed, added, or removed.
- **Motivation / Context**: Why the change is necessary or beneficial.
- **Testing Details**: How you tested your changes (e.g., Python test runner results, platforms tested like Linux/macOS/Windows).
- **Related Issues**: Reference any open issues resolved by your PR (e.g., `Fixes #12`).

Please keep pull requests focused and easy for maintainers to review.

---

## 🐛 Submitting Bug Reports

If you encounter a bug or unexpected behavior during usage:

1. Check existing [GitHub Issues](https://github.com/Mithun202008/proxychk/issues) to see if the issue has already been reported.
2. Open a new GitHub Issue with the following details:
   - **PROXC Version** (e.g., `1.0.6`)
   - **Operating System** (Linux, macOS, Windows)
   - **Exact Command Executed**
   - **Expected Behavior**
   - **Actual Behavior**
   - **Terminal Output / Stack Trace**

> [!SECURITY]
> For **security vulnerabilities**, do **NOT** open a public GitHub Issue. Follow the private reporting process outlined in [SECURITY.md](SECURITY.md).

---

## 🤝 Code of Conduct

While PROXC does not maintain a standalone Code of Conduct document, all contributors, maintainers, and community members are expected to communicate respectfully, constructively, and professionally in issues, pull requests, and discussions.

#!/usr/bin/env python3
"""
PROXC Automated Release Tool
Usage: python release.py <new_version>
Example: python release.py 1.0.5
"""

import sys
import os
import re
import subprocess

def run_cmd(cmd, cwd=None):
    print(f"--> {cmd}")
    res = subprocess.run(cmd, shell=True, text=True, capture_output=True, cwd=cwd)
    if res.returncode != 0:
        print(f"[!] Error executing: {cmd}")
        print(res.stderr)
        sys.exit(1)
    else:
        if res.stdout.strip():
            print(res.stdout.strip())

def main():
    if len(sys.argv) < 2:
        print("Usage: python release.py <new_version>")
        print("Example: python release.py 1.0.5")
        sys.exit(1)

    new_ver = sys.argv[1].lstrip('vV')
    if not re.match(r'^\d+\.\d+\.\d+$', new_ver):
        print(f"[!] Invalid version format: '{new_ver}'. Must be semver like 1.0.5")
        sys.exit(1)

    tag_ver = f"v{new_ver}"

    # 1. Dynamically locate repository directory
    script_dir = os.path.dirname(os.path.abspath(__file__))
    repo_dir = script_dir

    if not os.path.isfile(os.path.join(repo_dir, "proxc")):
        try:
            res = subprocess.run("git rev-parse --show-toplevel", shell=True, text=True, capture_output=True)
            if res.returncode == 0 and res.stdout.strip():
                repo_dir = res.stdout.strip()
        except Exception:
            pass

    proxc_path = os.path.join(repo_dir, "proxc")
    if not os.path.isfile(proxc_path):
        print(f"\n[!] Error: Cannot find 'proxc' in '{repo_dir}'.")
        print(f"[!] Please navigate into your proxychk project directory before running release.py:")
        print(f"    cd C:\\Users\\HP\\proxychk")
        print(f"    python release.py {new_ver}\n")
        sys.exit(1)

    print("==========================================")
    print(f" Bumping PROXC version to {new_ver} ({tag_ver})")
    print(f" Repository Root: {repo_dir}")
    print("==========================================")

    # 2. Update proxc
    with open(proxc_path, "r", encoding="utf-8") as f:
        content = f.read()

    content = re.sub(r'#  Version : \d+\.\d+\.\d+', f'#  Version : {new_ver}', content)
    content = re.sub(r'VERSION = "[^"]+"', f'VERSION = "{new_ver}"', content)

    with open(proxc_path, "w", encoding="utf-8") as f:
        f.write(content)
    print(f'[+] Updated proxc -> VERSION = "{new_ver}"')

    # 3. Update other files
    other_files = {
        'proxc.cmd': [(r'Version : v\d+\.\d+\.\d+', f'Version : {tag_ver}')],
        'proxc.ps1': [(r'Version : v\d+\.\d+\.\d+', f'Version : {tag_ver}')],
        'setup.py': [(r'version="\d+\.\d+\.\d+"', f'version="{new_ver}"')],
        'README.md': [(r'v\d+\.\d+\.\d+', tag_ver)],
        'installers/install.ps1': [(r'Version : v\d+\.\d+\.\d+', f'Version : {tag_ver}')],
        'installers/install.sh': [(r'Version : v\d+\.\d+\.\d+', f'Version : {tag_ver}')],
        'installers/proxc.cmd': [(r'Version : v\d+\.\d+\.\d+', f'Version : {tag_ver}')],
        'installers/uninstall.ps1': [(r'Version : v\d+\.\d+\.\d+', f'Version : {tag_ver}')],
        'installers/uninstall.sh': [(r'Version : v\d+\.\d+\.\d+', f'Version : {tag_ver}')],
    }

    for rel, replacements in other_files.items():
        filepath = os.path.join(repo_dir, rel)
        if os.path.exists(filepath):
            with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
                fc = f.read()
            for pat, rep in replacements:
                fc = re.sub(pat, rep, fc)
            with open(filepath, "w", encoding="utf-8") as f:
                f.write(fc)
            print(f"[+] Updated {rel}")

    # 4. Git Stage, Commit, Push & Tag
    print("\n[+] Staging changes with git...")
    run_cmd("git add .", cwd=repo_dir)

    print(f"[+] Committing bump to {tag_ver}...")
    run_cmd(f'git commit -m "bump: release {tag_ver}"', cwd=repo_dir)

    print("[+] Pushing main branch to GitHub...")
    run_cmd("git push origin main", cwd=repo_dir)

    print(f"[+] Creating tag {tag_ver}...")
    run_cmd(f"git tag {tag_ver}", cwd=repo_dir)

    print(f"[+] Pushing tag {tag_ver} to GitHub...")
    run_cmd(f"git push origin {tag_ver}", cwd=repo_dir)

    print("\n==========================================")
    print(f" 🎉 Successfully released PROXC {tag_ver}!")
    print("==========================================")

if __name__ == "__main__":
    main()

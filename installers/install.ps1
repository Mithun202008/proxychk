# ================================================================
#  PROXC — Windows Installer (PowerShell)
#  Author  : Mithun A
#  Version : v1.0.0
# ================================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "  PROXC - Windows System Installer" -ForegroundColor Cyan
Write-Host "  =====================================================" -ForegroundColor DarkGray
Write-Host ""

try {
    $pythonVer = & python --version 2>&1
    Write-Host "  OK: Python Runtime -> $pythonVer" -ForegroundColor Green
} catch {
    Write-Host "  ERROR: Python was not detected on PATH. Please install Python 3 and retry." -ForegroundColor Red
    Write-Host ""
    exit 1
}

$installDir = Join-Path $env:LocalAppData "Programs\proxc"
if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}

$scriptDir = $PSScriptRoot
if (-not $scriptDir) {
    $scriptDir = Get-Location
}
$rootDir = (Resolve-Path (Join-Path $scriptDir "..")).Path

$srcProxc = Join-Path $rootDir "proxc"
$srcCmd = Join-Path $scriptDir "proxc.cmd"
$destProxc = Join-Path $installDir "proxc"
$destCmd = Join-Path $installDir "proxc.cmd"

Copy-Item -Path $srcProxc -Destination $destProxc -Force
Copy-Item -Path $srcCmd -Destination $destCmd -Force

Write-Host "  OK: Installed binary -> $installDir" -ForegroundColor Green

$userPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if (-not $userPath) {
    $userPath = ""
}

if ($userPath.IndexOf($installDir) -eq -1) {
    $newPath = $userPath + ";" + $installDir
    [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)
    $env:Path = $env:Path + ";" + $installDir
    Write-Host "  OK: Added to User PATH environment variable." -ForegroundColor Green
} else {
    Write-Host "  OK: PATH already configured." -ForegroundColor Green
}

Write-Host ""
Write-Host "  You can now run proxc from anywhere in a new terminal:" -ForegroundColor Yellow
Write-Host "    proxc examples/proxies.csv" -ForegroundColor Cyan
Write-Host "    proxc examples/proxies.csv https://example.com 3" -ForegroundColor Cyan
Write-Host "    proxc --help" -ForegroundColor Cyan
Write-Host ""
Write-Host "  =====================================================" -ForegroundColor DarkGray
Write-Host ""

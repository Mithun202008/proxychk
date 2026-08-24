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
$srcCmd = Join-Path $rootDir "proxc.cmd"
$srcPs1 = Join-Path $rootDir "proxc.ps1"

$destProxc = Join-Path $installDir "proxc"
$destCmd = Join-Path $installDir "proxc.cmd"
$destPs1 = Join-Path $installDir "proxc.ps1"

Copy-Item -Path $srcProxc -Destination $destProxc -Force
if (Test-Path $srcCmd) { Copy-Item -Path $srcCmd -Destination $destCmd -Force }
if (Test-Path $srcPs1) { Copy-Item -Path $srcPs1 -Destination $destPs1 -Force }

Write-Host "  OK: Installed binary -> $installDir" -ForegroundColor Green

# Update User PATH registry key if missing
$userPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if (-not $userPath) { $userPath = "" }

if ($userPath.IndexOf($installDir) -eq -1) {
    $newPath = $userPath.TrimEnd(';') + ";" + $installDir
    [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)
    Write-Host "  OK: Added to User PATH environment variable." -ForegroundColor Green
} else {
    Write-Host "  OK: User PATH already configured in Windows Registry." -ForegroundColor Green
}

# Always update process env:Path for current PowerShell session
if ($env:Path.IndexOf($installDir) -eq -1) {
    $env:Path = $env:Path.TrimEnd(';') + ";" + $installDir
    Write-Host "  OK: Updated PATH for current PowerShell session." -ForegroundColor Green
}

Write-Host ""
Write-Host "  PROXC is ready! You can run it directly:" -ForegroundColor Yellow
Write-Host "    proxc" -ForegroundColor Cyan
Write-Host "    proxc examples/proxies.csv" -ForegroundColor Cyan
Write-Host "    proxc --help" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Note: If 'proxc' is not recognized in an ALREADY OPEN terminal window," -ForegroundColor DarkGray
Write-Host "  open a NEW terminal window or run:  `$env:Path = [System.Environment]::GetEnvironmentVariable('Path','User') + ';' + `$env:Path" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  =====================================================" -ForegroundColor DarkGray
Write-Host ""

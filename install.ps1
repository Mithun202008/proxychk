# ================================================================
#  proxychk — Windows Installer (PowerShell)
#  Author  : Mithun A
#  Version : v1.0.0
# ================================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "  proxychk - Windows System Installer" -ForegroundColor Cyan
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

$installDir = Join-Path $env:LocalAppData "Programs\proxychk"
if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}

$scriptDir = $PSScriptRoot
if (-not $scriptDir) {
    $scriptDir = Get-Location
}

$srcProxychk = Join-Path $scriptDir "proxychk"
$srcCmd = Join-Path $scriptDir "proxychk.cmd"
$destProxychk = Join-Path $installDir "proxychk"
$destCmd = Join-Path $installDir "proxychk.cmd"

Copy-Item -Path $srcProxychk -Destination $destProxychk -Force
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
Write-Host "  You can now run proxychk from anywhere in a new terminal:" -ForegroundColor Yellow
Write-Host "    proxychk proxies.csv" -ForegroundColor Cyan
Write-Host "    proxychk proxies.csv https://example.com 3" -ForegroundColor Cyan
Write-Host "    proxychk --help" -ForegroundColor Cyan
Write-Host ""
Write-Host "  =====================================================" -ForegroundColor DarkGray
Write-Host ""

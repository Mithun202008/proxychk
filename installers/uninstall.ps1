# ================================================================
#  PROXC — Windows Uninstaller (PowerShell)
#  Author  : Mithun A
#  Version : v1.0.3
# ================================================================

$ErrorActionPreference = "Continue"

Write-Host ""
Write-Host "  PROXC - Windows Uninstaller" -ForegroundColor Cyan
Write-Host "  =====================================================" -ForegroundColor DarkGray
Write-Host ""

$installDir = Join-Path $env:LocalAppData "Programs\proxc"
$legacyInstallDir = Join-Path $env:LocalAppData "Programs\proxychk"

if (Test-Path $installDir) {
    Remove-Item -Path $installDir -Recurse -Force
    Write-Host "  OK: Removed directory -> $installDir" -ForegroundColor Green
} else {
    Write-Host "  INFO: PROXC directory not found at $installDir" -ForegroundColor Yellow
}

if (Test-Path $legacyInstallDir) {
    Remove-Item -Path $legacyInstallDir -Recurse -Force
    Write-Host "  OK: Removed legacy directory -> $legacyInstallDir" -ForegroundColor Green
}

$userPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if ($userPath) {
    $pathParts = $userPath.Split(';') | Where-Object { $_ -ne $installDir -and $_ -ne $legacyInstallDir -and $_ -ne "" }
    $newPath = $pathParts -join ';'
    [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)
    Write-Host "  OK: Updated User PATH environment variable." -ForegroundColor Green
}

Write-Host ""

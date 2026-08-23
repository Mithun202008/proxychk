# ================================================================
#  proxychk — Windows Uninstaller (PowerShell)
#  Author  : Mithun A
#  Version : v1.0.0
# ================================================================

$ErrorActionPreference = "Continue"

Write-Host ""
Write-Host "  proxychk - Windows Uninstaller" -ForegroundColor Cyan
Write-Host "  =====================================================" -ForegroundColor DarkGray
Write-Host ""

$installDir = Join-Path $env:LocalAppData "Programs\proxychk"

if (Test-Path $installDir) {
    Remove-Item -Path $installDir -Recurse -Force
    Write-Host "  OK: Removed directory -> $installDir" -ForegroundColor Green
} else {
    Write-Host "  INFO: proxychk directory not found at $installDir" -ForegroundColor Yellow
}

$userPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if ($userPath -and ($userPath.IndexOf($installDir) -ne -1)) {
    $pathParts = $userPath.Split(';') | Where-Object { $_ -ne $installDir -and $_ -ne "" }
    $newPath = $pathParts -join ';'
    [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)
    Write-Host "  OK: Removed from User PATH environment variable." -ForegroundColor Green
}

Write-Host ""

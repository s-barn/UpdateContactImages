#!/usr/bin/env pwsh
# Pre-commit PowerShell hook
$scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "../scripts/check-secrets.ps1"
if (-Not (Test-Path $scriptPath)) {
    Write-Host "Secret scanner not found at $scriptPath. Skipping pre-commit scan." -ForegroundColor Yellow
    exit 0
}

pwsh -NoProfile -ExecutionPolicy Bypass -File $scriptPath
if ($LASTEXITCODE -ne 0) {
    Write-Host "Pre-commit secret scan failed. Please remove secrets and try again." -ForegroundColor Red
    exit 1
}
exit 0

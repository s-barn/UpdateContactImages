# Simple repo secret scanner
# Scans tracked files for common secret patterns. Not a replacement for dedicated tools.

Param(
    [string]$Path = ".",
    [string[]]$ExtensionsToScan = @('*.ps1','*.psm1','*.psm1','*.psd1','*.psm','*.sh','*.env','*.json','*.yaml','*.yml','*.config','*.xml','*.txt','*.md')
)

Write-Host "Scanning repository for potential secrets..."

$patterns = @(
    'AKIA[0-9A-Z]{16}', # AWS Access Key ID
    'ASIA[0-9A-Z]{16}',
    'AIza[0-9A-Za-z\-_]{35}', # Google API Key
    'ghp_[0-9A-Za-z]{36,}', # GitHub personal access token (old format)
    'xox[baprs]-[0-9a-zA-Z]{10,}', # Slack tokens
    '-----BEGIN RSA PRIVATE KEY-----',
    '-----BEGIN PRIVATE KEY-----',
    'password\s*[:=]\s*\S+',
    'secret\s*[:=]\s*\S+',
    'api[_-]?key\s*[:=]\s*\S+',
    '-----BEGIN OPENSSH PRIVATE KEY-----'
)

Get-ChildItem -Path $Path -Recurse -File | Where-Object {
    foreach ($ext in $ExtensionsToScan) { if ($_.Name -like $ext) { return $true } }
    return $false
} | ForEach-Object {
    $file = $_.FullName
    $content = Get-Content -Raw -LiteralPath $file -ErrorAction SilentlyContinue
    foreach ($p in $patterns) {
        if ($content -match $p) {
            Write-Host "Potential secret found in $file : pattern $p" -ForegroundColor Yellow
        }
    }
}

Write-Host "Scan complete. Use dedicated tools (Gitleaks/TruffleHog) for deeper scans." -ForegroundColor Green

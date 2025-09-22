# Setup git hooks for this repository
# Run this once after cloning to enable the repository's hooks

Write-Host "Configuring repository to use .githooks for hooks..."
git config core.hooksPath .githooks
Write-Host "Done. Your git will now run the repository's hooks." -ForegroundColor Green

# Optionally make the wrapper executable on Unix-like systems
if (Test-Path ".githooks/pre-commit") {
    try {
        icacls .githooks\pre-commit /grant Everyone:RX | Out-Null
    } catch {
        # ignore on non-Windows systems
    }
}

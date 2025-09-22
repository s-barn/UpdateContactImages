# Security Guidelines

This repository contains tools to update contact images. Follow these security recommendations to avoid leaking secrets or sensitive user data.

What not to commit
- Credentials (API keys, tokens, passwords)
- Private key files (.key, .pem, .pfx)
- Exported contact files (.vcf, .mbox, .pst)
- Environment files with secrets (.env)

Pre-commit checks
- Run the included `scripts/check-secrets.ps1` before committing to scan for common secret patterns.

If a secret was committed
1. Consider it compromised immediately.
2. Revoke or rotate the secret (API key, token, password).
3. Remove it from history properly using tools like `git filter-repo` or `git filter-branch` (prefer `git filter-repo`).
4. Notify any affected parties.

CI / automation
- Add secret scanning to CI (e.g., GitHub Actions using TruffleHog, Gitleaks, or built-in secret scanning).
- Use repository secrets (GitHub Actions Secrets) and environment variables rather than committing credentials.

Reporting vulnerabilities
- Open an issue or contact the repository maintainers.

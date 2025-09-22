# Contributing to UpdateContactImages

Thanks for wanting to contribute! This file explains how to set up your local environment, the branch and pull request workflow, and the repository hooks that help prevent accidental secret leaks.

## Setup

1. Clone the repository:

```bash
git clone https://github.com/s-barn/UpdateContactImages.git
cd UpdateContactImages
```

2. Enable the repository git hooks (required once per clone):

Windows (PowerShell):

```powershell
.\scripts\setup-hooks.ps1
```

Unix / macOS:

```bash
git config core.hooksPath .githooks
```

This will enable a pre-commit hook that runs `scripts/check-secrets.ps1` to scan for common secret patterns.

## Branching and Pull Requests

- Work on feature branches off `main`:

```bash
git checkout -b feat/your-feature
```

- Keep commits small and focused. Rebase or squash as appropriate before opening a PR.

- Open a Pull Request against `main`. The repository runs a secret-scan CI action on each push and PR.

## Secrets and Security

- Do NOT commit any credentials, API keys, private keys, `.env` files, or exported contact files (e.g., `.vcf`, `.pst`).

- If the pre-commit hook or CI flags a potential secret:
  1. Remove the secret from your working tree.
  2. Rotate/revoke the secret immediately.
  3. Use `git filter-repo` or the GitHub UI's secret scanning remediation guidance to remove the secret from history.

See `SECURITY.md` for more details.

## Running the scanner manually

You can run the local scanner at any time:

```powershell
.\scripts\check-secrets.ps1
```

This scanner is simple and conservative. For deeper scans, rely on the repository CI (Gitleaks) or run TruffleHog/Gitleaks locally.

## Questions

If you're unsure about anything, open an issue or contact the maintainers.

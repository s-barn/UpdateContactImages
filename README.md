# UpdateContactImages

Local copy of UpdateContactImages project. This repository will store scripts and tools to update contact images.

## Quick start

- Clone the repo
- Add your scripts
- Commit and push to GitHub

## Contributing / Setup

After cloning, enable the repository's git hooks (this repository includes a pre-commit hook that scans for secrets):

Windows (PowerShell):

```powershell
cd C:\LocalTools\UpdateContactImages
.\scripts\setup-hooks.ps1
```

Unix / macOS:

```bash
cd /path/to/UpdateContactImages
git config core.hooksPath .githooks
```

Run the local secret scanner manually at any time:

```powershell
.\scripts\check-secrets.ps1
```

If the scanner detects potential secrets, follow the guidance in `SECURITY.md` to rotate and remove any exposed credentials.

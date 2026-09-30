# vylor-estimate

Estimate how much **[Vylor MCP](https://github.com/Vylor-AI/vylor-mcp-binaries)** would save on your Claude AI sessions - token costs, cache savings, and session breakdowns.

> - **Zero Dependencies**: Standalone binary. No Python, no pip, no runtime required.
> - **Works anywhere**: Windows, macOS, and Linux.
> - **Defaults to last 30 days**: Run it and get results instantly.

---

## Install (One Command)

### macOS / Linux
```bash
curl -fsSL https://raw.githubusercontent.com/Vylor-AI/vylor-estimate-binaries/main/install.sh | sh
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/Vylor-AI/vylor-estimate-binaries/main/install.ps1 | iex
```

Or download the binary for your platform directly from **[Releases](../../releases/latest)**.

---

## Install via pip / pipx (Python 3.10+)

If you have Python installed, you can also install directly from PyPI:

```bash
pip install vylor-estimate

# or in an isolated environment with pipx
pipx install vylor-estimate
```

---

## Usage

```bash
# Analyze last 30 days (default)
vylor-estimate

# Date filtering
vylor-estimate --week              # last 7 days
vylor-estimate --month             # last 30 days
vylor-estimate --all               # all-time
vylor-estimate --since 2025-09-01  # from a specific date

# Explicit path to Claude session files
vylor-estimate /path/to/sessions/
vylor-estimate /path/to/session.jsonl

# Version and help
vylor-estimate --version
vylor-estimate --help
```

---

## How It Works

`vylor-estimate` reads your local Claude session files (.jsonl) and calculates how many tokens and how much money could have been saved if you had been using **Vylor MCP** tools (`find_files`, `request_repo_map`) instead of raw file reads and directory walks.

**Session files are read locally. No data is sent anywhere.**

---

## Platforms

| Platform | Binary |
|---|---|
| Windows (x64) | `vylor-estimate.exe` |
| macOS (x64 / Apple Silicon) | `vylor-estimate-macos` |
| Linux (x64) | `vylor-estimate-linux` |

---

## Manual Install

1. Download the binary for your OS from **[Releases](../../releases/latest)**
2. Make it executable (macOS / Linux):
```bash
chmod +x vylor-estimate-macos
mv vylor-estimate-macos /usr/local/bin/vylor-estimate
```
3. On Windows: move `vylor-estimate.exe` to any folder in your PATH.

---

## Related

- **[Vylor MCP](https://github.com/Vylor-AI/vylor-mcp-binaries)** - the MCP server that generates these savings
- **[vylor.ai](https://vylor.ai)** - learn more
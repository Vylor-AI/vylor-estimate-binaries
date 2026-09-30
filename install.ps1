# install.ps1 - vylor-estimate installer for Windows
# Usage: irm https://raw.githubusercontent.com/Vylor-AI/vylor-estimate-binaries/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

$Repo = "Vylor-AI/vylor-estimate-binaries"
$BinaryName = "vylor-estimate.exe"
$InstallDir = Join-Path $env:LOCALAPPDATA "vylor-estimate"

Write-Host ""
Write-Host "vylor-estimate installer" -ForegroundColor Cyan
Write-Host "========================" -ForegroundColor Cyan
Write-Host ""

# Resolve latest release tag
try {
    $Release = Invoke-RestMethod "https://api.github.com/repos/$Repo/releases/latest"
    $Tag = $Release.tag_name
} catch {
    Write-Host "ERROR: Could not determine latest release. Check your internet connection." -ForegroundColor Red
    exit 1
}

$Url = "https://github.com/$Repo/releases/download/$Tag/$BinaryName"
$Dest = Join-Path $InstallDir $BinaryName

Write-Host "Downloading vylor-estimate $Tag for Windows..."

# Create install directory
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

# Download binary
try {
    Invoke-WebRequest -Uri $Url -OutFile $Dest -UseBasicParsing
} catch {
    Write-Host "ERROR: Download failed from $Url" -ForegroundColor Red
    exit 1
}

# Add to user PATH if not already present
$CurrentPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if ($CurrentPath -notlike "*$InstallDir*") {
    [Environment]::SetEnvironmentVariable(
        "Path",
        "$CurrentPath;$InstallDir",
        [EnvironmentVariableTarget]::User
    )
    Write-Host "Added $InstallDir to your PATH." -ForegroundColor Green
    Write-Host ""
    Write-Host "NOTE: Restart your terminal for the PATH change to take effect." -ForegroundColor Yellow
} else {
    Write-Host "$InstallDir is already in your PATH." -ForegroundColor Green
}

Write-Host ""
Write-Host "Installed vylor-estimate $Tag to:" -ForegroundColor Green
Write-Host "  $Dest" -ForegroundColor White
Write-Host ""
Write-Host "After restarting your terminal, run:" -ForegroundColor Cyan
Write-Host "  vylor-estimate --help" -ForegroundColor White
Write-Host ""

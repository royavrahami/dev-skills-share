# install.ps1 — Install dev-skills-share to Cursor / Codex global skills directory
# Usage: .\install.ps1 [-Target cursor|codex] [-SkillsOnly <name1,name2,...>]

param(
    [ValidateSet("cursor", "codex")]
    [string]$Target = "cursor",
    [string]$SkillsOnly = ""
)

$ErrorActionPreference = "Stop"

# Determine destination
switch ($Target) {
    "cursor" { $destRoot = Join-Path $env:USERPROFILE ".cursor\skills" }
    "codex"  { $destRoot = Join-Path $env:USERPROFILE ".codex\skills" }
}

$srcRoot = Join-Path $PSScriptRoot "skills"

if (-not (Test-Path $srcRoot)) {
    Write-Host "ERROR: skills/ directory not found. Run this script from the repo root." -ForegroundColor Red
    exit 1
}

# Create destination if needed
if (-not (Test-Path $destRoot)) {
    New-Item -ItemType Directory -Path $destRoot -Force | Out-Null
    Write-Host "Created: $destRoot" -ForegroundColor Green
}

# Determine which skills to install
$allSkills = Get-ChildItem $srcRoot -Directory | Select-Object -ExpandProperty Name
if ($SkillsOnly -ne "") {
    $selected = $SkillsOnly -split ","
    $toInstall = $allSkills | Where-Object { $_ -in $selected }
    if ($toInstall.Count -eq 0) {
        Write-Host "ERROR: None of the specified skills found: $SkillsOnly" -ForegroundColor Red
        Write-Host "Available: $($allSkills -join ', ')"
        exit 1
    }
} else {
    $toInstall = $allSkills
}

# Install
$installed = 0
foreach ($skill in $toInstall) {
    $src = Join-Path $srcRoot $skill
    $dst = Join-Path $destRoot $skill
    Copy-Item $src -Destination $dst -Recurse -Force
    $installed++
    Write-Host "  [OK] $skill" -ForegroundColor Green
}

Write-Host ""
Write-Host "Installed $installed skills to: $destRoot" -ForegroundColor Cyan
Write-Host "Restart your IDE to pick up the new skills." -ForegroundColor Yellow

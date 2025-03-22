Param (
    [string]$Eintrag
)

$changelogPath = "CHANGELOG.md"
$datum = "2025-03-22"

if (!(Test-Path $changelogPath)) {
    Write-Host "❌ CHANGELOG.md nicht gefunden."
    exit 1
}

$lines = Get-Content $changelogPath
$newLines = @()
$eintragHinzugefügt = $false
$datumVorhanden = $false

foreach ($line in $lines) {
    $newLines += $line

    if ($line -match "## \[.*\] – $datum") {
        $datumVorhanden = $true
    }

    if ($datumVorhanden -and $line -match "### ✨ Hinzugefügt" -and -not $eintragHinzugefügt) {
        $newLines += "- $Eintrag"
        $eintragHinzugefügt = $true
    }
}

if (-not $datumVorhanden) {
    $newBlock = @(
        "",
        "## [Unversioniert] – $datum",
        "### ✨ Hinzugefügt",
        "- $Eintrag",
        "",
        "### 🛠️ Behoben",
        "",
        "### ✅ Status",
        ""
    )
    $newLines = $lines[0..0] + $newBlock + $lines[1..($lines.Count - 1)]
}

Set-Content $changelogPath -Value $newLines -Encoding UTF8

git add CHANGELOG.md
git commit -m "📝 CHANGELOG aktualisiert: $Eintrag"
git push

Write-Host "
✅ CHANGELOG erfolgreich aktualisiert & gepusht."

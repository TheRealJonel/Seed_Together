Param (
    [string]$TagName,
    [string]$Message = "🔖 Release: $TagName"
)

if (-not $TagName) {
    Write-Host "❌ Kein Tag angegeben. Benutze: taglog 'v1.0.1' 'Deine Nachricht'"
    exit 1
}

# Git-Tag setzen
git tag -a $TagName -m "$Message"

# Tag pushen
git push origin $TagName

Write-Host "
✅ Git-Tag '' wurde erstellt und gepusht mit Nachricht: "

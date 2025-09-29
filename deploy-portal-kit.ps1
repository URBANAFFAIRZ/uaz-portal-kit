# ================================
# 🚀 UAZ Ecosystem Portal Kit - Deployment Script
# ================================

# 1. Go to repo folder
Set-Location "$HOME\Documents\UAZ_Ecosystem_Portal_Kit"

# 2. Make sure we’re on main and up to date
git checkout main
git pull origin main

# 3. Create ZIP with all folders (templates, plugins, themes, etc.)
$newTag = "v1.0.1"
$zipPath = "$HOME\Documents\UAZ_Ecosystem_Portal_Kit_$newTag.zip"
if (Test-Path $zipPath) { Remove-Item $zipPath }

Compress-Archive -Path * -DestinationPath $zipPath -Force
Write-Output "✅ ZIP created: $zipPath"

# 4. Stage, commit, and push all changes
git add .
git commit -m "🚀 Release $newTag - UAZ Ecosystem Portal Kit (with WordPress themes)"
git push origin main

# 5. Tag release
git tag $newTag
git push origin $newTag
Write-Output "✅ Git tag pushed: $newTag"

# 6. Final message
Write-Output ""
Write-Output "🌍 Now go to: https://github.com/URBANAFFAIRZ/uaz-portal-kit/releases"
Write-Output ("➡️ Click 'Draft a new release', select " + $newTag)
Write-Output ("   upload UAZ_Ecosystem_Portal_Kit_" + $newTag + ".zip")
Write-Output "   and paste your release notes."

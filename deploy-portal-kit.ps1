# ================================
# 🚀 UAZ Ecosystem Portal Kit - Deploy Script
# ================================

# 1. Go to repo folder
Set-Location "$HOME\Documents\UAZ_Ecosystem_Portal_Kit"

# 2. Make sure we’re on main and up to date
git checkout main
git pull origin main

# 3. Create ZIP with all folders (templates, plugins, themes, etc.)
$zipPath = "$HOME\Documents\UAZ_Ecosystem_Portal_Kit_v1.0.0.zip"
if (Test-Path $zipPath) { Remove-Item $zipPath }
Compress-Archive -Path * -DestinationPath $zipPath -Force
Write-Output "✅ ZIP created: $zipPath"

# 4. Stage, commit, and push changes
git add .
git commit -m "🚀 Release v1.0.0 - UAZ Ecosystem Portal Kit (with WordPress themes)"
git push origin main

# 5. Tag release
$tag = "v1.0.0"
git tag $tag
git push origin $tag
Write-Output "✅ Git tag pushed: $tag"

# 6. Final message
Write-Output "`n🌍 Now go to: https://github.com/URBANAFFAIRZ/uaz-portal-kit/releases"
Write-Output "➡️ Click 'Draft a new release', select $tag, upload UAZ_Ecosystem_Portal_Kit_v1.0.0.zip, and paste your release notes."

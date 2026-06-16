# Deploy Finndemy dashboard prototype to GitHub Pages
$ErrorActionPreference = "Stop"

$gh = "C:\Program Files\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) {
    $gh = "gh"
}

Write-Host "Checking GitHub login..."
& $gh auth status 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "Not logged in. Run this first:"
    Write-Host "  gh auth login"
    Write-Host ""
    Write-Host "Then run this script again."
    exit 1
}

$repoName = "finndemy-dashboard-prototype"
$owner = (& $gh api user -q .login).Trim()
Write-Host "GitHub user: $owner"

$hasOrigin = (& git remote) -contains "origin"
if (-not $hasOrigin) {
    Write-Host "Creating public repo and pushing..."
    & $gh repo create $repoName --public --source=. --remote=origin --push --description "Finndemy learner dashboard UI prototype"
} else {
    Write-Host "Pushing to origin..."
    git push -u origin main
}

Write-Host "Enabling GitHub Pages..."
& $gh api "repos/$owner/$repoName/pages" -X POST -f "build_type=legacy" -f "source[branch]=main" -f "source[path]=/" 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Pages may already be enabled - checking status..."
    & $gh api "repos/$owner/$repoName/pages"
}

$pagesUrl = "https://$owner.github.io/$repoName/"
Write-Host ""
Write-Host "Done!"
Write-Host "Repo:    https://github.com/$owner/$repoName"
Write-Host "Demo:    $pagesUrl"
Write-Host ""
Write-Host "Pages can take 1-2 minutes to go live on first deploy."

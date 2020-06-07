param(
  [Parameter(Mandatory=$false)]
  [string]$versionParameter
  ,
  [Parameter(Mandatory=$false)]
  [string]$tag
)

Write-Host "`n---"
Write-Host "Get git status"
git status 2>&1 | Write-Host

Write-Host "`n---"
Write-Host "Set git identity"
git config user.name "[Build-process]" 2>&1 | Write-Host
git config user.email "[build@process.id]" 2>&1 | Write-Host

Write-Host "`n---"
Write-Host "Commit"
git commit -a -m "Releasing $versionParameter" 2>&1 | Write-Host
if (-not $?) { exit -1; } # if ($LASTEXITCODE -ne 0) { exit -1; }

Write-Host "`n---"
Write-Host "Push"
git push origin 2>&1 | Write-Host
if (-not $?) { exit -1; } 

Write-Host "`n---"
Write-Host "Add tag"
git tag -a $tag -m "Tag for new release" 2>&1 | Write-Host
if (-not $?) { exit -1; } 

Write-Host "`n---"
Write-Host "Push tag"
git push origin $tag 2>&1 | Write-Host
if (-not $?) { exit -1; } 
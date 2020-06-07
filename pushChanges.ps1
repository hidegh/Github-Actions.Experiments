param(
  [Parameter(Mandatory=$false)]
  [string]$versionParameter
  ,
  [Parameter(Mandatory=$false)]
  [string]$tag
)

#$env:GIT_REDIRECT_STDERR = '2>&1'

Write-Host "`n---"
Write-Host "Get git status"
git status

Write-Host "`n---"
Write-Host "Set git identity"
git config user.name "[Build-process]"
git config user.email "[build@process.id]"

Write-Host "`n---"
Write-Host "Commit"
git commit -a -m "Releasing $versionParameter"
if (-not $?) { exit -1; } # if ($LASTEXITCODE -ne 0) { exit -1; }

Write-Host "`n---"
Write-Host "Push"
git push origin
if (-not $?) { exit -1; } 

Write-Host "`n---"
Write-Host "Add tag"
git tag -a $tag -m "Tag for new release"
if (-not $?) { exit -1; } 

Write-Host "`n---"
Write-Host "Push tag"
git push origin $tag
if (-not $?) { exit -1; } 
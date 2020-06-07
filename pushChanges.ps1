param(
  [Parameter(Mandatory=$true)]
  $versionParameter
  ,
  [Parameter(Mandatory=$true)]
  $tag
)

$env:GIT_REDIRECT_STDERR = '2>&1'

Write-Host "---"
Write-Host "Get git status"
git status

Write-Host "---"
Write-Host "Set git identity"
git config user.name "[Build-process]"
git config user.email "[build@process.id]"

Write-Host "---"
Write-Host "Commit"
git commit -a -m "Releasing $versionParameter"
#if (-not $?) { throw } # if ($LASTEXITCODE -ne 0) { Write-Error $LASTEXITCODE; throw; }

Write-Host "---"
Write-Host "Push"
git push origin master
Write-Host "a"
Write-Host $_
Write-Host "b"
#if ($LASTEXITCODE -ne 0) { Write-Error "cccc"; throw; }

#if (-not $?) { throw }

Write-Host "---"
Write-Host "Add tag"
git tag -a $tag -m "Tag for new release"
#if (-not $?) { throw }

Write-Host "---"
Write-Host "Push tag"
git push origin $tag
#if (-not $?) { throw }

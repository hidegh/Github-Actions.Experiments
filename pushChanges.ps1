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
$result = git status 2>&1

Write-Host "---"
Write-Host "Set git identity"
$result = git config user.name "[Build-process]" 2>&1
$result = git config user.email "[build@process.id]" 2>&1

Write-Host "---"
Write-Host "Commit"
$result = git commit -a -m "Releasing $versionParameter" 2>&1
if (-not $?) { Write-Error $result }
#if (-not $?) { throw } # if ($LASTEXITCODE -ne 0) { Write-Error $LASTEXITCODE; throw; }

Write-Host "---"
Write-Host "Push"
$result = git push origin master 2>&1
Write-Host "a"
Write-Host $_
Write-Host "b"
if (-not $?) { Write-Error $result }
#if ($LASTEXITCODE -ne 0) { Write-Error "cccc"; throw; }

#if (-not $?) { throw }

Write-Host "---"
Write-Host "Add tag"
$result = git tag -a $tag -m "Tag for new release" 2>&1
if (-not $?) { Write-Error $result }
#if (-not $?) { throw }

Write-Host "---"
Write-Host "Push tag"
$result = git push origin $tag 2>&1
if (-not $?) { Write-Error $result }
#if (-not $?) { throw }

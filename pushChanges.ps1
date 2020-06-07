param(
  [Parameter(Mandatory=$false)]
  [string]$versionParameter
  ,
  [Parameter(Mandatory=$false)]
  [string]$tag
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
git commit -a -m "Releasing $versionParameter" 2>&1
if (-not $?) { 
Write-Host "ERROR1"
Write-Host $_
Write-Host "ERROR2"
} else {
Write-Host "OK"
}
#if (-not $?) { throw } # if ($LASTEXITCODE -ne 0) { Write-Error $LASTEXITCODE; throw; }

# Write-Host "---"
# Write-Host "Push"
# $result = git push origin master 2>&1
# Write-Host "a"
# Write-Host $_
# Write-Host "b"
# if (-not $?) { Write-Error $result; throw; }
# #if ($LASTEXITCODE -ne 0) { Write-Error "cccc"; throw; }

# #if (-not $?) { throw }

# Write-Host "---"
# Write-Host "Add tag"
# $result = git tag -a $tag -m "Tag for new release" 2>&1
# if (-not $?) { Write-Error $result; throw; }
# #if (-not $?) { throw }

# Write-Host "---"
# Write-Host "Push tag"
# $result = git push origin $tag 2>&1
# if (-not $?) { Write-Error $result; throw; }
# #if (-not $?) { throw }

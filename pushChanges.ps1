param(
  [Parameter(Mandatory=$true)]
  $versionParameter
  ,
  [Parameter(Mandatory=$true)]
  $tag
)

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
if (-not $?) {
        throw "Error with git push!"
    }

#if ($LASTEXITCODE <> 0) Write-Error "aaa"

Write-Host "---"
Write-Host "Push"
try {
  git push origin master
} catch {
  Write-Error $_
  Write-Error $_ScriptStackTrace
}
#if ($LASTEXITCODE <> 0) Write-Error "bbb"

Write-Host "---"
Write-Host "Add tag"
try {
  git tag -a $tag -m "Tag for new release"
} catch {
  Write-Error $_
  Write-Error $_ScriptStackTrace
}
if (-not $?) {
        throw $?
    }

#if ($LASTEXITCODE <> 0) Write-Error "ccc"

Write-Host "---"
Write-Host "Push tag"
git push origin $tag

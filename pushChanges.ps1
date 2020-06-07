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
try {
  git commit -a -m "Releasing $versionParameter"
} catch {
  Write-Error "0000000"
  Write-Error $_
  Write-Error $_ScriptStackTrace
  throw
}

Write-Host "---"
Write-Host "Push"
try {
  git push origin master
} catch {
  Write-Error "1111111111"
  Write-Error $_
  Write-Error $_ScriptStackTrace
  throw
}

Write-Host "---"
Write-Host "Add tag"
try {
  git tag -a $tag -m "Tag for new release"
} catch {
  Write-Error "2222222222"
  Write-Error $_
  Write-Error $_ScriptStackTrace
  throw
}

Write-Host "---"
Write-Host "Push tag"
git push origin $tag

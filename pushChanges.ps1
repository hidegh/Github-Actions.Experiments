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

Write-Host "---"
Write-Host "Push"
git push origin master

Write-Host "---"
Write-Host "Add tag"
git tag -a $tag -m "Tag for new release"

Write-Host "---"
Write-Host "Push tag"
git push origin $tag

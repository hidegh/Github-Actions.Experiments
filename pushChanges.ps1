param(
  [Parameter(Mandatory=$true)]
  $versionParameter
)

Write-Host "Get git status"
git status

Write-Host "Set git identity"
git config user.name "[Build-process]"
git config user.email "[build@process.id]"

Write-Host "Commit"
git commit -a -m "Releasing $env:BUILDING_VERSION"

Write-Host "Push"
git push origin master

Write-Host "Add tag"
git tag -a "PROD-$env:BUILDING_VERSION" -m "Tag for new release"

Write-Host "Push tag"
git push origin "PROD-$env:BUILDING_VERSION"

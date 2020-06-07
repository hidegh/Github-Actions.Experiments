param(
  [Parameter(Mandatory=$true)]
  [string]$versionParameter
  ,
  [Parameter(Mandatory=$true)]
  [string]$tag
)

#PRO: single file to manage all the stuff
#CON: steps skipped wont' show up on the workflow UI

Write-Host "`n---"
Write-Host "Get git status"
git status 2>&1 | Write-Host
if (-not $?) { Write-Host "ERROR!"; exit -1; } # if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }

Write-Host "`n---"
Write-Host "Set git identity"
git config user.name "[Build-process]" 2>&1 | Write-Host
git config user.email "[build@process.id]" 2>&1 | Write-Host
if (-not $?) { Write-Host "ERROR!"; exit -1; } 

Write-Host "`n---"
Write-Host "Commit"
git commit -a -m "Releasing $versionParameter" 2>&1 | Write-Host
if (-not $?) { Write-Host "ERROR!"; exit -1; } 

Write-Host "`n---"
Write-Host "Push"
git push origin 2>&1 | Write-Host
# The generic check-error code does not worked with push, raised error even on success!
# if (-not $?) { Write-Host "ERROR!"; exit -1; } 
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; }

Write-Host "`n---"
Write-Host "Add tag"
git tag -a $tag -m "Tag for new release" 2>&1 | Write-Host
if (-not $?) { Write-Host "ERROR!"; exit -1; } 

Write-Host "`n---"
Write-Host "Push tag"
git push origin master $tag 2>&1 | Write-Host
if (-not $?) { Write-Host "ERROR!"; exit -1; } 

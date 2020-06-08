param(
  [Parameter(Mandatory=$false)]
  [string]$list = "pack-list.txt"
  ,
  [Parameter(Mandatory=$false)]
  [string]$nugetFolder = "nupkg"
)

Write-Host "Packaging NuGet from projects..."
[System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" } | ForEach-Object {
  $project = $_
  Write-Host "`n`n`nProject: $(${project})"
  dotnet pack $project --configuration Release -o $nugetFolder 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
}

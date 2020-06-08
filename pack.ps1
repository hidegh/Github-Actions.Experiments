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
  $destination = "$($project)/$($nugetFolder)"

  Write-Host "`n`n`n"
  Write-Host "Project    : $(${project})"
  Write-Host "NugetFolder: $(${destination})"

  dotnet pack $source --configuration Release -o $destination 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
}

param(
  [Parameter(Mandatory=$false)]
  [string]$list = "pack-list.txt"
  ,
  [Parameter(Mandatory=$false)]
  [string]$nugetFolder = "nupkg"
  ,
  [Parameter(Mandatory=$false)]
  [string]$nugetSource = "https://api.nuget.org/v3/index.json"
  ,
  [Parameter(Mandatory=$true)]
  [string]$nugetApiKey
)

Write-Host "Publishing NuGet from projects..."

[System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" } | ForEach-Object {
  $project = $_
  $packageSourceFolder = "$($project)/$($nugetFolder)"

  Write-Host "`n`n`n"
  Write-Host "Project       : $(${source})"
  Write-Host "Package folder: $(${packageSourceFolder})"

  dotnet nuget push -k $nuget_api_key -s $nugetSource $packageSourceFolder/*.nupkg --skip-duplicate 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
}

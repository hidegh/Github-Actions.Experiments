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
  Write-Host "Project       : $(${project})"
  Write-Host "Package folder: $(${packageSourceFolder})"

  dotnet nuget push -Source $nugetSource -ApiKey $nuget_api_key $packageSourceFolder/*.nupkg --skip-duplicate 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
}

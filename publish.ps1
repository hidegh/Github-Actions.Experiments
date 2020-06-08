param(
  [Parameter(Mandatory=$false)]
  [string]$list = "pack-list.txt"
  ,
  [Parameter(Mandatory=$false)]
  [string]$nugetFolder = "nupkg"
  ,
  [Parameter(Mandatory=$true)]
  [string]$nugetApiKey
)

Write-Host "Packaging NuGet from projects..."
[System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" } | ForEach-Object {
  $project = $_
  $source = "$($project)/$($nugetFolder)"

  Write-Host "`n`n`n"
  Write-Host "Project: $(${source})"

  find $source -name *.nupkg -type f -print0 | xargs -0 -I pkg dotnet nuget push pkg -k $nuget_api_key -s "https://api.nuget.org/v3/index.json" --skip-duplicate 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
}

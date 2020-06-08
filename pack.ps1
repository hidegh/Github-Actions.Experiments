param(
  [Parameter(Mandatory=$false)]
  [string]$list = "pack-list.txt"
  ,
  [Parameter(Mandatory=$false)]
  [string]$nugetFolder = "nupkg"
)

Write-Host "`nPackaging NuGet from projects..."
[System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" } | ForEach-Object {
  $project = $_
  Write-Host "Project: $(${project})"
  dotnet pack $project --configuration Release -o $nugetFolder 2>&1 | Write-Host
}

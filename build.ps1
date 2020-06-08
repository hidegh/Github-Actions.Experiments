param(
  [Parameter(Mandatory=$false)]
  [string]$list = "build-list.txt"
)

Write-Host "`nBuilding projects..."
[System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" } | ForEach-Object {
  $project = $_
  Write-Host "Project: $(${project})"
  dotnet build $project --configuration Release 2>&1 | Write-Host
}

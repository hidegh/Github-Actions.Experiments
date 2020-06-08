param(
  [Parameter(Mandatory=$true)]
  [string]$list = "test-list.txt"
)

Write-Host "`nRunning test projects..."
[System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" } | ForEach-Object {
  $project = $_
  Write-Host "Project: $(${project})"
  dotnet test $project --configuration Release 2>&1 | Write-Host
}

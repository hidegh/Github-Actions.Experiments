param(
  [Parameter(Mandatory=$false)]
  [string]$list = "test-list.txt"
)

Write-Host "Running test projects..."
[System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" } | ForEach-Object {
  $project = $_

  Write-Host "`n`n`n"
  Write-Host "Project: $(${project})"

  dotnet test $project --configuration Release 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
}

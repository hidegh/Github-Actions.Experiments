param(
  [Parameter(Mandatory=$false)]
  [string]$list = "test-list.txt"
)

Write-Host "Running test projects..."

function Test-All-Exit
{
  Write-Host "Testing all..."
  dotnet test --configuration Release 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
  exit
}

$fileExists = [System.IO.File]::Exists($list)
if (-not $fileExists)
{ 
  Write-Host "File '${list}' does not exists, will execute all test projects."
  Test-All-Exit
}

$lines = [System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" }

if ($lines.Length -eq 0) {
  Write-Host "No project(s) listed in file '${list}', will execute all test projects."
  Test-All-Exit
}

$lines | ForEach-Object {
  $source = $_

  Write-Host "`n`n`n"
  Write-Host "Project: $(${source})"
  Write-Host "---"

  dotnet test $source --configuration Release 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
}

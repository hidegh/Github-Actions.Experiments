param(
  [Parameter(Mandatory=$false)]
  [string]$list = "build-list.txt"
)

Write-Host "Building projects..."

function Build-All-Exit
{
  Write-Host "Building all..."
  dotnet build --configuration Release 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
  exit
}

$fileExists = [System.IO.File]::Exists($list)
if (-not $fileExists)
{ 
  Write-Host "File '${list}' does not exists, will build all projects."
  Build-All-Exit
}

$lines = [System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" }

if ($lines.Length -eq 0) {
  Write-Host "No project(s) listed in file '${list}', will build all projects."
  Build-All-Exit
}

$lines | ForEach-Object {
  $source = $_

  Write-Host "`n`n`n"
  Write-Host "Project: $(${source})"
  Write-Host "---"

  dotnet build $source --configuration Release 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
}

param(
  [Parameter(Mandatory=$false)]
  [string]$list = "build-list.txt"
)

Write-Host "Building projects..."

[System.IO.File]::ReadLines($list) | ? {$_.trim() -ne "" } | ForEach-Object {
  $source = $_

  Write-Host "`n`n`n"
  Write-Host "Project: $(${source})"
  Write-Host "---"

  dotnet build $source --configuration Release 2>&1 | Write-Host
  if ($LASTEXITCODE -ne 0) { Write-Host "ERROR!"; exit -1; }
}

param(
  [Parameter(Mandatory=$true)]
  $versionParameter
)

Write-Host "---"
Write-Host "Version parameter           : $versionParameter"
Write-Host "Version environment variable: $env:BUILDING_VERSION"



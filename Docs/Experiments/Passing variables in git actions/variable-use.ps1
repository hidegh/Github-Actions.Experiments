param(
  [Parameter(Mandatory=$true)]
  [string]$myInput = "my input"
  ,
  [Parameter(Mandatory=$false)]
  [ValidateSet("Y", "N")]
  [string]$mandatory = "N"
)

Write-Host "variable-use::start"
Write-Host "my inut: $($myInput), mandatory: $($mandatory)"
Write-Host "variable-use::end"

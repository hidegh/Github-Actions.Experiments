param(
  [Parameter(Mandatory=$true)]
  [string]$versionParameter
  ,
  [Parameter(Mandatory=$true)]
  [bool]$useBuildVersion
  ,
  [Parameter(Mandatory=$false)]
  [string]$tagPrefix
)

if ($useBuildVersion) {
  Write-Host "Using version number for tagging"
  
} else {
  
  Write-Host "Getting previous tag"
  
  #tod - what ifno tag avail?
  
  if (![string]::IsNullOrWhiteSpace($tagPrefix))
    $newVersionTag = $tagPrefix + $newVersionTag
}

Write-Host "New TAG: $newVersionTag"

echo "::set-env name=VERSION_TAG::$newVersionTag"
Write-Host "Environment variable: VERSION_TAG was set"

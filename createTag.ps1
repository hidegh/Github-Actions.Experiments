param(
  [Parameter(Mandatory=$true)]
  [string]$versionParameter
  ,
  [Parameter(Mandatory=$true)]
  [ValidateSet("Y", "N")]
  [string]$useBuildVersion
  ,
  [Parameter(Mandatory=$false)]
  [string]$tagPrefix
)

Write-Host "---"
Write-Host "Calculating new tag"
Write-Host "Build version    : $versionParameter"
Write-Host "Use build version: $useBuildVersion"
Write-Host "Tag prefix       : $tagPrefix"

if ($useBuildVersion -eq "Y") {
  
  Write-Host "Using version number for tagging"
  $newVersionTag = $versionParameter;
  
} else {
  
  Write-Host "Getting previous tag"
  
  $result = git describe --tags 2>&1 $(git rev-list --tags --max-count=1)
  if (-not $?) { 
    Write-Host "Error: $result"
  } else { 
    Write-Host "Last tag found: $result"; 

  }

}

if (![string]::IsNullOrWhiteSpace($tagPrefix)) {
  $newVersionTag = $tagPrefix + $newVersionTag
}

Write-Host "New TAG: $newVersionTag"

echo "::set-env name=VERSION_TAG::$newVersionTag"
Write-Host "Environment variable: VERSION_TAG was set"

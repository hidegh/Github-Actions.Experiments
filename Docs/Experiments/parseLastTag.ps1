$value = git describe --tags 2>&1 $(git rev-list --tags --max-count=1)

$versionPattern = "^(?<Prefix>.*?)(?<Version>\d+(\.\d+){1,3})(?<Suffix>.*)$"

$match = $value | Select-String -Pattern $versionPattern | Select -First 1 | ForEach-Object {
  return @{
    Version = $_.Matches[0].Groups["Version"].Value;
    Prefix = $_.Matches[0].Groups["Prefix"].Value;
    Suffix = $_.Matches[0].Groups["Suffix"].Value;
  };
}

Write-Host "Last TAG:$($match | Format-Table | Out-String)"

$version = [version]$match.Version
Write-Host $version

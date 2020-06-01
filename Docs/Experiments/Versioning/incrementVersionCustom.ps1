# This will increment  all version numbers inside $file
$file = "VersionInfo.cs"
$versionPattern = "(\d+\.){2,3}\d+"

$version = [version](Get-Content $file | Select-String -Pattern $versionPattern | Select -First 1 | ForEach-Object{ $_.Matches.Value })
$newVersion = "{0}.{1}.{2}.{3}" -f $version.Major, $version.Minor, ($version.Build + 1), $version.Revision

(Get-Content $file) -replace $versionPattern, $newVersion | Set-Content $file

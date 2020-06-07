Write-Host "---"
Write-Host "Incrementing version"

$file = "Directory.Build.props"
$xml = [xml](Get-Content $file)

Write-Host $xml.Project.PropertyGroup.Copyright

$version = [version] $xml.Project.PropertyGroup.Version
Write-Host "From: $version"

$newVersion = "{0}.{1}.{2}.{3}" -f $version.Major, $version.Minor, ($version.Build + 1), $version.Revision
Write-Host "To  : $newVersion"

$xml.Project.PropertyGroup.Version = $newVersion

# Need to ensure UTF8 save
# $xml.Save($file)

#$utf8WithoutBom = New-Object System.Text.UTF8Encoding($false)
#$sw = New-Object System.IO.StreamWriter($file, $false, $utf8WithoutBom)
#$xml.Save($sw)
#$sw.Close()

Write-Host "Changes saved"

echo "::set-env name=BUILDING_VERSION::$newVersion"
Write-Host "Environment variable: BUILDING_VERSION was set"

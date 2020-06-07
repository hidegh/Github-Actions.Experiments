Write-Host "---"
Write-Host "Incrementing version"

$file = "Directory.Build.props"

$xml = new-object System.Xml.XmlDocument
$xml.load($file)

Write-Host $xml.Project.PropertyGroup.Copyright

$version = [version] $xml.Project.PropertyGroup.Version
Write-Host "From: $version"

$newVersion = "{0}.{1}.{2}.{3}" -f $version.Major, $version.Minor, ($version.Build + 1), $version.Revision
Write-Host "To  : $newVersion"

$xml.Project.PropertyGroup.Version = $newVersion
$xml.Save($file)
Write-Host "Changes saved"

echo "::set-env name=BUILDING_VERSION::$newVersion"
Write-Host "Environment variable: BUILDING_VERSION was set"

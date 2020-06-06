$file = "Directory.Build.props"
$xml = [xml](Get-Content $file)

$version = [version] $xml.Project.PropertyGroup.Version

$newVersion = "{0}.{1}.{2}.{3}" -f $version.Major, $version.Minor, ($version.Build + 1), $version.Revision
Write-Host $newVersion

$xml.Project.PropertyGroup.Version = $newVersion

$xml.Save($file)
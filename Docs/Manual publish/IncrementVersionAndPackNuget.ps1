# This will update all project version to the same number and also build packages with the same version number

$path = "VersionInfo.cs"
$assemblyVersionPattern = '\[assembly: AssemblyVersion\("(.*)"\)\]'
$assemblyFileVersionPattern = '\[assembly: AssemblyFileVersion\("(.*)"\)\]'

$newVersion = '';
(Get-Content $path) | ForEach-Object{
    if($_ -match $assemblyVersionPattern){
        # We have found the matching line
        # Edit the version number and put back.
        $fileVersion = [version]$matches[1]
        $newVersion = "{0}.{1}.{2}.{3}" -f $fileVersion.Major, $fileVersion.Minor, ($fileVersion.Build + 1), $fileVersion.Revision
        '[assembly: AssemblyVersion("{0}")]' -f $newVersion
    }
    elseif($_ -match $assemblyFileVersionPattern){
    '[assembly: AssemblyFileVersion("{0}")]' -f $newVersion
    }
    else {
        # Output line as is
        $_
    }
} | Set-Content $path

dotnet pack UPS.Common\UPS.Common.csproj /p:PackageVersion=$newVersion -o ..\BuiltPackages
dotnet pack UPS.Common.Domain\UPS.Common.Domain.csproj /p:PackageVersion=$newVersion -o ..\BuiltPackages
dotnet pack UPS.Common.Http\UPS.Common.Http.csproj /p:PackageVersion=$newVersion -o ..\BuiltPackages
dotnet pack UPS.Common.Services\UPS.Common.Services.csproj /p:PackageVersion=$newVersion -o ..\BuiltPackages
dotnet pack UPS.Common.Web\UPS.Common.Web.csproj /p:PackageVersion=$newVersion -o ..\BuiltPackages
dotnet pack UPS.OData2xlsx\UPS.OData2xlsx.csproj /p:PackageVersion=$newVersion -o ..\BuiltPackages
dotnet pack UPS.Slack\UPS.Slack.csproj /p:PackageVersion=$newVersion -o ..\BuiltPackages
dotnet pack UPS.Teams\UPS.Teams.csproj /p:PackageVersion=$newVersion -o ..\BuiltPackages

#ToDo: Automate VSTS to Push packages manally. But use this to push packages manually. Account usead needs to have publish access which can be given in VSTS
#nuget.exe push -Source https://universalplantservices.pkgs.visualstudio.com/_packaging/Common/nuget/v3/index.json -ApiKey VSTS BuiltPackages\*.nupkg
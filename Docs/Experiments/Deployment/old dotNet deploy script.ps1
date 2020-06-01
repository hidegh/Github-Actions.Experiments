dotnet pack UPS.Slack\UPS.Slack.csproj /p:PackageVersion=$newVersion -o BuiltPackages

#ToDo: Automate VSTS to Push packages manally. But use this to push packages manually. Account usead needs to have publish access which can be given in VSTS
#nuget.exe push -Source https://universalplantservices.pkgs.visualstudio.com/_packaging/Common/nuget/v3/index.json -ApiKey VSTS BuiltPackages\*.nupkg

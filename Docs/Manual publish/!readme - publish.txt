NOTE:
-----
NO NEED FOR MANUAL PUBLISH FROM VS.NET.
ON THE VSTS SITE, WE DO HAVE A PUBLISHING PROFILE SET UP, JUST EXECUTE THAT.

-----

NOTE:
	this is an update for VS2019
	the basic steps were taken from the attached docx

----------
PUBLISHING
----------

Make sure you are in the solution root folder!

Open up PACKAGE MANAGER CONSOLE, execute

Clean all previous DLL:
del .\BuiltPackages\*.nupkg

Update version numbers + pack
.\IncrementVersionAndPackNuget.ps1

Rebuild all (with updated verison numbers)

Execute following line in Package manager console:
nuget.exe push -Source https://universalplantservices.pkgs.visualstudio.com/_packaging/Common/nuget/v3/index.json -ApiKey VSTS .\BuiltPackages\*.nupkg

	NOTE:
	
		Install-Package NuGet.CommandLine might be needed to run before

		Also please use your firstname.lastname@universaplant.com account (microsoft VSTS account) for publishing the packages.

		MAKE SURE YOU PUBLISH ON THE MASTER BRANCH!

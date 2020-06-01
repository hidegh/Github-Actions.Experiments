$out = .\calculate.ps1

Write-Host "---"
Write-Host "This is the file that executes previous scripts and display values from there"

Write-Host "This is the value from the stream:"
Write-Host $out

Write-Host "This is the value from the stream (object destructuring):"
Write-Host "Encoding : $out.encoding"
Write-Host "Mandatory: $out.mandatory)"

Write-Host "This is the environment variable value:"
Write-Host "Env. variable: $env:MY_VALUE"

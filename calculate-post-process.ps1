$out = .\calculate.ps1

Write-Host "im here"
Write-Host $out

write ("encoding : {0}, mandatory: {1}" -f $out.encoding, $out.mandatory)

write ("env. variable: {0}" -f $env:MY_VALUE)

Write-Host "variable-set::start"
$env:MY_OUTPUT_VALUE = -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
Write-Host $env:MY_OUTPUT_VALUE
Write-Host "variable-set::end"

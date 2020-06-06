Write-Host "variable-set::start"
$env:MY_OUTPUT_VALUE = -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})

# this works between powershell scripts
Write-Host $env:MY_OUTPUT_VALUE

# this works cross github actions - https://help.github.com/en/actions/reference/workflow-commands-for-github-actions#setting-an-environment-variable
echo "::set-env name=MY_OUTPUT_VALUE::$env:MY_OUTPUT_VALUE"

Write-Host "variable-set::end"
$file = "package-list.txt"

Write-Host "A"
[System.IO.File]::ReadLines($file) | ? {$_.trim() -ne "" } | ForEach-Object {
 Write-Host $_
}
Write-Host "B"
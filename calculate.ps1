#.\test.ps1 -Encoding ASCII

param(
  # Our preferred encoding
  [Parameter(Mandatory=$false)]
  [ValidateSet("UTF8","Unicode","UTF7","ASCII","UTF32","BigEndianUnicode")]
  [string]$encoding = "UTF8"
  ,
  # Our preferred encoding
  [Parameter(Mandatory=$false)]
  [ValidateSet("Y", "N")]
  [string]$mandatory = "N"
)


# write ("Encoding : {0}" -f $encoding)
# write ("Mandatory : {0}" -f $mandatory)

# Write-Host "my value"

write @{
encoding = $encoding
mandatory = $mandatory
}

# https://help.github.com/en/actions/reference/workflow-commands-for-github-actions#set-an-environment-variable-set-env
# ::set-output name=$MY_VALUE::$encoding
$env:MY_VALUE = $encoding

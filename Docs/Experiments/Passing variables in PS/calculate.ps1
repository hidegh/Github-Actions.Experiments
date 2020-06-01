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

Write-Host "---"
Write-Host "This is the main file, where values are passed as inputs, some value is written to the output stream and some environment variables are set."
Write-Host "Encoding  : $encoding"
Write-Host "Mandatory : $mandatory"

# write the output to the output stream
write @{
encoding = $encoding
mandatory = $mandatory
}

# set env. variable
# https://help.github.com/en/actions/reference/workflow-commands-for-github-actions#set-an-environment-variable-set-env
# ::set-output name=$MY_VALUE::$encoding
$env:MY_VALUE = $encoding

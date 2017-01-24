
$global:i=0

<#
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile($url,$localfile)
#>


$version_list = import-csv .\cdap-versions.txt
$selections = $version_list | Select @{Name="select";Expression={$global:i++;$global:i}},version,url
write-output $selections | Select select,version | format-table

[int]$selected = Read-Host 'Select Version to Download'

$download = $selections | Where-Object {$_.select -eq $selected}

$download | format-table |out-string | % {write-host $_}

$localfile = $("cdap-sdk-"+$download.version+".zip")
wget $download.url -outfile $localfile






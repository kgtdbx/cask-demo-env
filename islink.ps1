if (test-path $cdap_sdk){
   if (Get-Item $cdap_sdk| Where-Object {$_.Attributes -match "ReparsePoint"})
      {write-host "$cdap_sdk is a link" -foregroundcolor "green"} 
   else {write-host "$cdap_sdk is not a link" -foregroundcolor "magenta"}
   }
else {write-host "$cdap_sdk doesn't exist" -foregroundcolor "red"}
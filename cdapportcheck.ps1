####################################################################################################
##
##  BOILER PLATE SCRIPT ELEVATION 
##  https://blogs.msdn.microsoft.com/virtual_pc_guy/2010/09/23/a-self-elevating-powershell-script/
##
####################################################################################################

# Get the ID and security principal of the current user account
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
 
# Get the security principal for the Administrator role
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator
 
# Check to see if we are currently running "as Administrator"
if ($myWindowsPrincipal.IsInRole($adminRole))
   {
   # We are running "as Administrator" - so change the title and background color to indicate this
   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
   $Host.UI.RawUI.BackgroundColor = "DarkBlue"
   clear-host
   }
else
   {
   # We are not running "as Administrator" - so relaunch as administrator
   
   # Create a new process object that starts PowerShell
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   
   # Specify the current script path and name as a parameter
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   
   # Indicate that the process should be elevated
   $newProcess.Verb = "runas";
   
   # Start the new process
   [System.Diagnostics.Process]::Start($newProcess);
   
   # Exit from the current, unelevated, process
   exit
   }
   
############################################################################################
<# 
   Script launches CDAP in Elevated Mode
   Jira to eliminate this requirment: https://issues.cask.co/browse/CDAP-4213
#>

$global:i=0

function IsCDAPRunning {
    $test = @{}
    $cdapUI = Test-NetConnection -computerName localhost -Port 11011 -InformationLevel Detailed
    $cdapRouter = Test-NetConnection -computerName localhost -Port 11015 -InformationLevel Detailed

    if ($cdapRouter.TcpTestSucceeded -eq $false -And $cdapRouter.TcpTestSucceeded -eq $false) {
       $test.success = $false
       $test.message = "CDAP is unreachable - Router:11015 and UI:11011"
       }    
    elseif ($cdapRouter.TcpTestSucceeded -eq $false) {
       $test.success = $false
       $test.message = "CDAP Router unreachable on port:11015"
       }
    elseif ($cdapUI.TcpTestSucceeded -eq $false) {
       $test.success = $false
       $test.message = "CDAP UI unreachable on port:11011"
       }
    else {
       $test.success = $true
       $test.message = "CDAP Router:11015 and UI:11011 appear reachable"  
       }  
       return $test
}










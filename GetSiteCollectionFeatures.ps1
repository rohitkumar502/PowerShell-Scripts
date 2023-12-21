<#Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" #>

 
#Variables
$SiteURL="https://fastekart.sharepoint.com"
 
#Setup Credentials to connect
$Cred= Get-Credential
$Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.Username, $Cred.Password)
 
#Setup the context
$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
$Ctx.Credentials = $Credentials
 
#Get Site Collection Features
$SiteCollFeatures = $Ctx.Site.Features
$Ctx.Load($SiteCollFeatures)
$Ctx.ExecuteQuery()           
 
#Loop through each feature and get feature data
Write-host "Site Collection Features:"
ForEach($Feature in $SiteCollFeatures)
{
    $Feature.Retrieve("DisplayName")
    $Ctx.Load($Feature)
    $Ctx.ExecuteQuery()
    $Feature | Select DisplayName, DefinitionId
}


#Read more: https://www.sharepointdiary.com/2018/03/sharepoint-online-get-all-features-using-powershell.html#ixzz7VbBFTMcO
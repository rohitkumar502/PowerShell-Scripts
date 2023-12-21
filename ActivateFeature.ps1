#Load SharePoint CSOM Assemblies
#Import-Module Microsoft.Online.SharePoint.Powershell
 
#Variables for Processing
$SiteURL = "https://fastekart.sharepoint.com/sites/CocaColaDevSite"
$FeatureGUID =[System.GUID]("f6924d36-2fa8-4f0b-b16d-06b7250180fa") #Publishing Feature ID

#$LoginName ="mdu@fastekart.onmicrosoft.com"
#$LoginPassword ="*******"
 
#Get the Client Context
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
 
#Login Credentials
#$SecurePWD = ConvertTo-SecureString $LoginPassword -asplaintext -force 
#$Credential = new-object -typename System.Management.Automation.PSCredential -argumentlist $LoginName, $SecurePWD
$Credential = Get-Credential 
$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Credential.UserName,$Credential.Password)
 
#Get the Site
$site = $ctx.site
 
#sharepoint online powershell activate feature
$site.Features.Add($FeatureGUID, $force, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::farm)   
 
$ctx.ExecuteQuery() 
write-host "Feature has been Activated!"



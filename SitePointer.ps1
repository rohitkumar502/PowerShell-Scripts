#$SiteURL = "https://fastekart.sharepoint.com/sites/CCEPTeamSite"

$SiteURL = "https://fastekart.sharepoint.com/sites/CocaColaDevSite"
$creds = Get-Credential mdu@fastekart.onmicrosoft.com

$Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($creds.UserName, $creds.Password)
$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
$Ctx.Credentials = $Credentials
#$ListName = "Documents"
#$ListName = "Solution Gallery"
$ListName = "Site Collection Features"
$List = $Ctx.Web.Lists.GetByTitle($ListName)
$Ctx.load($List)
$Ctx.ExecuteQuery()
 
 Write-Host "Total number of solutions = "$List.ItemCount

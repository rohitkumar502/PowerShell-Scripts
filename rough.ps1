
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

$features = Get-SPOFeature -Scope Site  
Write-Host "Total active site collection features count " $features.Count  
foreach($feature in $features){  
    Write-Host "Feature Name : " $feature.DisplayName  
    Write-Host "Feature ID   : " $feature.DefinitionId  
} 
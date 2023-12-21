#Parameters
$TenantAdminURL = "https://fasteakrt-admin.sharepoint.com"
$SiteURL = "https://fastekart.sharepoint.com/sites/CCEPTeamSite"
 
#Connect to Tenant Admin
Connect-PnPOnline -Url $TenantAdminURL -Credentials (Get-Credential)
#Connect-SPOService -Url $TenantAdminURL 
 
#Enable site collection app catalog
Add-PnPSiteCollectionAppCatalog -Site $SiteURL
#Add-SPOSiteCollectionAppCatalog -Site $SiteURL

#Read more: https://www.sharepointdiary.com/2019/08/sharepoint-online-enable-site-collection-app-catalog-using-powershell.html#ixzz7VLWCAupX
##To Enable custom script in SharePoint Online!
$creds = Get-Credential
Connect-SPOService https://fastekart-admin.sharepoint.com/ -Credential $creds
Set-SPOSite https://fastekart.sharepoint.com/sites/CCEPTeamSite -DenyAddAndCustomizePages 0
########################################################

##To Disable Custom Script again, use:
$SiteURL = "https://fastekart.sharepoint.com/sites/CCEPTeamSite"
Set-SPOsite $SiteURL -DenyAddAndCustomizePages $True

#########################################

##How about Enabling custom script for All SharePoint Online Sites in the tenant immediately?

#Parameters
$TenantURL =  "https://fastekart.sharepoint.com"
  
#Get Credentials to connect
$Credential = Get-Credential
  
#Frame Tenant Admin URL from Tenant URL
$TenantAdminURL = $TenantURL.Insert($TenantURL.IndexOf("."),"-admin")
 
#Connect to Admin Center
Connect-PnPOnline -Url $TenantAdminURL -Credentials $Credential
  
#Get All Site collections - Filter BOT and MySite Host
$Sites = Get-PnPTenantSite -Filter "Url -like '$TenantURL' -and Url -notlike 'portals/hub'"
 
#Iterate through all sites
$Sites | ForEach-Object {
    Write-host "Processing Site Collection:"$_.URL
 
    #Enable Custom Script
    If ($_.DenyAddAndCustomizePages -ne "Disabled")
    {
        $_.DenyAddAndCustomizePages = "Disabled"
        $_.Update() | Out-Null
        $_.Context.ExecuteQuery()
        Write-host "`tCustom Script has been Enabled!" -f Green
    }
    Else
    {
        Write-host "`tCustom Script is Already Enabled!" -f Yellow
    }
}



#Read more: https://www.sharepointdiary.com/2017/12/how-to-enable-custom-script-in-sharepoint-online.html#ixzz7VEfimzoN

#Read more: https://www.sharepointdiary.com/2017/12/how-to-enable-custom-script-in-sharepoint-online.html#ixzz7VEdIi7mj

#Get all Site collections
$SiteColl = Get-SPWebApplication "https://sharepoint.fastekart.com" | Get-SPSite -Limit All
#Target Feature to Activate
$FeatureToActivate = Get-SPFeature | Where {$_.DisplayName -eq "FeatureName"}
 
#Iterate through each site collection
ForEach($Site in $SiteColl)
{
   #Check if Feature is already activated
   $FeatureActivated = Get-SPFeature -site $site | Where {$_.displayname -eq $FeatureToActivate.DisplayName}
  
   if($FeatureActivated -ne $null)
   {
      Write-Host "Feature already activated at: "$site.Url
   }
   else
   {
      #Activate the feature
      Enable-SPFeature -Identity $FeatureToActivate -URL $Site.URL -Confirm:$False
      Write-Host "Activated Feature on "$site.Url
   }
}


#Read more: https://www.sharepointdiary.com/2013/08/enable-activate-feature-on-all-sites-in-sharepoint.html#ixzz7VGcLBT4O

## Setting storage qouta of a site 

Connect-SPOService https://fastekart-admin.sharepoint.com/ -Credential Get-Credential

Set-SPOSite -Identity https://fastekart.sharepoint.com/sites/mydevsite -StorageQuota 3072  # This is valid only when we have increase the storage limit.

$sites = Get-SPOSite -Limit All
Foreach($Site in $sites) 
{
    Set-SPOSite -Identity $site.URL -StorageQuota 10240
}

########################################################

## Find Teams Connected SharePoint Sites using PowerShell

#Connect to SharePoint Service
Connect-SPOService -Url "https://fastekart-admin.sharepoint.com"
 
#Get All Microsoft Teams Connected Sites
Get-SPOSite -Limit All | Where {$_.IsTeamsConnected -eq $True}
 
#Get all Teams Channel Connected
Get-SPOSite -Limit All | where {$_.IsTeamsChannelConnected -eq $True}

#############################################################################

## Enable SPO Site Collection App Catalog 

Add-SPOSiteCollectionAppCatalog -Site https://contoso.sharepoint.com/sites/marketing

## Disable the site collection app catalog
Remove-SPOSiteCollectionAppCatalog -Site https://contoso.sharepoint.com/sites/marketing


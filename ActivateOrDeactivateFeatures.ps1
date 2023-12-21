
#Function to Enable Feature in SharePoint Online
Function Enable-SPOFeature
{ 
    param ($SiteCollURL,$UserName,$Password,$FeatureGuid)
    Try 
    {     
        #Setup the context
        $Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteCollURL)
        $Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $Password)
        $Ctx.Credentials = $Credentials
        $Site=$Ctx.Site
 
        #Check the Feature Status
        $FeatureStatus =  $Site.Features.GetById($FeatureGuid)
        

        $FeatureStatus.Retrieve("DefinitionId")
        $Ctx.Load($FeatureStatus)
        $Ctx.ExecuteQuery()
 
        #sharepoint online activate feature using powershell (if its not enabled already)
        if($FeatureStatus.DefinitionId -eq $null)
        {
            Write-Host "Enabling Feature $FeatureGuid..." -ForegroundColor Yellow
            $Site.Features.Add($FeatureGuid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None) | Out-Null
            $Ctx.ExecuteQuery()
            Write-Host "Feature Enabled on site $SiteCollURL!" -ForegroundColor Green
        }
        else
        {
            Write-host "Feature is Already Active on the Site collection!" -ForegroundColor Red
        }
    } 
    Catch
    {
        write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
    }
}
  


#Function to Disable Feature in SharePoint Online
Function Disable-SPOFeature
{ 
    param ($SiteCollURL,$UserName,$Password,$FeatureGuid)
    Try 
    {     
        #Setup the context
        $Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteCollURL)
        $Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $Password)
        $Ctx.Credentials = $Credentials
        $Site=$Ctx.Site
 
        #Check the Feature Status
        $FeatureStatus =  $Site.Features.GetById($FeatureGuid)
        $FeatureStatus.Retrieve("DefinitionId")
        $Ctx.Load($FeatureStatus)
        $Ctx.ExecuteQuery()
 
        #Deactivate the feature if its enabled
        if($FeatureStatus.DefinitionId -ne $null)
        {
            Write-Host "Disabling Feature $FeatureGuid..." -ForegroundColor Yellow
            $Site.Features.Remove($FeatureGuid, $true) | Out-Null
            $Ctx.ExecuteQuery()
            Write-Host "Feature has been disabled on site $SiteCollURL!" -ForegroundColor Green
        }
        else
        {
            Write-host "Feature is already deactived on the Site collection!" -ForegroundColor Red
        }
    } 
    Catch
    {
        write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
    }
}
  
  #Parameters to Activate Feature
$SiteCollURL = "https://fastekart.sharepoint.com/sites/CocaColaDevSite"

$FeatureGuid= [System.Guid] ("f6924d36-2fa8-4f0b-b16d-06b7250180fa") #Publishing Feature

$cred = Get-Credential mdu@fastekart.onmicrosoft.com
 
#sharepoint online enable feature powershell
#Enable-SPOFeature -SiteCollURL $SiteCollURL -UserName $cred.UserName -Password $cred.Password -FeatureGuid $FeatureGuid

 
#Disable Feature
Disable-SPOFeature -SiteCollURL $SiteCollURL -UserName $cred.UserName -Password $cred.Password -FeatureGuid $FeatureGuid

 
#Load SharePoint Online CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
 
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
            Write-host "Feature is Already Actived on the Site collection!" -ForegroundColor Red
        }
    }
    Catch
    {
        write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
    }
}
  
#Parameters to Activate Feature
$SiteCollURL = "https://fastekart.sharepoint.com/sites/CocaColaDevSite"
#$UserName = "mdu@fastekart.onmicrosoft.com"
#$Password = "Rohit@8433"

#$FeatureGuid= [System.Guid] ("f6924d36-2fa8-4f0b-b16d-06b7250180fa") #Publishing Feature

$FeatureGuid= [System.Guid] ("b50e3104-6812-424f-a011-cc90e6327318") #Document ID Service
#$SecurePassword= ConvertTo-SecureString $Password -asplaintext -force 

$Credential = Get-Credential mdu@fastekart.onmicrosoft.com 
 
#sharepoint online enable feature powershell
#Enable-SPOFeature -SiteCollURL $SiteCollURL -UserName $UserName -Password $SecurePassword -FeatureGuid $FeatureGuid

Enable-SPOFeature -SiteCollURL $SiteCollURL -UserName $Credential.UserName -Password $Credential.Password -FeatureGuid $FeatureGuid

#Read more: https://www.sharepointdiary.com/2015/01/sharepoint-online-activate-feature-using-powershell.html#ixzz7VUgdJXBt



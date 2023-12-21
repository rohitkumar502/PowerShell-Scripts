$features = [ordered]@{ "Aggregated Business Calendar" = "d438adcc-d809-49ab-8022-f240d5989f3b"; "Content Type Syndication Hub" = "9a447926-5937-44cb-857a-d3829301c73b" ; "Cross-Site Collection Publishing" = "151d22d9-95a8-4904-a0a3-22e4db85d1e0" ;
                "Custom Site Collection Help" =	"57ff23fc-ec05-4dd8-b7ed-d93faa7c795d";
                 "Disposition Approval Workflow" =	"c85e5759-f323-4efb-b548-443d2216efb5";"Document ID Service" =	"b50e3104-6812-424f-a011-cc90e6327318"; "Document Sets" = "3bae86a2-776d-499d-9db8-fa4cdc7884f8"; "Duet End User Help Collection" =	"7dd73b7c-8763-4f4f-82f5-4927db8c9a90"; "Duet Enterprise Reports Content Types" = "f32a5a06-2e62-4682-9850-f6115223b13c";
                "In Place Records Management" =	"da2e115b-07e4-49d9-bb2c-35e93bb9fca9"; "Library and Folder Based Retention" = "063c26fa-3ccc-4180-8a84-b6f98e991df3"; "Limited-access user permission lockdown mode" =	"7c637b23-06c4-472d-9a9a-7c175762c5c4";
                "Open Documents in Client Applications by Default" = "8a4b8de2-6fd8-41e9-923c-c7c3c00f8295"; "Project Server Approval Content Type" = "ad739f9e-1525-4dec-a25e-10821ca70c95"; "Project Web App Permission for Excel Web App Refresh" = "96c85529-98f5-4a10-8ff5-2a479d34a92a"; 
                "Project Web App Ribbon" = "1d253548-c70d-40fd-9930-9d313bedc359"; "Project Web App Settings" = "697c64b9-3dff-4981-9394-0a62632120ec"; "Publishing Approval Workflow" = "a44d2aa3-affc-4d58-8db4-f4a3af053188";"Reporting" = "	7094bd89-2cfe-490a-8c7e-fbace37b4a34";"Reports and Data Search Support" = "b435069a-e096-46e0-ae30-899daca4b304";
                "Review" = "8dab53d8-e0cf-4595-b192-f71e1823f056"; "Sample Proposal" = "6abbc685-51bd-4999-946b-b2946fb80981"; "Search Engine Sitemap" = "77fc9e13-e99a-4bd3-9438-a3f69670ed97"; "Search Server Web Parts and Templates" = "9c0834e1-ba47-4d49-812b-7d4fb6fea211";
                "SharePoint 2007 Workflows" = "c845ed8d-9ce5-448c-bd3e-ea71350ce45b";"SharePoint Lists and Libraries experience" = "e3540c7d-6bea-403c-a224-1a12eafee4c4"; "SharePoint Server Enterprise Site Collection features" = "8581a8a7-cf16-4770-ac54-260265ddb0b2";"SharePoint Server Publishing Infrastructure" = "f6924d36-2fa8-4f0b-b16d-06b7250180fa";
                "SharePoint Server Standard Site Collection features" = "b21b090c-c796-4b0f-ac0f-7ef1659c20ae"; "Site Policy" = "2fcd5f8a-26b7-4a6a-9755-918566dba90a"; "Three-state workflow" = "fde5d850-671e-4143-950a-87b473922dc7"; "Video and Rich Media (Classic)" = "6e1e5426-2ebd-4871-8027-c5ca86371ead"; "Workflows" = "0af5989a-3aea-4519-8ab0-85d91abe39ff";


}  

<# Write-Host "Total features = " $features.Count

foreach($key in $features.keys)
{
    $message = '{0}    {1} ' -f $key, $features[$key]
    Write-Output $message
} #>

$features
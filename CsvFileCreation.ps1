Write-Host "creating a csv file using add content method"

$cnt = 20
for($i=0; $i -le 4; $i++)
{
    $location="G:\PowerShell\stduentdetails"+$cnt+".csv"
    Add-Content -Path $location   -Value '"Studentname","Rollno","subject1","subject2","subject3","total","avg","rank"'

    $students = @(
        '"vignesh","1","90","90","90","270","90","3"'
        '"nandhini","2","100","100","100","300","100","2"'
        '"vyapini","3","150","150","150","450","150","1"'
        )

    $students | foreach {
    Add-Content -Path  $location -Value $_
     #Write-Host "a row is added to the csv file" -ForegroundColor Green

    }
   
    Write-Host "Csv file is created at the location : $location" -ForegroundColor Green
    
    $cnt++    
}
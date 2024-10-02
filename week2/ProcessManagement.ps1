#Get-Process | Where-Object { $_.ProcessName -match '^C'} | Select-Object ProcessName

#Get-Process | Where-Object {$_.Path -notlike "*system32*"} | Select-Object name, path

#$Servicestop = Get-Service | Where-Object {$_.Status -eq "Stopped"}

#$Sortserv = $Servicestop | Sort-Object -Property DisplayName

#$Sortserv | Export-Csv -path "C:\stopped_services.csv" -Notypeinformation

$Namechrome = Get-Process | Where-Object { $_.Processname -eq 'Chrome'}

if($Namechrome -eq $null){
    
    start-process "C:\Program Files\Google\Chrome\application\chrome.exe" "www.champlain.edu" 

} else {

    Stop-Process -name Chrome
}

(Get-NetIPAddress -Addressfamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).IPAddress

(Get-NetIPAddress -Addressfamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).PrefixLength

Get-WmiObject -list | Where-Object { $_.name -ilike "win32_net*" } | Sort-Object

(Get-CimInstance win32_NetworkAdapterConfiguration -Filter DHCPEnabled=$True | select DHCPServer | Format-Table -HideTableHeaders)


(Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ilike "Ethernet0" }).ServerAddresses

# choose a directory where you have some .ps1 files
cd $PSScriptRoot

#list files based on file name
$files = (Get-ChildItem)
for ($j=0; $j -le $files.length; $j++){
    if($files[$j].name  -ilike "*ps1"){
        Write-Host $files[$j].name
    }
}


# Create folder if it does not exist
$folderpath="$PSScriptRoot\outfolder"
if(Test-Path $folderpath){
    Write-Host "Folder Already Exists"
}
else{
    new-item -itemtype directory -Path $folderpath
}


#List all files in your working directory
cd $PSScriptRoot
$files=(Get-ChildItem)

$folderPath = "$PSScriptRoot/outfolder/"
$filePath = Join-Path -Path $folderPath "out.csv"

$file | Where-Object{$_.extension -eq ".ps1"} | Export-Csv -Path $filePath


$files=(Get-ChildItem -Recurse -File)
$files | rename-item -NewName { $_.name -replace '.csv', '.log' }
Get-ChildItem -Recurse -File
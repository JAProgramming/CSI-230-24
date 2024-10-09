#Get-Content C:\xampp\apache\logs\access.log

#Get-Content C:\xampp\apache\logs\access.log -Tail 5

#Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 ', ' 400 '

#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch

#$A = Get-ChildItem C:\xampp\apache\logs\*.log | Select-String -Pattern 'error'
#$A[-5..-1]

$NotFound = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 '

$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

$ipunorganized = $regex.Matches($NotFound)

$ips = @()

for($i=0; $i -lt $ipunorganized.count; $i++) {
$ips += [pscustomobject]@{ "IP" = $ipunorganized[$i].value;}
}
#$ips | Where-Object { $_.IP -ilike "10.*"}



$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
$counts = $ipsoftens | group IP
$counts | select-object Count, Name
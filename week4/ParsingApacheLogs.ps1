function ApacheLogs1(){
$logsNotformatted = Get-Content C:\xampp\apache\logs\access.log
$tableRecords = @()

for($i=0; $i -lt  $logsNotformatted.count; $i++){
    
    $words = $logsNotformatted[$i].Split(" ");

    $tableRecords +=[pscustomobject]@{ "IP" = $words[0];
                                       "Time" = $words[3].Trim('[');
                                       "Method" = $words[4].Trim('"');
                                       "Page" = $words[5];
                                       "Protocol" = $words[6];
                                       "Response" = $words[7];
                                       "Referer" = $words[10];
                                       "Client" = $words[11..($words.length - 2)]; 
    }

    return $tableRecords | Where-Object { $_.IP -ilike "10.*" }
}
}
$tableRecords = ApacheLogs1
$tableRecords | Format-Table -AutoSize -Wrap


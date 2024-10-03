function newFunction($var){

$Events = Get-EventLog system -source Microsoft-windows-winlogon -After (Get-Date).AddDays($var)

$newarr = @().inst
for($i=0; $i -lt $Events.count; $i++) {

    $Eventtype = ""
    if($Events[$i].InstanceID -eq 7001) {$Eventtype = "Logon"}
    if($Events[$i].InstanceID -eq 7002) {$Eventtype = "Logoff"}

    $user = $Events[$i].ReplacementStrings[1]

    $user= (New-Object System.Security.Principal.SecurityIdentifier $Events[$i].ReplacementStrings[1]).Translate([System.Security.Principal.NTAccount])

    $newarr += [pscustomobject]@{"Time" = $Events[$i].TimeGenerated;
                                  "id" = $Events[$i].InstanceID;
                                   "Event" = $Eventtype
                                   "user" = $user
                                   }

}

return $newarr

}

newFunction(-90)

function startup($var2){
    $Events = Get-EventLog system -After (Get-Date).AddDays($var2) | Where {$_.EventID -eq "6005"}

    $newarr = @()
for($i=0; $i -lt $Events.count; $i++) {


    $user = "System"

    $newarr += [pscustomobject]@{"Time" = $Events[$i].TimeGenerated;
                                  "id" = $Events[$i].EventID;
                                   "Event" = "Startup"
                                   "user" = $user
                                   }

}

return $newarr
}

startup(-90)



function shutdowns($var3){

    $Events = Get-EventLog system -After (Get-Date).AddDays($var3) | Where {$_.EventID -eq "6006"}

    $newarr = @()
for($i=0; $i -lt $Events.count; $i++) {


    $user = "System"

    $newarr += [pscustomobject]@{"Time" = $Events[$i].TimeGenerated;
                                  "id" = $Events[$i].EventID;
                                   "Event" = "ShutDown"
                                   "user" = $user
                                   }

}

return $newarr
}

shutdowns(-90)

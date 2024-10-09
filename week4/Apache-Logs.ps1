function apachelogs( $page, $code, $browser){
    $returns = Get-Content C:\xampp\apache\logs\access.log | Select-String "/$page " | Select-String " $code " | Select-String " $browser/"

    return $returns
} 

$returns = apachelogs "*" "404" "chrome"
$returns
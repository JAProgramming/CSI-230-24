. (join-path $PSScriptRoot Functions and Event Logs.ps1)

clear

$loginouttable = newFunction(-90)
$loginouttable

$systemon = startup(-90)
$systemon

$shutdown = shutdowns(-90)
$shutdown

$newvar = $($loginouttable; $systemon; $shutdown)

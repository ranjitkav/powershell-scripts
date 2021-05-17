## function to print ip
function print-ip($ip) {
  Write-Host "IP is: $ip"
}

function ping-ip($testArray) {
  foreach($s in $testArray) {
     Invoke-Expression -Command "ping.exe $s"
  }
}

## main ##
clear
$file = get-content "C:\t-mobile\updated-ips.txt"
foreach ($line in $file) {
   $testArray = New-Object System.Collections.Generic.List[System.Object]
   $tempArray = "1"
   if ($line.Contains("serverIP")) {
       $ip = $line.split(":",2)[1]
       $testArray.Add($ip)
       print-ip $ip
   }
   ping-ip $testArray
}

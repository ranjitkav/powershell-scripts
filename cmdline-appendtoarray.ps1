function print-array($array) {
  foreach ($item in $array) {
     write-host "Item is: $item"
  }
}

### main ##
$outArray = New-Object System.Collections.Generic.List[System.Object]
write-host "There are total of $($args.count) arguments"
for ( $i = 0; $i -lt $args.count; $i++) {
   #Write-Host "Argument $i is: $($args[$i])"
   $item = $($args[$i])
   $outArray.Add($item)
}
print-array $outArray
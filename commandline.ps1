### main ##
clear
write-host "There are total of $($args.count) arguments"
for ( $i = 0; $i -lt $args.count; $i++) {
   Write-Host "Argument $i is: $($args[$i])"
}
## function to write to outputfile
function write-output($line, $file) {
	# remove spaces
    $line.Trim() >> $file
}

# ping IPs
function ping-ip($testArray, $file) {
  foreach($s in $testArray) {
     Invoke-Expression -Command "ping.exe $s" >> $file
  }
}

# check output file
function check_output_file($outfile) {
	if (Test-Path -Path $outfile -PathType Leaf) {
	   write-host "Removing file $outfile"
       Remove-Item -Path $outfile -Force
    }
    else { # create it
      New-Item -Path $outfile
    }
}

# check and parse input file
function check_input_file($inputfile) {
	$testArray = New-Object System.Collections.Generic.List[System.Object]
	if (Test-Path -Path $inputfile -PathType Leaf) {
	    $file = get-content $inputfile
	    foreach ($line in $file) {
		   if ($line.Contains("serverIP")) {
              write-output $line $outfile
              $ip = $line.split(":",2)[1]
              $testArray.Add($ip)
		   }
        }
	    ping-ip $testArray $outfile
	}
	else {
		write-error "Input file does not exist"
		exit(1)
	}
}

## main ##
clear
$inputfile = $args[1]
$outfile = $args[0]
check_output_file $outfile
check_input_file $inputfile


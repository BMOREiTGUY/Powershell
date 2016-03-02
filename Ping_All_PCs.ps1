Get-ADComputer -searchbase "OU= Place your OU here" -filter * | 
	ForEach-Object{
		[pscustomobject]@{
			ComputerName=$_.Name
			PingResult=(Test-Connection $_.Name -count 1 -quiet)
    		}
	} |
	Export-Csv  C:\Path\PingResults.csv -NoType


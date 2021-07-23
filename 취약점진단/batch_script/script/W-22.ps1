$temp = get-ciminstance -namespace root/securitycenter2 -classname antivirusproduct | out-string -stream | select-string "displayname"
$temp = ($temp -replace "  ","")
$temp = ($temp -replace "displayName: ","")

if($temp -ne "") {
	$temp | out-file -append -encoding default "test.txt"
}

#보안센터
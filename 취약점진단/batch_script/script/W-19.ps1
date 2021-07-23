param($val)

Function ConvertTo-Hex {
	Param(^<int^>$Number)
	'{0:x}' -f $Number
}

$hex = ConvertTo-Hex $val

$end = "$hex".Substring(3)
if ($end -match "00") {
	write-output "Y" | out-file -append -encoding ascii "update.txt"
}
else {
	write-output "N" | out-file -append -encoding ascii "update.txt"
}
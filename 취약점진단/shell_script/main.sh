#!/bin/sh

i=0
cd script
echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>" > ../result.xml
echo "<Unix>" >> ../result.xml
clear
echo "점검 시작할게용:)"
while true
	do
		i=`expr $i + 1`
		./U-$i.sh
		echo "[U-$i] 점검 완료:)"
		if [ $i == 64 ]
			then
				break
		fi
	done
echo "점검 끄읕:)"
echo "</Unix>" >> ../result.xml
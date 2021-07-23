 
echo "<U-58>" >> ../result.xml 
echo "<Name> at 서비스 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "root 외 일반사용자에게도 at 명령어를 사용할 수 있도록 할 경우, 고의 또는" >> ../result.xml
echo "실수로 불법적인 예약 파일 실행으로 시스템 피해를 일으킬 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -al /usr/bin/at" >> ../result.xml
ls -al /usr/bin/at >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/at.deny" >> ../result.xml
cat /etc/at.deny >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/at.allow" >> ../result.xml
cat /etc/at.allow >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : at 명령어 일반사용자 금지 및 at 관련 파일 640 이하인 경우" >> ../result.xml
echo "[취약] : at 명령어 일반사용자 사용가능하거나, at 관련 파일 640 이상인 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"
if [ `stat -c %a /usr/bin/at` -gt 640 ] && [ `stat -c %U /usr/bin/at` != "root" ]
	then
		flag="False"
fi
if [ -e /etc/at.deny ]
	then
	if [ `stat -c %a /etc/at.deny` -gt 640 ]
		then
			flag="False"
	fi
fi
if [ -e /etc/at.allow ]
	then
	if [ `stat -c %a /etc/at.allow` -gt 640 ]
		then
			flag="False"
	fi
fi
if [ -e /etc/at.deny ]
	then
		if [ `cat /etc/at.deny | grep -i "ALL" | grep -v "# ^*" | wc -l` -eq 0 ]
			then
				flag="False"
		fi
	else
		if [ -e /etc/at.allow ]
			then	
				flag="interview"
		fi
fi


if [ $flag == "False" ]
	then
		echo "[취약] : at 명령어 일반사용자 사용가능하거나, at 관련 파일 640 이상인 경우" >> ../result.xml
	else
		if [ $flag == "interview" ]
			then
				echo "[인터뷰>" >> ../result.xml
			else
				echo "[양호] : at 명령어 일반사용자 금지 및 at 관련 파일 640 이하인 경우" >> ../result.xml
		fi
fi
	
echo "</Result>" >> ../result.xml 
echo "</U-58>" >> ../result.xml
echo "" >> ../result.xml

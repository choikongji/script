
echo "<U-3>" >> ../result.xml 
echo "<Name> 계정 잠금 임계값 설정 </Name>"  >> ../result.xml
echo "<Security_Threat>" >> ../result.xml 
echo "패스워드 탈취 공격(무작위 대입 공격, 사전 대입 공격, 추측 공격 등)의 인증" >> ../result.xml
echo "요청에 대해 설정된 패스워드와 일치 할 때까지 지속적으로 응답하여 해당" >> ../result.xml
echo "계정의 패스워드가 유출 될 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml 
echo "#cat /etc/pam.d/system-auth | grep \"pam_tally2.so\" | grep -v \"# ^*\"" >> ../result.xml
cat /etc/pam.d/system-auth | grep "pam_tally2.so" | grep -v "# ^*" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml 
echo "<Comment>" >> ../result.xml 
echo "[양호] : 계정 잠금 임계값이 10회 이하의 값으로 설정되어 있는 경우" >> ../result.xml
echo "[취약] : 계정 잠금 임계값이 설정되어 있지 않거나, 10회 이하의 값으로 설정되지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"

if [ `cat /etc/pam.d/system-auth | grep -i "pam_tally2" | grep -v "# ^*" | grep "deny" | wc -l` -ge 1 ]
	then
		if [ `cat /etc/pam.d/system-auth | grep -i "pam_tally2" | grep -v "# ^*" | awk -F 'deny=' '{print $2}' | awk -F '' '{print $1}'` -gt 10 ]
			then
				flag="False"
		fi
	else
		flag="False"
fi

if [ `cat /etc/pam.d/system-auth | grep -i "pam_tally2" | grep -v "# ^*" | grep "unlock_time" | wc -l` -ge 1 ]
	then
		if [ `cat /etc/pam.d/system-auth | grep -i "pam_tally2" | grep -v "# ^*" | awk -F 'unlock_time=' '{print $2}' | awk -F '' '{print $1}'` -gt 120 ]
			then
				flag="False"
		fi
	else
		flag="False"
fi


if [ `cat /etc/pam.d/system-auth | grep -i "auth" | grep -i "pam_tally2.so" | grep -v "# ^*" | grep "no_magic_root" | wc -l` -eq 0 ]
	then
		flag="False"
fi

if [ `cat /etc/pam.d/system-auth | grep -i "account" | grep -i "pam_tally2.so" | grep -v "# ^*" | grep "no_magic_root" | wc -l` -eq 0 ]
	then
		flag="False"
fi

if [ `cat /etc/pam.d/system-auth | grep -i "account" | grep -i "pam_tally2.so" | grep -v "# ^*" | grep "reset" | wc -l` -eq 0 ]
	then
		flag="False"
fi

if [ $flag == "False" ]
	then
		echo "[취약] : 계정 잠금 임계값이 설정되어 있지 않거나, 10회 이하의 값으로 설정되지 않은 경우" >> ../result.xml
	else
		echo "[양호] : 계정 잠금 임계값이 10회 이하의 값으로 설정되어 있는 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-3>" >> ../result.xml
echo "" >> ../result.xml
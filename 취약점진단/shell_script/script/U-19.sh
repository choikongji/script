 
echo "<U-19>" >> ../result.xml 
echo "<Name> Finger 서비스 비활성화 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "비인가자에게 사용자 정보가 조회되어 패스워드 공격을 통한 시스템 권한" >> ../result.xml
echo "탈취 가능성이 있으므로 사용하지 않는다면 해당 서비스를 중지하여야 함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/inetd.conf | grep -v "# \^\*" | grep -i finger" >> ../result.xml
cat /etc/inetd.conf | grep -v "# ^*" | grep -i "finger" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls /etc/inetd | grep -i finger" >> ../result.xml
ls -l /etc/inetd | grep -i "finger" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/xinetd.conf | grep -v "# \^\*" | grep -i finger" >> ../result.xml
cat /etc/xinetd.conf | grep -v "# ^*" | grep -i "finger" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /etc/xinetd | grep -i finger" >> ../result.xml
ls -l /etc/xinetd | grep -i "finger" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "ls -l /usr/bin/finger" >> ../result.xml
ls -l /usr/bin/finger >> ../result.xml 2>&1
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : Finger 서비스가 비활성화 되어 있는 경우" >> ../result.xml
echo "[취약] : Finger 서비스가 활성화 되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

flag="True"
if [ -e /etc/inetd.conf ]
	then
	if [ `cat /etc/inetd.conf | grep -v "# ^*" | grep -i "finger" | wc -l` -ge 1 ]
		then
			flag="False"
	fi
fi

if [ -e /etc/inetd ]
	then
	if [ `ls -l /etc/inetd | grep -i "finger"| wc -l` -ge 1 ]
		then
			flag="False"
	fi
fi

if [ -e /etc/xinetd.conf ]
	then
	if [ `cat /etc/xinetd.conf | grep -v "# ^*" | grep -i "finger" | wc -l` -ge 1 ]
		then
			flag="False"
	fi
fi

if [ -e /etc/xinetd ]
	then
	if [ `ls -l /etc/xinetd | grep -i "finger" | wc -l` -ge 1 ]
		then
			flag="False"
	fi
fi

if [ -e /usr/bin/finger ]
	then
		flag="False"
fi

if [ $flag == "False" ]
	then	
		echo "[취약] : Finger 서비스가 활성화 되어 있는 경우" >> ../result.xml
	else 
		echo "[양호] : Finger 서비스가 비활성화 되어 있는 경우" >> ../result.xml
fi


echo "</Result>" >> ../result.xml 
echo "</U-19>" >> ../result.xml
echo "" >> ../result.xml
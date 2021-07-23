 
echo "<U-23>" >> ../result.xml 
echo "<Name> DoS 공격에 취약한 서비스 비활성화 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "해당 서비스가 활성화되어 있는 경우 시스템 정보 유출 및 DoS(서비스 거부" >> ../result.xml
echo "공격)의 대상이 될 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/xinetd.d/echo" >> ../result.xml
cat /etc/xinetd.d/echo >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/xinetd.d/discard" >> ../result.xml
cat /etc/xinetd.d/discard >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/xinetd.d/daytime" >> ../result.xml
cat /etc/xinetd.d/daytime >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/xinetd.d/chargen" >> ../result.xml
cat /etc/xinetd.d/chargen >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 사용하지 않는 DoS 공격에 취약한 서비스가 비활성화 된 경우" >> ../result.xml
echo "[취약] : 사용하지 않는 DoS 공격에 취약한 서비스가 활성화 된 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"

if [ -e /etc/xinetd.d/echo ]
	then
		if [ `cat /etc/xinetd.d/echo | grep -i "disable" | grep -i "no" | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /etc/xinetd.d/discard ]
	then
		if [ `cat /etc/xinetd.d/discard | grep -i "disable" | grep -i "no" | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /etc/xinetd.d/daytime ]
	then
		if [ `cat /etc/xinetd.d/daytime | grep -i "disable" | grep -i "no" | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /etc/xinetd.d/chargen ]
	then
		if [ `cat /etc/xinetd.d/chargen | grep -i "disable" | grep -i "no" | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /etc/xinetd.d/echo ]
	then
		if [ `cat /etc/xinetd.d/echo | grep -i "disable" | grep -i "no" | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /etc/inetd.d/discard ]
	then
		if [ `cat /etc/inetd.d/discard | grep -i "disable" | grep -i "no" | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /etc/inetd.d/daytime ]
	then
		if [ `cat /etc/inetd.d/daytime | grep -i "disable" | grep -i "no" | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /etc/inetd.d/chargen ]
	then
		if [ `cat /etc/inetd.d/chargen | grep -i "disable" | grep -i "no" | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ $flag == "False" ]
	then
		echo "[취약] : 사용하지 않는 DoS 공격에 취약한 서비스가 활성화 된 경우" >> ../result.xml
	else
		echo "[양호] : 사용하지 않는 DoS 공격에 취약한 서비스가 비활성화 된 경우" >> ../result.xml
fi
		

echo "</Result>" >> ../result.xml 
echo "</U-23>" >> ../result.xml
echo "" >> ../result.xml
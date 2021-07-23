 
echo "<U-29>" >> ../result.xml 
echo "<Name> tftp, talk 서비스 비활성화 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml
echo "사용하지 않는 서비스나 취약점이 발표된 서비스 운용 시 공격 시도 가능" >> ../result.xml 
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/xinetd.conf | grep -v \"# ^*\" | grep -E \"tffp|talk|ntalk\"" >> ../result.xml
cat /etc/xinetd.conf | grep -v "# ^*" | grep -E "tffp|talk|ntalk" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/inetd.conf | grep -v \"# ^*\" | grep -E \"tffp|talk|ntalk\"" >> ../result.xml
cat /etc/inetd.conf | grep -v "# ^*" | grep -E "tffp|talk|ntalk" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : tftp, talk, ntalk 서비스가 비활성화 되어 있는 경우" >> ../result.xml
echo "[취약] : tftp, talk, ntalk 서비스가 활성화 되어 있는 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
flag="True"
if [ `cat /etc/xinetd.conf | grep -v "# ^*" | grep -E "tffp|talk|ntalk" | wc -l` -ge 1 ]
	then
		flag="False"
fi
if [ `cat /etc/inetd.conf | grep -v "# ^*" | grep -E "tffp|talk|ntalk" | wc -l` -ge 1 ]
	then
		flag="False"
fi
if [ $flag=="False" ]
	then
		echo "[취약] : tftp, talk, ntalk 서비스가 활성화 되어 있는 경우" >> ../result.xml
	else
		echo "[양호] : tftp, talk, ntalk 서비스가 비활성화 되어 있는 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-29>" >> ../result.xml
echo "" >> ../result.xml

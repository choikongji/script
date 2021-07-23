
echo "<U-18>" >> ../result.xml 
echo "<Name> 접속 IP 및 포트 제한 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "허용할 호스트에 대한 IP 및 포트제한이 적용되지 않은 경우, Telnet, FTP같은" >> ../result.xml
echo "보안에 취약한 네트워크 서비스를 통하여 불법적인 접근 및 시스템 침해" >> ../result.xml
echo "사고가 발생할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/hosts.deny" >> ../result.xml
cat /etc/hosts.deny >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/hosts.allow" >> ../result.xml
cat /etc/hosts.allow >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 접속을 허용할 특정 호스트에 대한 IP 주소 및 포트 제한을 설정한 경우">> ../result.xml
echo "[취약] : 접속을 허용할 특정 호스트에 대한 IP 주소 및 포트 제한을 설정하지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
flag="False"
if [ `cat /etc/hosts.deny | grep "ALL:" | wc -l` -ge 1 ] 
	then
	flag="True"
	else
		if [ -e /etc/hosts.allow ] 
			then 
				flag="interview"
		fi
fi
if [ $flag == "True" ]
	then
		echo "[양호] : 접속을 허용할 특정 호스트에 대한 IP 주소 및 포트 제한을 설정한 경우">> ../result.xml
	else
		if [ $flag == "interview" ]
			then
				echo "[인터뷰>" >> ../result.xml
			else
				echo "[취약] : 접속을 허용할 특정 호스트에 대한 IP 주소 및 포트 제한을 설정하지 않은 경우" >> ../result.xml
		fi
fi

echo "</Result>" >> ../result.xml 
echo "</U-18>" >> ../result.xml
echo "" >> ../result.xml
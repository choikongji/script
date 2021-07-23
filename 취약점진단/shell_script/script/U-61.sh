 
echo "<U-61>" >> ../result.xml 
echo "<Name> 로그온 시 경고 메시지 제공 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo " 로그인 배너가 설정되지 않을 경우 배너에 서버 OS 버전 및 서비스 버전이" >> ../result.xml
echo "공격자에게 노출될 수 있으며 공격자는 이러한 정보를 통하여 해당 OS 및" >> ../result.xml
echo "서비스의 취약점을 이용하여 공격을 시도할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/motd" >> ../result.xml
cat /etc/motd >> ../result.xml 2>&1
echo "#cat /etc/issue.net" >> ../result.xml
cat /etc/issue.net >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#/etc/ssh/sshd_config" >> ../result.xml
cat /etc/ssh/sshd_config >> ../result.xml 2>&1
echo "" >> ../result.xml 
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 서버 및 Telnet, FTP, SMTP, DNS 서비스에 로그온 메시지가 설정되어 있는 경우" >> ../result.xml
echo "[취약] : 서버 및 Telnet, FTP, SMTP, DNS 서비스에 로그온 메시지가 설정되어 있지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"
if [ -z `cat /etc/motd` ]
	then
		flag="False"
fi

if [ $flag == "False" ]
	then	
		echo "[취약] : 서버 및 Telnet, FTP, SMTP, DNS 서비스에 로그온 메시지가 설정되어 있지 않은 경우" >> ../result.xml
	else
		echo "[수동점검>" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-61>" >> ../result.xml
echo "" >> ../result.xml

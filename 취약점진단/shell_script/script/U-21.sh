 
echo "<U-21>" >> ../result.xml 
echo "<Name> r 계열 서비스 비활성화 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "rsh, rlogin, rexec 등의 r command를 이용하여 원격에서 인증절차 없이" >> ../result.xml
echo "터미널 접속, 쉘 명령어를 실행이 가능함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -alL /etc/xinetd.d/* | grep -E rsh\|rlogin\|rexec" >> ../result.xml
ls -alL /etc/xinetd.d/* | grep -E "rsh|rlogin|rexec" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -alL /etc/inetd.d/* | grep -E \"rsh|rlogin|rexec\" | grep -v \"grep\"" >> ../result.xml
ls -alL /etc/inetd.d/* | grep -E "rsh|rlogin|rexec" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 불필요한 r 계열 서비스가 비활성화 되어 있는 경우" >> ../result.xml
echo "[취약] : 불필요한 r 계열 서비스가 활성화 되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
flag="True"

if [ `ls -alL /etc/xinetd.d | grep -E "rsh|rlogin|rexec" | grep -v "grep" | wc -l` -ge 1 ]
	then
		flag="False"
fi
if [ `ls -alL /etc/inetd.d | grep -E "rsh|rlogin|rexec" | grep -v "grep" | wc -l` -ge 1 ]
	then
		flag="False"
fi

if [ $flag == "False" ]
	then
		echo "[취약] : 불필요한 r 계열 서비스가 활성화 되어 있는 경우" >> ../result.xml
	else
		echo "[양호] : 불필요한 r 계열 서비스가 비활성화 되어 있는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-21>" >> ../result.xml
echo "" >> ../result.xml
 
echo "<U-53>" >> ../result.xml 
echo "<Name> ssh 원격접속 허용 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml
echo "원격 접속 시 Telnet, FTP 등은 암호화되지 않은 상태로 데이터를 전송하기" >> ../result.xml
echo "때문에 아이디/패스워드 및 중요 정보가 외부로 유출될 위험성이 있음" >> ../result.xml 
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -i \"ssh\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep -i "ssh" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#netstat -al | grep -i -E 'telnet|ftp'" >> ../result.xml
netstat -al | grep -i -E 'telnet|ftp' >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : 원격 접속 시 SSH 프로토콜을 사용하는 경우" >> ../result.xml
echo "[취약] : 원격 접속 시 Telnet, FTP 등 안전하지 않은 프로토콜을 사용하는 경우" >> ../result.xml
echo "※ ssh, telnet이 동시에 설치되어 있는 경우 취약한 것으로 평가됨" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
flag="True" 

if [ `netstat -al | grep -i -E 'telnet|ftp' | wc -l` -ge 1 ]
	then 
		echo "[취약] : 원격 접속 시 Telnet, FTP 등 안전하지 않은 프로토콜을 사용하는 경우" >> ../result.xml
	else
		if [ `ps -ef | grep -i "ssh" | grep -v "grep" | wc -l` -ge 1  ]
			then
				echo "[양호] : 원격 접속 시 SSH 프로토콜을 사용하는 경우" >> ../result.xml
			else 
				echo "[N/A] : SSH 서비스를 사용하지 않는 경우" >> ../result.xml
		fi
fi

echo "</Result>" >> ../result.xml 
echo "</U-53>" >> ../result.xml
echo "" >> ../result.xml

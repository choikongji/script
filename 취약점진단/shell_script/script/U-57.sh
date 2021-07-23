 
echo "<U-57>" >> ../result.xml 
echo "<Name> ftpusers 파일 설정(FTP 서비스 root 계정 접근제한) </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "FTP 서비스는 아이디 및 패스워드가 암호화되지 않은 채로 전송되어 스니핑" >> ../result.xml
echo "에 의해서 관리자 계정의 아이디 및 패스워드가 노출될 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -i \"FTP\" | grep -v \"grep" >> ../result.xml
ps -ef | grep -i "FTP" | grep -v "grep" >> ../result.xml
echo "" >> ../result.xml
echo "#cat /etc/ftpusers" >> ../result.xml
cat /etc/ftpusers >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/ftpd/ftpusers" >> ../result.xml
cat /etc/ftpd/ftpusers >> ../result.xml
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : FTP 서비스가 비활성화 되어 있거나, 활성화 시 root 계정 접속을 차단한 경우" >> ../result.xml
echo "[취약] : FTP 서비스가 활성화 되어 있고, root 계정 접속을 허용한 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep -i "FTP" | grep -v "grep" | wc -l` -ge 1 ]
	then
		if [ `cat /etc/ftpd/ftpusers | grep "root" | grep "# ^*" | wc -l ` -ge 1 ] || [ `cat /etc/ftpusers | grep "root" | grep "# ^*" | wc -l ` -ge 1 ]
			then
				echo "[양호] : FTP 서비스가 비활성화 되어 있거나, 활성화 시 root 계정 접속을 차단한 경우" >> ../result.xml
			else
				echo "[취약] : FTP 서비스가 활성화 되어 있고, root 계정 접속을 허용한 경우" >> ../result.xml
		fi
	else
		echo "[N/A] : FTP 서비스를 사용하지 않는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-57>" >> ../result.xml
echo "" >> ../result.xml

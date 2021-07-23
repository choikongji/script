 
echo "<U-54>" >> ../result.xml 
echo "<Name> ftp 서비스 확인 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml
echo "FTP 서비스는 통신구간이 평문으로 전송되어 계정정보(아이디, 패스워드) 및" >> ../result.xml
echo "전송 데이터의 스니핑이 가능함" >> ../result.xml 
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -E \"ftp|vsftpd|proftp\" grep -v \"grep\"" >> ../result.xml
ps -ef | grep -E "ftp|vsftpd|proftp" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : FTP 서비스가 비활성화 되어 있는 경우" >> ../result.xml
echo "[취약] : FTP 서비스가 활성화 되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep -E "ftp|vsftpd|proftp" | grep -v "grep" | wc -l` -ge 1 ]
	then
		echo "[취약] : FTP 서비스가 활성화 되어 있는 경우" >> ../result.xml
	else
		echo "[양호] : FTP 서비스가 비활성화 되어 있는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-54>" >> ../result.xml
echo "" >> ../result.xml

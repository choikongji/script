 
echo "<U-20>" >> ../result.xml 
echo "<Name> Anonymous FTP 비활성화 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "Anonymous FTP(익명 FTP)를 사용 시 anonymous 계정으로 로그인 후 디렉" >> ../result.xml
echo "터리에 쓰기 권한이 설정되어 있다면 악의적인 사용자가 local exploit을" >> ../result.xml
echo "사용하여 시스템에 대한 공격을 가능하게 함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/passwd | grep ftp " >> ../result.xml
cat /etc/passwd | grep "ftp" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : Anonymous FTP (익명 ftp) 접속을 차단한 경우" >> ../result.xml
echo "[취약] : Anonymous FTP (익명 ftp) 접속을 차단하지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `cat /etc/passwd | grep "ftp" | wc -l` -ge 1 ]
	then
		echo "[취약] : Anonymous FTP (익명 ftp) 접속을 차단하지 않은 경우" >> ../result.xml
	else
		echo "[양호] : Anonymous FTP (익명 ftp) 접속을 차단한 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-20>" >> ../result.xml
echo "" >> ../result.xml
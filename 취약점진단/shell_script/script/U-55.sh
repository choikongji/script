 
echo "<U-55>" >> ../result.xml 
echo "<Name> ftp 계정 shell 제한 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo " 불필요한 기본 계정에 쉘(Shell)을 부여할 경우, 공격자에게 해당 계정이 노" >> ../result.xml
echo "출되어 ftp 기본 계정으로 시스템 접근하여 공격이 가능해짐" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep \"ftp\" |grep -v \"grep\"" >> ../result.xml
ps -ef | grep "ftp" |grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/passwd | grep \"ftp\"" >> ../result.xml
cat /etc/passwd | grep "ftp" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : ftp 계정에 /bin/false 쉘이 부여되어 있는 경우" >> ../result.xml
echo "[취약] : ftp 계정에 /bin/false 쉘이 부여되어 있지 않은 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep "ftp" |grep -v "grep" | wc -l` -ge 1 ]
	then
	if [ `cat /etc/passwd | grep "ftp" | grep -i "/bin/false" | wc -l` -ge 1 ]
		then
			echo "[양호] : ftp 계정에 /bin/false 쉘이 부여되어 있는 경우" >> ../result.xml
		else
			echo "[취약] : ftp 계정에 /bin/false 쉘이 부여되어 있지 않은 경우" >> ../result.xml 
	fi
	else
		echo "[N/A] : FTP 서비스를 사용하지 않은 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-55>" >> ../result.xml
echo "" >> ../result.xml

 
echo "<U-56>" >> ../result.xml 
echo "<Name> ftpusers 파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "ftpusers 파일에 인가되지 않은 사용자를 등록하여 해당 계정을 이용, 불법" >> ../result.xml
echo "적인 FTP 서비스에 접근이 가능함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -i \"ftp\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep -i "ftp" | grep -v "grep" >> ../result.xml
echo "" >> ../result.xml
echo "#ls -al /etc/ftpusers" >> ../result.xml
ls -al /etc/ftpusers >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "# ls -al /etc/ftpd/ftpusers" >> ../result.xml
ls -al /etc/ftpd/ftpusers >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : ftpusers 파일의 소유자가 root이고, 권한이 640 이하인 경우" >> ../result.xml
echo "[취약] : ftpusers 파일의 소유자가 root가 아니거나, 권한이 640 이하가 아닌 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep -i "FTP" | grep -v "grep" | wc -l` -ge 1 ]
	then
		if [ `stat -c %a /etc/ftpusers` -le 640 ] && [ `stat -c %U /etc/ftpusers` == "root" ]
			then
				echo "[양호] : ftpusers 파일의 소유자가 root이고, 권한이 640 이하인 경우" >> ../result.xml
		else
			if [ `stat -c %a /etc/ftpd/ftpusers` -le 640 ] && [ `stat -c %U /etc/ftpd/ftpusers` == "root" ]
				then
					echo "[양호] : ftpusers 파일의 소유자가 root이고, 권한이 640 이하인 경우" >> ../result.xml
				else
					echo "[취약] : ftpusers 파일의 소유자가 root가 아니거나, 권한이 640 이하가 아닌 경우" >> ../result.xml
			fi
		fi
	else
		echo "[N/A] : FTP 서비스를 사용하지 않는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-56>" >> ../result.xml
echo "" >> ../result.xml

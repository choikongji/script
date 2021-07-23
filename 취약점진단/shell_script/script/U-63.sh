 
echo "<U-63>" >> ../result.xml 
echo "<Name> expn, vrfy 명령어 제한 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "VRFY, EXPN 명령어를 통하여 특정 사용자 계정의 존재유무를 알 수 있고," >> ../result.xml
echo "사용자의 정보를 외부로 유출 할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -i \"SMTP\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep -i "SMTP" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/mail/sendmail.cf | grep -v \"# ^*\" | grep -i \"PrivacyOptions\"" >> ../result.xml
cat /etc/mail/sendmail.cf | grep -v "# ^*" | grep -i "PrivacyOptions" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : SMTP 서비스 미사용 또는, noexpn, novrfy 옵션이 설정되어 있는 경우" >> ../result.xml
echo "[취약] : SMTP 서비스를 사용하고, noexpn, novrfy 옵션이 설정되어 있지 않는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"
if [ `ps -ef | grep -i "SMTP" | grep -v "grep" | wc -l` -ge 1 ]
	then
		if [ `cat /etc/mail/sendmail.cf | grep -v "# ^*" | grep -i "PrivacyOptions" | grep -i "noexpn" | wc -l` -eq 0 ] && [ `cat /etc/mail/sendmail.cf | grep -v "# ^*" | grep -i "PrivacyOptions" | grep -i "novrfy" | wc -l` -eq 0 ]
			then
				flag="False"
		else
			if [ `cat /etc/mail/sendmail.cf | grep -v "# ^*" | grep -i "PrivacyOptions" | grep -i "goaway" | wc -l` -eq 0 ]
				then
					flag="False"
			fi
		fi
	else
		flag="NA"
fi

if [ $flag == "False" ]
	then
		echo "[취약] : SMTP 서비스를 사용하고, noexpn, novrfy 옵션이 설정되어 있지 않는 경우" >> ../result.xml
	else
		if [ $flag == "NA" ]
			then
				echo "[N/A] : SMTP 서비스를 사용하지 않는 경우" >> ../result.xml
			else
				echo "[양호] : SMTP 서비스 미사용 또는, noexpn, novrfy 옵션이 설정되어 있는 경우" >> ../result.xml
		fi
fi
echo "</Result>" >> ../result.xml 
echo "</U-63>" >> ../result.xml
echo "" >> ../result.xml

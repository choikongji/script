 
echo "<U-32>" >> ../result.xml 
echo "<Name> 일반사용자의 Sendmail 실행 방지 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml
echo "일반 사용자가 q 옵션을 이용해서 메일큐, Sendmail 설정을 보거나 메일큐" >> ../result.xml
echo "를 강제적으로 drop 시킬 수 있어 악의적으로 SMTP 서버의 오류를 발생시" >> ../result.xml
echo "킬 수 있음" >> ../result.xml 
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep \"sendmail\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep "sendmail" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/mail/sendmail.cf | grep -v \"# ^*\" | grep -i \"PrivacyOptions\" | grep -i \"restrictqrun\"" >> ../result.xml
cat /etc/mail/sendmail.cf | grep -v "# ^*" | grep -i "PrivacyOptions" | grep -i "restrictqrun" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : SMTP 서비스 미사용 또는, 일반 사용자의 Sendmail 실행 방지가 설정된 경우" >> ../result.xml
echo "[취약] : SMTP 서비스 사용 및 일반 사용자의 Sendmail 실행 방지가 설정되어 있지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="False"
if [ `ps -ef | grep "sendmail" | grep -v "grep" | wc -l` -ge 1 ]
	then
		flag="NA"
		if [ `cat /etc/mail/sendmail.cf | grep -v "# ^*" | grep -i "PrivacyOptions" | grep -i "restrictqrun" | wc -l` -ge 1 ]
			then
				flag="True"
		fi
fi

if [ $flag == "NA" ]
	then
	echo "[N/A] : SMTP 서비스를 사용하지 않은 경우" >> ../result.xml
	else 
		if [ $flag == "True" ]
			then
				echo "[양호] : 일반 사용자의 Sendmail 실행 방지가 설정된 경우" >> ../result.xml
			else
				echo "[취약] : SMTP 서비스 사용 및 일반 사용자의 Sendmail 실행 방지가 설정되어 있지 않은 경우" >> ../result.xml
		fi
fi
			
echo "</Result>" >> ../result.xml 
echo "</U-32>" >> ../result.xml
echo "" >> ../result.xml

 
echo "<U-31>" >> ../result.xml 
echo "<Name> 스팸 메일 릴레이 제한 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo " SMTP 서버의 릴레이 기능을 제한하지 않는 경우, 악의적인 사용목적을 가" >> ../result.xml
echo "진 사용자들이 스팸메일 서버로 사용하거나 Dos공격의 대상이 될 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep \"sendmail\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep "sendmail" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/mail/sendmail.cf | grep \"R$\*\" | grep \"Relaying denied\"" >> ../result.xml
cat /etc/mail/sendmail.cf | grep "R$\*" | grep "Relaying denied" >> ../result.xml
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : SMTP 서비스를 사용하지 않거나 릴레이 제한이 설정되어 있는 경우" >> ../result.xml
echo "[취약] : SMTP 서비스를 사용하며 릴레이 제한이 설정되어 있지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep "sendmail" | grep -v "grep" | wc -l` -ge 1 ]
	then
		if [ `cat /etc/mail/sendmail.cf | grep "R$\*" | grep "Relaying denied" | grep -v "# ^*" | wc -l` -ge 1 ]
			then
				echo "[양호] : SMTP 서비스를 사용하지 않거나 릴레이 제한이 설정되어 있는 경우" >> ../result.xml
			else
				echo "[취약] : SMTP 서비스를 사용하며 릴레이 제한이 설정되어 있지 않은 경우" >> ../result.xml
		fi
	else
		echo "[N/A] : SMTP 서비스를 사용하지 않는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-31>" >> ../result.xml
echo "" >> ../result.xml

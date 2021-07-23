 
echo "<U-64>" >> ../result.xml 
echo "<Name> 정책에 따른 시스템 로깅 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "로깅 설정이 되어 있지 않을 경우 원인 규명이 어려우며, 법적 대응을 위한" >> ../result.xml
echo "충분한 증거로 사용할 수 없음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/rsyslog.conf" >> ../result.xml
cat /etc/rsyslog.conf >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : 로그 기록 정책이 정책에 따라 설정되어 수립되어 있으며 보안정책에 따" >> ../result.xml
echo "라 로그를 남기고 있을 경우" >> ../result.xml
echo "[취약] : 로그 기록 정책 미수립 또는, 정책에 따라 설정되어 있지 않거나 보안정" >> ../result.xml
echo "책에 따라 로그를 남기고 있지 않을 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
falg="True"

if [ `cat /etc/rsyslog.conf | grep -i "*.info;mail.none;authpriv.none;cron.none" | grep -i "/var/log/messages" | grep -v "# ^*" | wc -l` -eq 0 ]
	then
		flag="False"
fi
if [ `cat /etc/rsyslog.conf | grep -i "authpriv.*" | grep -i "/var/log/secure" | grep -v "# ^*" | wc -l` -eq 0 ]
	then
		flag="False"
fi
if [ `cat /etc/rsyslog.conf | grep -i "mail.*" | grep -i "/var/log/maillog" | grep -v "# ^*" | wc -l` -eq 0 ]
	then
		flag="False"
fi
if [ `cat /etc/rsyslog.conf | grep -i "cron.*" | grep -i "/var/log/cron" | grep -v "# ^*" | wc -l` -eq 0 ]
	then
		flag="False"
fi
if [ `cat /etc/rsyslog.conf | grep -i "*.alert" | grep -i "/dev/console" | grep -v "# ^*" | wc -l` -eq 0 ]
	then
		flag="False"
fi
if [ `cat /etc/rsyslog.conf | grep -i "*.emerg" | grep -i "*" | grep -v "# ^*" | wc -l` -eq 0 ]
	then
		flag="False"
fi
if [ $falg == "False" ]
	then
		echo "[취약] : 로그 기록 정책 미수립 또는, 정책에 따라 설정되어 있지 않거나 보안정" >> ../result.xml
		echo "책에 따라 로그를 남기고 있지 않을 경우" >> ../result.xml 
	else
		echo "[양호] : 로그 기록 정책이 정책에 따라 설정되어 수립되어 있으며 보안정책에 따" >> ../result.xml
		echo "라 로그를 남기고 있을 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-64>" >> ../result.xml
echo "" >> ../result.xml

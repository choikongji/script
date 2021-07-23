 
echo "<U-11>" >> ../result.xml 
echo "<Name> /etc/syslog.conf 파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "syslog.conf 파일의 설정내용을 참조하여 로그의 저장위치가 노출되며 로그" >> ../result.xml
echo "을 기록하지 않도록 설정하거나 대량의 로그를 기록하게 하여 시스템 과부" >> ../result.xml
echo "하를 유도할 수 있음 " >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /etc/syslog" >> ../result.xml
ls -l /etc/syslog >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /etc/rsyslog" >> ../result.xml
ls -l /etc/rsyslog >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : /etc/syslog.conf 파일의 소유자가 root(또는 bin, sys)이고, 권한이 640 이하인 경우" >> ../result.xml
echo "[취약] : /etc/syslog.conf 파일의 소유자가 root(또는 bin, sys)가 아니거나, 권한이 640 이하가 아닌 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"

if [ -e /etc/syslog.conf ]
	then
		if [ `stat -c %a /etc/syslog.conf` -gt 640 ] && [ `stat -c %U /etc/syslog.conf` != "root" ]
			then
				flag="False"
		fi
	else 
		flag="NA"
fi
if [ -e /etc/rsyslog.conf ]
	then
		if [ `stat -c %a /etc/rsyslog.conf` -gt 640 ] && [ `stat -c %U /etc/rsyslog.conf` != "root" ]
			then
				flag="False"
		fi
	else 
		flag="NA"
fi

if [ $flag=="NA" ] 
	then
		echo "[N/A] : syslog, rsyslog를 사용하지 않는 경우 " >> ../result.xml
		else
			if [ $flag=="True" ]
				then
					echo "[양호] : /etc/syslog.conf 파일의 소유자가 root(또는 bin, sys)이고, 권한이 640 이하인 경우" >> ../result.xml
				else 
					echo "[취약] : /etc/syslog.conf 파일의 소유자가 root(또는 bin, sys)가 아니거나, 권한이 640 이하가 아닌 경우" >> result.xml
			fi
fi		
echo "</Result>" >> ../result.xml 
echo "</U-11>" >> ../result.xml
echo "" >> ../result.xml
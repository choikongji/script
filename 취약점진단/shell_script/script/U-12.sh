 
echo "<U-12>" >> ../result.xml 
echo "<Name> /etc/services 파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "services 파일의 접근권한이 적절하지 않을 경우 비인가 사용자가 운영 포트" >> ../result.xml
echo "번호를 변경하여 정상적인 서비스를 제한하거나, 허용되지 않은 포트를 오픈" >> ../result.xml
echo "하여 악성 서비스를 의도적으로 실행할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /etc/services" >> ../result.xml
ls -l /etc/services >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `stat -c %a /etc/services` -le 644 ]
	then
		if [ `stat -c %U /etc/services` == "root" ] || [ `stat -c %U /etc/services` == "bin" ] || [ `stat -c %U /etc/services` == "sys" ]
			then
				echo "[양호] : etc/services 파일의 소유자가 root(또는 bin, sys)이고, 권한이 644 이하인 경우" >> ../result.xml
			else
				echo "[취약] : etc/services 파일의 소유자가 root(또는 bin, sys)가 아니거나, 권한이 644 이하가 아닌 경우" >> ../result.xml
		fi
	else
		echo "[취약] : etc/services 파일의 소유자가 root(또는 bin, sys)가 아니거나, 권한이 644 이하가 아닌 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-12>" >> ../result.xml
echo "" >> ../result.xml
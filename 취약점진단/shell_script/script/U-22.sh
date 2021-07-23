 
echo "<U-22>" >> ../result.xml 
echo "<Name> crond 파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo " root 외 일반사용자에게도 crontab 명령어를 사용할 수 있도록 할 경우, 고의" >> ../result.xml
echo "또는 실수로 불법적인 예약 파일 실행으로 시스템 피해를 일으킬 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -al /usr/bin/crontab" >> ../result.xml
ls -al /usr/bin/crontab >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : crontab 명령어 일반사용자 금지 및 cron 관련 파일 640 이하인 경우" >> ../result.xml
echo "[취약] : crontab 명령어 일반사용자 사용가능하거나, crond 관련 파일 640 이상인 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `stat -c %a /usr/bin/crontab` -le 640 ] && [ `stat -c %U /usr/bin/crontab` == "root" ]
	then
		echo "[양호] : crontab 명령어 일반사용자 금지 및 cron 관련 파일 640 이하인 경우" >> ../result.xml
	else
		echo "[취약] : crontab 명령어 일반사용자 사용가능하거나, crond 관련 파일 640 이상인 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-22>" >> ../result.xml
echo "" >> ../result.xml
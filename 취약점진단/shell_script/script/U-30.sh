 
echo "<U-30>" >> ../result.xml 
echo "<Name> Sendmail 버전 점검 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo " 취약점이 발견된 Sendmail 버전의 경우 버퍼 오버플로우(Buffer Overflow)" >> ../result.xml
echo "공격에 의한 시스템 권한 획득 및 주요 정보 요출 가능성이 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -i \"sendmail\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep -i "sendmail" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#sendmail -d0.1 \< /dev/null | grep -i \"Version\"" >> ../result.xml
sendmail -d0.1 < /dev/null | grep -i "Version" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : Sendmail 버전이 최신버전인 경우" >> ../result.xml
echo "[취약] : Sendmail 버전이 최신버전이 아닌 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep -i "sendmail" | grep -v "grep" | wc -l` -ge 1 ]
	then
		if [ `sendmail -d0.1 < /dev/null | grep -i "Version" | wc -l` -ge 1 ]
			then
			echo "[수동점검>" >> ../result.xml
		fi
fi
			
echo "</Result>" >> ../result.xml 
echo "</U-30>" >> ../result.xml
echo "" >> ../result.xml

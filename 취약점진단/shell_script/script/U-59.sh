 
echo "<U-59>" >> ../result.xml 
echo "<Name> SNMP 서비스 구동 점검 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "SNMP 서비스로 인하여 시스템의 주요 정보 유출 및 정보의 불법수정이 발생할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -i \"snmp\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep -i "snmp" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : SNMP 서비스를 사용하지 않는 경우" >> ../result.xml
echo "[취약] : SNMP 서비스를 사용하는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep -i "snmp" | grep -v "grep" | wc -l` -ge 1 ]
	then
		echo "[취약] : SNMP 서비스를 사용하는 경우" >> ../result.xml
	else
		echo "[양호] : SNMP 서비스를 사용하지 않는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-59>" >> ../result.xml
echo "" >> ../result.xml

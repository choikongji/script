 
echo "<U-60>" >> ../result.xml 
echo "<Name> SNMP 서비스 Community String의 복잡성 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml
echo "Community String은 Default로 public, private로 설정된 경우가 많으며, 이" >> ../result.xml
echo "를 변경하지 않으면 이 String을 악용하여 환경설정 파일 열람 및 수정을 통" >> ../result.xml
echo "한 공격, 간단한 정보수집에서부터 관리자 권한 획득 및 Dos공격까지 다양" >> ../result.xml
echo "한 형태의 공격이 가능함" >> ../result.xml 
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -i \"snmp\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep -i "snmp" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/snmp/snmpd.conf" >> ../result.xml
cat /etc/snmp/snmpd.conf >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : SNMP Community 이름이 public, private 이 아닌 경우" >> ../result.xml
echo "[취약] : SNMP Community 이름이 public, private 인 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

if [ `ps -ef | grep -i "snmp" | grep -v "grep" | wc -l` -ge 1 ]
	then
		if [ `cat /etc/snmp/snmpd.conf | grep -v "# ^*" | grep -i "notConfigUser" | grep -i "public" | wc -l` -ge 1 ]
			then
				echo "[취약] : SNMP Community 이름이 public, private 인 경우" >> ../result.xml
			else
				echo "[양호] : SNMP Community 이름이 public, private 이 아닌 경우" >> ../result.xml
		fi
	else
		echo "[N/A] : SNMP 서비스를 사용하지 않는 경우" >> ../result.xml
fi
			
echo "</Result>" >> ../result.xml 
echo "</U-60>" >> ../result.xml
echo "" >> ../result.xml

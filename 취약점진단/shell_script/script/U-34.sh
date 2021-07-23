 
echo "<U-34>" >> ../result.xml 
echo "<Name> DNS Zone Transfer 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "비인가자 Zone Transfer를 이용해 Zone 정보를 전송받아 호스트 정보, 시스" >> ../result.xml
echo "템 정보, 네트워크 구성 형태 등의 많은 정보를 파악할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep \"named\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep "named" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/named.conf | grep -i \"allow-transfer\" | grep -v \"# ^*\"" >> ../result.xml
cat /etc/named.conf | grep -i "allow-transfer" | grep -v "# ^*" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/named.boot | grep -i \"xfrnets\" | grep -v \"# ^*\"" >> ../result.xml
cat /etc/named.boot | grep -i "xfrnets" | grep -v "# ^*" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : DNS 서비스 미사용 또는, Zone Transfer를 허가된 사용자에게만 허용한 경우" >> ../result.xml
echo "[취약] : DNS 서비스를 사용하며 Zone Transfer를 모든 사용자에게 허용한 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
if [ `ps -ef | grep "named" | grep -v "grep" | wc -l` -ge 1 ]
	then
		if [ `cat /etc/named.conf | grep -i "allow-transfer" | grep -v "# ^*" | wc -l` -ge 1 ] && [ `cat /etc/named.boot | grep -i "xfrnets" | grep -v "# ^*" | wc -l` -ge 1 ]
			then
				echo "[양호] : DNS 서비스 미사용 또는, Zone Transfer를 허가된 사용자에게만 허용한 경우" >> ../result.xml
			else
				echo "[취약] : DNS 서비스를 사용하며 Zone Transfer를 모든 사용자에게 허용한 경우" >> ../result.xml
		fi
	else
		echo "[N/A] : DNS 서비스를 사용하지 않은 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-34>" >> ../result.xml
echo "" >> ../result.xml

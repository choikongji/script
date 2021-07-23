 
echo "<U-33>" >> ../result.xml 
echo "<Name> DNS 보안 버전 패치 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "최신버전(2016.01 기준 9.10.3-P2) 이하의 버전에서는 서비스거부 공격, 버퍼" >> ../result.xml
echo "오버플로우(Buffer Overflow) 및 DNS 서버 원격 침입 등의 취약성이 존재함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep "named" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep "named" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#named -v" >> ../result.xml
named -v >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : DNS 서비스를 사용하지 않거나 주기적으로 패치를 관리하고 있는 경우" >> ../result.xml
echo "[취약] : DNS 서비스를 사용하며 주기적으로 패치를 관리하고 있지 않는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep "named" | grep -v "grep" | wc -l` -ge 1 ]
	then
		echo "[수동점검>" >> ../result.xml
	else
		echo "[N/A] : DNS 서비스를 사용하지 않은 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-33>" >> ../result.xml
echo "" >> ../result.xml

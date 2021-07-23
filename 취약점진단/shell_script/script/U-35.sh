 
echo "<U-35>" >> ../result.xml 
echo "<Name> 최신 보안패치 및 벤더 권고사항 적용 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "최신 보안패치가 적용되지 않을 경우, 이미 알려진 취약점을 통하여 공격자" >> ../result.xml
echo "에 의해 시스템 침해사고 발생 가능성이 존재함" >> ../result.xml
echo "개되어서는 안되는 파일 등이 노출 가능함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/centos-release" >> ../result.xml
cat /etc/centos-release >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 패치 적용 정책을 수립하여 주기적으로 패치관리를 하고 있으며, 패치" >> ../result.xml
echo "관련 내용을 확인하고 적용했을 경우" >> ../result.xml
echo "[취약] : 패치 적용 정책을 수립하지 않고 주기적으로 패치관리를 하지 않거나 패" >> ../result.xml
echo "치 관련 내용을 확인하지 않고 적용하지 않았을 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `cat /etc/centos-release | wc -l` -ge 1 ]
	then
		echo "[수동점검>" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-35>" >> ../result.xml
echo "" >> ../result.xml

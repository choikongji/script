 
echo "<U-28>" >> ../result.xml 
echo "<Name> NIS, NIS+ 점검 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "보안상 취약한 서비스인 NIS를 사용하는 경우 비인가자가 타시스템의 root" >> ../result.xml
echo "권한 획득이 가능하므로 사용하지 않는 것이 가장 바람직하나 만약 NIS를" >> ../result.xml
echo "사용해야 하는 경우 사용자 정보보안에 많은 문제점을 내포하고 있는 NIS보" >> ../result.xml
echo "다 NIS+를 사용하는 것을 권장함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -E \"ypesrv|ypbind|ypxfrd|rpc.yppasswdd|rpc.ypupdated\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep -E "ypesrv|ypbind|ypxfrd|rpc.yppasswdd|rpc.ypupdated" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : NIS 서비스가 비활성화 되어 있거나, 필요 시 NIS+를 사용하는 경우" >> ../result.xml
echo "[취약] : NIS 서비스가 활성화 되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep -E "ypesrv|ypbind|ypxfrd|rpc.yppasswdd|rpc.ypupdated" | grep -v "grep" | wc -l` -ge 1 ]
	then
		echo "[취약] : NIS 서비스가 활성화 되어 있는 경우" >> ../result.xml
	else
		echo "[양호] : NIS 서비스가 비활성화 되어 있거나, 필요 시 NIS+를 사용하는 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-28>" >> ../result.xml
echo "" >> ../result.xml

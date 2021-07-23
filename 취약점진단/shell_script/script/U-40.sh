 
echo "<U-40>" >> ../result.xml 
echo "<Name> 패스워드 최대 사용기간 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "패스워드 최대 사용기간을 설정하지 않은 경우 비인가자의 각종 공격(무작" >> ../result.xml
echo "위 대입 공격, 사전 대입 공격 등)을 시도할 수 있는 기간 제한이 없으므로" >> ../result.xml
echo "공격자 입장에서는 장기적인 공격을 시행할 수 있어 시행한 기간에 비례하" >> ../result.xml
echo "여 사용자 패스워드가 유출될 수 있는 확률이 증가함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/login.defs | grep -v \"# ^*\" | grep -i \"PASS_MAX_DAYS\"" >> ../result.xml
cat /etc/login.defs | grep -v "# ^*" | grep -i "PASS_MAX_DAYS" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있는 경우" >> ../result.xml
echo "[취약] : 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있지 않는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `cat /etc/login.defs | grep -v "# ^*" | grep -i "PASS_MAX_DAYS" | grep "90" | wc -l` -ge 1 ]
	then
		echo "[양호] : 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있는 경우" >> ../result.xml
	else
		echo "[취약] : 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있지 않는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-40>" >> ../result.xml
echo "" >> ../result.xml

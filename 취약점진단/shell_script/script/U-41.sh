 
echo "<U-41>" >> ../result.xml 
echo "<Name> 패스워드 최소 사용기간 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "최소 사용기간이 설정되어 있지 않아 반복적으로 즉시 변경이 가능한 경" >> ../result.xml
echo "우 이전 패스워드 기억 횟수를 설정하여도 반복적으로 즉시 변경하여 이전" >> ../result.xml
echo "패스워드로 설정이 가능함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/login.defs | grep -i \"PASS_MIN_DAYS\"" >> ../result.xml
cat /etc/login.defs | grep -i "PASS_MIN_DAYS" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : 패스워드 최소 사용기간이 1일 이상 설정되어 있는 경우" >> ../result.xml
echo "[취약] : 패스워드 최소 사용기간이 설정되어 있지 않는 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
if [ `cat /etc/login.defs | grep -i "PASS_MIN_DAYS" | grep "1" | wc -l` -ge 1 ]
	then
		echo "[양호] : 패스워드 최소 사용기간이 1일 이상 설정되어 있는 경우" >> ../result.xml
	else
		echo "[취약] : 패스워드 최소 사용기간이 설정되어 있지 않는 경우" >> ../result.xml 
fi
echo "</Result>" >> ../result.xml 
echo "</U-41>" >> ../result.xml
echo "" >> ../result.xml

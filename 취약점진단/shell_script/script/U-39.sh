 
echo "<U-39>" >> ../result.xml 
echo "<Name> 패스워드 최소 길이 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "패스워드 문자열이 짧은 경우 유추가 가능 할 수 있으며 암호화된 패스워드" >> ../result.xml
echo "해시값을 무작위 대입공격, 사전대입 공격 등으로 단시간에 패스워드 크렉이 가능함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/login.defs | grep \"# ^*\" | grep -i \"PASS_MIN_LEN\"" >> ../result.xml
cat /etc/login.defs | grep "# ^*" | grep -i "PASS_MIN_LEN" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 패스워드 최소 길이가 8자 이상으로 설정되어 있는 경우" >> ../result.xml
echo "[취약] : 패스워드 최소 길이가 8자 미만으로 설정되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `cat /etc/login.defs | grep "# ^*" | grep -i "PASS_MIN_LEN" | grep "8" | wc -l` -ge 1 ]
	then
		echo "[양호] : 패스워드 최소 길이가 8자 이상으로 설정되어 있는 경우" >> ../result.xml
	else
		echo "[취약] : 패스워드 최소 길이가 8자 미만으로 설정되어 있는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-39>" >> ../result.xml
echo "" >> ../result.xml

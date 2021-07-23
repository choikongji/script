 
echo "<U-42>" >> ../result.xml 
echo "<Name> 불필요한 계정 제거 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "로그인이 가능하고 현재 사용하지 않는 불필요한 계정은 사용중인 계정보다" >> ../result.xml
echo "상대적으로 관리가 취약하여 공격자의 목표가 되어 계정이 탈취될 수 있음" >> ../result.xml
echo "※ 퇴직, 전직, 휴직 등의 사유발생시 즉시 권한을 회수" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/passwd | grep -E \"lp|uucp|nuucp\"" >> ../result.xml
cat /etc/passwd | grep -E "lp|uucp|nuucp" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/passwd" >> ../result.xml
cat /etc/passwd >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 불필요한 계정이 존재하지 않는 경우" >> ../result.xml
echo "[취약] : 불필요한 계정이 존재하는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
 if [ `cat /etc/passwd | grep -E "lp|uucp|nuucp" | wc -l` -ge -1 ]
	then
		echo "[취약] : 불필요한 계정이 존재하는 경우" >> ../result.xml
	else
		echo "[수동점검>" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-42>" >> ../result.xml
echo "" >> ../result.xml

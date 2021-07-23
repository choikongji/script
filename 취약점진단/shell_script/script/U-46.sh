 
echo "<U-46>" >> ../result.xml 
echo "<Name> 사용자 shell 점검 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml
echo "로그인이 불필요한 계정은 일반적으로 OS 설치 시 기본적으로 생성되는 계" >> ../result.xml
echo "정으로 쉘이 설정되어 있을 경우, 공격자는 기본 계정들을 이용하여 시스템" >> ../result.xml
echo "에 명령어를 실행 할 수 있음" >> ../result.xml 
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/passwd | grep -E \"^daemon|^bin|^sys|^adm|^listen|^nobody4|^noaccess|^diag|^operator|^games|^gohper\" | grep -v \"admin\"
" >> ../result.xml 
cat /etc/passwd | grep -E "^daemon|^bin|^sys|^adm|^listen|^nobody4|^noaccess|^diag|^operator|^games|^gohper" | grep -v "admin" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 로그인이 필요하지 않은 계정에 /bin/false(/sbin/nologin) 쉘이 부여되어 있는 경우" >> ../result.xml
echo "[취약] : 로그인이 필요하지 않은 계정에 /bin/false(/sbin/nologin) 쉘이 부여되지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `cat /etc/passwd | grep -E "^daemon|^bin|^sys|^adm|^listen|^nobody4|^noaccess|^diag|^operator|^games|^gohper" | grep -v "admin" | grep -E "/sbin/nologin| /bin/false" | wc -l` -ge 1 ]
	then
		echo "[양호] : 로그인이 필요하지 않은 계정에 /bin/false(/sbin/nologin) 쉘이 부여되어 있는 경우" >> ../result.xml
	else
		echo "[취약] : 로그인이 필요하지 않은 계정에 /bin/false(/sbin/nologin) 쉘이 부여되지 않은 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-46>" >> ../result.xml
echo "" >> ../result.xml

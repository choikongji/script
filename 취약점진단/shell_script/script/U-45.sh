 
echo "<U-45>" >> ../result.xml 
echo "<Name> 동일한 UID 금지 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "중복된 UID가 존재할 경우 시스템은 동일한 사용자로 인식하여 소유자의 권" >> ../result.xml
echo "한이 중복되어 불필요한 권한이 부여되며 시스템 로그를 이용한 감사 추적" >> ../result.xml
echo "시 사용자가 구분되지 않음 (권한 할당은 그룹권한을 이용하여 운영)" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
cat /etc/passwd | awk -F ':' '{print $3}' > test.txt
echo "#cat /etc/passwd | awk -F ':' '{print $3}'" >> ../result.xml
cat test.txt >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 동일한 UID로 설정된 사용자 계정이 존재하지 않는 경우" >> ../result.xml
echo "[취약] : 동일한 UID로 설정된 사용자 계정이 존재하는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

if [ `sort test.txt | uniq -d | wc -l` -ge 1 ]
	then
		echo "[취약] : 동일한 UID로 설정된 사용자 계정이 존재하는 경우" >> ../result.xml
	else
		echo "[양호] : 동일한 UID로 설정된 사용자 계정이 존재하지 않는 경우" >> ../result.xml
fi
if [ -e test.txt ]
	then
		rm -rf test.txt
fi
echo "</Result>" >> ../result.xml 
echo "</U-45>" >> ../result.xml
echo "" >> ../result.xml

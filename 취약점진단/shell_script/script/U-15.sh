 
echo "<U-15>" >> ../result.xml 
echo "<Name> world writable 파일 점검 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "시스템 파일과 같은 중요 파일에 world writable 설정이 될 경우, 일반사용자" >> ../result.xml
echo "및 비인가된 사용자가 해당 파일을 임의로 수정, 삭제가 가능함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#find / -type f -perm -2 -exec ls -l {} \;" >> ../result.xml
find / -type f -perm -2 -exec ls -l {} \; | grep -v "/proc" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "양호 : 시스템 중요 파일에 world writable 파일이 존재하지 않거나, 존재 시 설정" >> ../result.xml
echo "이유를 확인하고 있는 경우" >> ../result.xml
echo "[취약] : 시스템 중요 파일에 world writable 파일이 존재하나 해당 설정 이유를" >> ../result.xml
echo "확인하고 있지 않는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `find / -type f -perm -2 -exec ls -l {} \; | grep -v "/proc" | wc -l` -ge 1 ]
	then
		echo "[취약] : 시스템 중요 파일에 world writable 파일이 존재하나 해당 설정 이유를" >> ../result.xml
		echo "확인하고 있지 않는 경우" >> ../result.xml
	else
		echo "[양호] : 시스템 중요 파일에 world writable 파일이 존재하지 않거나, 존재 시 설정" >> ../result.xml
		echo "이유를 확인하고 있는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-15>" >> ../result.xml
echo "" >> ../result.xml
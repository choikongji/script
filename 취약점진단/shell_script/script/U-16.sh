 
echo "<U-16>" >> ../result.xml 
echo "<Name> /dev에 존재하지 않는 device 파일 점검 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml
echo "공격자는 rootkit 설정파일들을 서버 관리자가 쉽게 발견하지 못하도록 /dev" >> ../result.xml
echo "에 device 파일인 것처럼 위장하는 수법을 많이 사용함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#find /dev -type f -exec ls -l {} \;" >> ../result.xml
find /dev -type f -exec ls -l {} \; >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : dev에 대한 파일 점검 후 존재하지 않은 device 파일을 제거한 경우" >> ../result.xml
echo "[취약] : dev에 대한 파일 미점검 또는, 존재하지 않은 device 파일을 방치한 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `find /dev -type f -exec ls -l {} \; | wc -l` -ge 1 ]
	then
		echo "[취약] : dev에 대한 파일 미점검 또는, 존재하지 않은 device 파일을 방치한 경우" >> ../result.xml
	else
		echo "[양호] : dev에 대한 파일 점검 후 존재하지 않은 device 파일을 제거한 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-16>" >> ../result.xml
echo "" >> ../result.xml
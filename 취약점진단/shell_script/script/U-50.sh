 
echo "<U-50>" >> ../result.xml 
echo "<Name> 홈디렉토리 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "홈 디렉터리 내 설정파일 변조 시 정상적인 서비스 이용이 제한될 우려가 존재함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /home" >> ../result.xml
ls -l /home >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : 홈 디렉터리 소유자가 해당 계정이고, 타 사용자 쓰기 권한이 제거된 경우" >> ../result.xml
echo "[취약] : 홈 디렉터리 소유자가 해당 계정이 아니고, 타 사용자 쓰기 권한이 부여된 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ls -l /home | awk -F ' ' '{if ($3!=$9) {print $3}}' | wc -l` -ge 1 ]
	then
		echo "[취약] : 홈 디렉터리 소유자가 해당 계정이 아니고, 타 사용자 쓰기 권한이 부여된 경우" >> ../result.xml
	else
		echo "[양호] : 홈 디렉터리 소유자가 해당 계정이고, 타 사용자 쓰기 권한이 제거된 경우" >> ../result.xml
fi
	
echo "</Result>" >> ../result.xml 
echo "</U-50>" >> ../result.xml
echo "" >> ../result.xml

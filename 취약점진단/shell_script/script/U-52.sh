 
echo "<U-52>" >> ../result.xml 
echo "<Name> 숨겨진 파일 및 디렉토리 검색 및 제거 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "공격자는 숨겨진 파일 및 디렉터리를 통해 시스템 정보 습득, 파일 임의 변경 등을 할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#find / -type f -name \".*\"" >> ../result.xml
find / -type f -name ".*" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#find / -type d -name \".*\"" >> ../result.xml
find / -type d -name ".*"  >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : 불필요하거나 의심스러운 숨겨진 파일 및 디렉터리를 삭제한 경우" >> ../result.xml
echo "[취약] : 불필요하거나 의심스러운 숨겨진 파일 및 디렉터리를 방치한 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
echo "[인터뷰]" >> ../result.xml
echo "</Result>" >> ../result.xml 
echo "</U-52>" >> ../result.xml
echo "" >> ../result.xml

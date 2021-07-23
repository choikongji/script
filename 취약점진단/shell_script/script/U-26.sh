 
echo "<U-26>" >> ../result.xml 
echo "<Name> automountd 제거 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml
echo "파일 시스템의 마운트 옵션을 변경하여 root 권한을 획득할 수 있으며, 로컬" >> ../result.xml
echo "공격자가 automountd 프로세스 권한으로 임의의 명령을 실행할 수 있음" >> ../result.xml 
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -E \"automount|autofs\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep -E "automount|autofs" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : automountd 서비스가 비활성화 되어 있는 경우" >> ../result.xml
echo "[취약] : automountd 서비스가 활성화 되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `ps -ef | grep -E "automount|autofs" | grep -v "grep" | wc -l` -ge 1 ]
	then
		echo "[취약] : automountd 서비스가 활성화 되어 있는 경우" >> ../result.xml
	else
		echo "[양호] : automountd 서비스가 비활성화 되어 있는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-26>" >> ../result.xml
echo "" >> ../result.xml
 
echo "<U-38>" >> ../result.xml 
echo "<Name> root 계정 su 제한 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "무분별한 사용자 변경으로 타 사용자 소유의 파일을 변경 할 수 있으며" >> ../result.xml
echo "root 계정으로 변경하는 경우 관리자 권한을 획득 할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/group | grep -i \"wheel\"" >> ../result.xml
cat /etc/group | grep -i "wheel" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/pam.d/su" >> ../result.xml
cat /etc/pam.d/su >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : su 명령어를 특정 그룹에 속한 사용자만 사용하도록 제한되어 있는 경우" >> ../result.xml
echo "※ 일반사용자 계정 없이 root 계정만 사용하는 경우 su 명령어 사용제한 불필요" >> ../result.xml
echo "[취약] : su 명령어를 모든 사용자가 사용하도록 설정되어 있는 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

if [ `cat /etc/pam.d/su | grep -v "# ^*" | grep "auth" | grep "pam_wheel.so" | wc -l` -ge 1 ]
	then
		echo "[양호] : su 명령어를 특정 그룹에 속한 사용자만 사용하도록 제한되어 있는 경우" >> ../result.xml
	else
		echo "[취약] : su 명령어를 모든 사용자가 사용하도록 설정되어 있는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-38>" >> ../result.xml
echo "" >> ../result.xml

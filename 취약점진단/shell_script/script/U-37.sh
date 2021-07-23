 
echo "<U-37>" >> ../result.xml 
echo "<Name> root 이외의 UID가 ‘0’ 금지 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo " root 계정과 동일 UID가 설정되어 있는 일반사용자 계정도 root 권한을 부" >> ../result.xml
echo "여받아 관리자가 실행 할 수 있는 모든 작업이 가능함(서비스 시작, 중지," >> ../result.xml
echo "재부팅, root 권한 파일 편집 등)" >> ../result.xml
echo "root와 동일한 UID를 사용하므로 사용자 감사 추적 시 어려움이 발생함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/passwd " >> ../result.xml
cat /etc/passwd  >> ../result.xml
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : root 계정과 동일한 UID를 갖는 계정이 존재하지 않는 경우" >> ../result.xml
echo "[취약] : root 계정과 동일한 UID를 갖는 계정이 존재하는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
num=`cat /etc/passwd | grep -v "root" | awk -F ':' '{print $3}'`
for i in num
	do
		if [ $i == "0" ]
			then
				echo "[취약] : root 계정과 동일한 UID를 갖는 계정이 존재하는 경우" >> ../result.xml
			else
				echo "[양호] : root 계정과 동일한 UID를 갖는 계정이 존재하지 않는 경우" >> ../result.xml
		fi
	done
	
echo "</Result>" >> ../result.xml 
echo "</U-37>" >> ../result.xml
echo "" >> ../result.xml

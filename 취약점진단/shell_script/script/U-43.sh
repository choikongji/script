 
echo "<U-43>" >> ../result.xml 
echo "<Name> 관리자 그룹에 최소한의 계정 포함 </Name>"  >> ../result.xml utmp, wtmp ,btmp
echo "<Security_Threat>" >> ../result.xml
echo "시스템을 관리하는 root 계정이 속한 그룹은 시스템 운영 파일에 대한 접근" >> ../result.xml
echo "권한이 부여되어 있으므로 해당 관리자 그룹에 속한 계정이 비인가자에게" >> ../result.xml
echo "유출될 경우 관리자 권한으로 시스템에 접근하여 계정 정보 유출, 환경설정" >> ../result.xml
echo "파일 및 디렉터리 변조 등의 위협이 존재함" >> ../result.xml 
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/group | grep \"root\"" >> ../result.xml
cat /etc/group | grep "root" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 관리자 그룹에 불필요한 계정이 등록되어 있지 않은 경우" >> ../result.xml
echo "[취약] : 관리자 그룹에 불필요한 계정이 등록되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
test=`cat /etc/group | grep "root" | awk -F ':' '{print $4}'` 
if [ -z $test ]
	then
		echo "[양호] : 관리자 그룹에 불필요한 계정이 등록되어 있지 않은 경우" >> ../result.xml
	else
		if [ $test == "root" ]
			then
				echo "[양호] : 관리자 그룹에 불필요한 계정이 등록되어 있지 않은 경우" >> ../result.xml
			else 
				echo "[인터뷰>" >> ../result.xml
		fi
fi
echo "</Result>" >> ../result.xml 
echo "</U-43>" >> ../result.xml
echo "" >> ../result.xml

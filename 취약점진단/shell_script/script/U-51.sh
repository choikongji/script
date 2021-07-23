 
echo "<U-51>" >> ../result.xml 
echo "<Name> 홈디렉토리로 지정한 디렉토리의 존재 관리 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "passwd 파일에 설정된 홈디렉터리가 존재하지 않는 경우, 해당 계정으로 로" >> ../result.xml
echo "그인시 홈디렉터리가 루트 디렉터리(“/“)로 할당되어 접근이 가능함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/passwd | awk -F ':' '{if ($3>=1000) {print $0}}'" >> ../result.xml
cat /etc/passwd | awk -F ':' '{if ($3>=1000) {print $0}}' >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 홈 디렉터리가 존재하지 않는 계정이 발견되지 않는 경우" >> ../result.xml
echo "[취약] : 홈 디렉터리가 존재하지 않는 계정이 발견된 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

flag="True"

if [ `cat /etc/passwd | awk -F ':' '{if ($3>=1000 && $6=="") {print $1}}' | wc -l` -ge 1 ]
	then
		flag="False"
fi
if [ `cat /etc/passwd | awk -F ':' '{if ($3>=1000 && $6=="/") {print $1}}' | wc -l` -ge 1 ]
	then
		flag="False"
fi
if [ $flag == "False" ]
	then
		echo "[취약] : 홈 디렉터리가 존재하지 않는 계정이 발견된 경우" >> ../result.xml
	else
		echo "[양호] : 홈 디렉터리가 존재하지 않는 계정이 발견되지 않는 경우" >> ../result.xml
fi
	
				
echo "</Result>" >> ../result.xml 
echo "</U-51>" >> ../result.xml
echo "" >> ../result.xml

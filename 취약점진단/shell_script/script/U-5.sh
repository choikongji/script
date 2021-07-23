 
echo "<U-5>" >> ../result.xml 
echo "<Name> root홈, 패스 디렉터리 권한 및 패스 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "root 계정의 PATH(환경변수)에 정상적인 관리자 명령어(예: ls, mv, cp등)의" >> ../result.xml
echo "디렉터리 경로 보다 현재 디렉터리를 지칭하는 “.” 표시가 우선하면 현재" >> ../result.xml
echo "디렉터리에 변조된 명령어를 삽입하여 관리자 명령어 입력 시 악의적인" >> ../result.xml
echo "기능이 실행 될 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#echo $PATH" >> ../result.xml
echo $PATH >> ../result.xml 2>&1
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : PATH 환경변수에 “.” 이 맨 앞이나 중간에 포함되지 않은 경우" >> ../result.xml
echo "[취약] : PATH 환경변수에 “.” 이 맨 앞이나 중간에 포함되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

flag="True"

if [ `echo $PATH | grep '^./' | wc -l` -ge 1 ] 
	then
		flag="False"
fi

if [ `echo $PATH | grep '::' | wc -l` -ge 1 ] 
	then
		flag="False"
fi

	

if [ $flag == "False" ]
	then
		echo "[취약] : PATH 환경변수에 “.” 이 맨 앞이나 중간에 포함되어 있는 경우" >> ../result.xml 
	else
		echo "[양호] : PATH 환경변수에 “.” 이 맨 앞이나 중간에 포함되지 않은 경우" >> ../result.xml
fi
	

	

echo "</Result>" >> ../result.xml 
echo "</U-5>" >> ../result.xml
echo "" >> ../result.xml

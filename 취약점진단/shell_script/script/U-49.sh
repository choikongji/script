 
echo "<U-49>" >> ../result.xml 
echo "<Name> UMASK 설정 관리 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "잘못된 UMASK 값으로 인해 파일 및 디렉터리 생성시 과도하게 퍼미션이 부여 될 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/profile" >> ../result.xml
cat /etc/profile >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : UMASK 값이 022 이상으로 설정된 경우" >> ../result.xml
echo "[취약] : UMASK 값이 022 이상으로 설정되지 않은 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="False"
test=`cat /etc/profile | grep "umask" | awk -F ' ' '{print $2}' | grep -v "By"`
for i in ${test[*]}
	do
		if [ $i -ge 022 ] 
			then
				flag="True"
		fi
	done
	
if [ $flag == "True" ]
	then
		echo "[양호] : UMASK 값이 022 이상으로 설정된 경우" >> ../result.xml
	else
		echo "[취약] : UMASK 값이 022 이상으로 설정되지 않은 경우" >> ../result.xml
fi
		
echo "</Result>" >> ../result.xml 
echo "</U-49>" >> ../result.xml
echo "" >> ../result.xml

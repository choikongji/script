 
echo "<U-44>" >> ../result.xml 
echo "<Name> 계정이 존재하지 않는 GID 금지 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "계정이 존재하지 않는 그룹은 현재 사용되고 있는 그룹이 아닌 불필요한 그" >> ../result.xml
echo "룹으로 삭제 조치가 필요함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/group" >> ../result.xml
cat /etc/group >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/passwd" >> ../result.xml
cat /etc/passwd >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 시스템 관리나 운용에 불필요한 그룹이 삭제 되어있는 경우" >> ../result.xml
echo "[취약] : 시스템 관리나 운용에 불필요한 그룹이 존재할 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"
test=`cat /etc/group | awk -F ':' '{if ($3>=500 || $3==0) {print $1}}'`
for i in ${test[*]}
	do 
		if [ `cat /etc/passwd | grep "$i" | wc -l` -eq 0 ]
			then
				flag="False"
		fi
	done
if [ $flag == "False" ]
	then
		echo "[취약] : 시스템 관리나 운용에 불필요한 그룹이 존재할 경우" >> ../result.xml
	else
		echo "[양호] : 시스템 관리나 운용에 불필요한 그룹이 삭제 되어있는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-44>" >> ../result.xml
echo "" >> ../result.xml

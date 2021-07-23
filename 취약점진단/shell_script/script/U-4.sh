 
echo "<U-4>" >> ../result.xml 
echo "<Name> 패스워드 파일 보호 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "사용자 계정 패스워드가 저장된 파일이 유출 또는 탈취 시 평문으로 저장된" >> ../result.xml
echo "패스워드 정보가 노출될 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#/etc/shadow" >> ../result.xml
ls /etc/shadow >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/passwd | grep 'root' | awk -F ':' '{print $2}'" >> ../result.xml 
cat /etc/passwd | head -n 1 | awk -F ':' '{print $2}' >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 쉐도우 패스워드를 사용하거나, 패스워드를 암호화하여 저장하는 경우" >> ../result.xml
echo "[취약] : 쉐도우 패스워드를 사용하지 않고, 패스워드를 암호화하여 저장하지 않는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

if [ -e /etc/shadow ]
	then
		if [ `cat /etc/passwd | head -n 1 | awk -F ':' '{print $2}'` == "x" ]
			then
				echo "[양호] : 쉐도우 패스워드를 사용하거나, 패스워드를 암호화하여 저장하는 경우" >> ../result.xml
			else
				echo "[취약] : 쉐도우 패스워드를 사용하지 않고, 패스워드를 암호화하여 저장하지 않는 경우" >> ../result.xml
		fi
	else
		echo "[취약] : /etc/shadow 파일이 없는 경우" >> ../result.xml
fi


echo "</Result>" >> ../result.xml 
echo "</U-4>" >> ../result.xml
echo "" >> ../result.xml
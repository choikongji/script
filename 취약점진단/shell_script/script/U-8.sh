 
echo "<U-8>" >> ../result.xml 
echo "<Name> /etc/shadow 파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "shadow파일은 패스워드를 암호화하여 저장하는 파일이며 해당 파일의" >> ../result.xml
echo "암호화된 해쉬값을 복호화하여(크래킹) 비밀번호를 탈취할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /etc/shadow" >> ../result.xml
ls -l /etc/shadow >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : /etc/shadow 파일의 소유자가 root이고, 권한이 400 이하인 경우" >> ../result.xml
echo "[취약] : /etc/shadow 파일의 소유자가 root가 아니거나, 권한이 400 이하가 아닌 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `stat -c %a /etc/shadow` -le 400 ] && [ `stat -c %U /etc/shadow` == "root" ]
	then
		echo "[양호] : /etc/shadow 파일의 소유자가 root이고, 권한이 400 이하인 경우" >> ../result.xml
	else
		echo "[취약] : /etc/shadow 파일의 소유자가 root가 아니거나, 권한이 400 이하가 아닌 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-8>" >> ../result.xml
echo "" >> ../result.xml

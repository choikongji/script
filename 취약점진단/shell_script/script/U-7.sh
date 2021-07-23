 
echo "<U-7>" >> ../result.xml 
echo "<Name> /etc/passwd 파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "관리자(root) 외 사용자가 /etc/passwd 파일의 사용자 정보를 변조하여" >> ../result.xml
echo "shell 변경, 사용자 추가/삭제 등 root를 포함한 사용자 권한 획득 가능" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /etc/passwd" >> ../result.xml
ls -l /etc/passwd >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : /etc/passwd 파일의 소유자가 root이고, 권한이 644 이하인 경우" >> ../result.xml
echo "[취약] : /etc/passwd 파일의 소유자가 root가 아니거나, 권한이 644 이하가 아닌 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

if [ `stat -c %a /etc/passwd` -le 644 ] && [ `stat -c %U /etc/passwd` == "root" ]
	then
		echo "[양호] : /etc/passwd 파일의 소유자가 root이고, 권한이 644 이하인 경우" >> ../result.xml
	else
		echo "[취약] : /etc/passwd 파일의 소유자가 root가 아니거나, 권한이 644 이하가 아닌 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-7>" >> ../result.xml
echo "" >> ../result.xml
 
echo "<U-48>" >> ../result.xml 
echo "<Name> hosts.lpd 파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "hosts.lpd 파일의 접근권한이 적절하지 않을 경우 비인가자가 /etc/hosts.lpd" >> ../result.xml
echo "파일을 수정하여 허용된 사용자의 서비스를 방해할 수 있으며, 호스트 정보" >> ../result.xml
echo "를 획득 할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /etc/hosts.lpd" >> ../result.xml
ls -l /etc/hosts.lpd >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : hosts.lpd 파일이 삭제되어 있거나 불가피하게 hosts.lpd 파일을 사용할" >> ../result.xml
echo "시 파일의 소유자가 root이고 권한이 600인 경우" >> ../result.xml
echo "[취약] : hosts.lpd 파일이 삭제되어 있지 않거나 파일의 소유자가 root가 아니고 권한이 600이 아닌 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ -e etc/hosts.lpd ]
	then
		if [ `stat -c %a /etc/hosts.lpd` -le 600 ] && [ `stat -c %U /etc/hosts.lpd` == "root" ]
			then
				echo "[양호] : 불가피하게 hosts.lpd 파일을 사용할" >> ../result.xml
			else 
				echo "[취약] : hosts.lpd 파일이 삭제되어 있지 않거나 파일의 소유자가 root가 아니고 권한이 600이 아닌 경우" >> ../result.xml
		fi
	else
		echo "[양호] : hosts.lpd 파일이 삭제된 경우" >> ../result.xml 
fi

echo "</Result>" >> ../result.xml 
echo "</U-48>" >> ../result.xml
echo "" >> ../result.xml

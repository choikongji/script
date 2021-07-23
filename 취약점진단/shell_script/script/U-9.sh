 
echo "<U-9>" >> ../result.xml 
echo "<Name> /etc/hosts 파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "hosts 파일에 비인가자 쓰기 권한이 부여된 경우, 공격자는 hosts파일에" >> ../result.xml
echo "악의적인 시스템을 등록하여, 이를 통해 정상적인 DNS를 우회하여 악성사이" >> ../result.xml
echo "트로의 접속을 유도하는 파밍(Pharming) 공격 등에 악용될 수 있음" >> ../result.xml
echo "hosts파일에 소유자외 쓰기 권한이 부여된 경우, 일반사용자 권한으로 hosts" >> ../result.xml
echo "파일에 변조된 IP주소를 등록하여 정상적인 DNS를 방해하고 악성사이트로" >> ../result.xml
echo "의 접속을 유도하는 파밍(Pharming) 공격 등에 악용될 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /etc/hosts" >> ../result.xml
ls -l /etc/hosts >> ../result.xml 2>&1
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : /etc/hosts 파일의 소유자가 root이고, 권한이 600인 이하경우" >> ../result.xml
echo "[취약] : /etc/hosts 파일의 소유자가 root가 아니거나, 권한이 600 이상인 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `stat -c %a /etc/hosts` -le 600 ] && [ `stat -c %U /etc/hosts` == "root" ]
	then 
		echo "[양호] : /etc/hosts 파일의 소유자가 root이고, 권한이 600인 이하경우" >> ../result.xml
	else
		echo "[취약] : /etc/hosts 파일의 소유자가 root가 아니거나, 권한이 600 이상인 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-9>" >> ../result.xml
echo "" >> ../result.xml

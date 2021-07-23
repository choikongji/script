 
echo "<U-62>" >> ../result.xml 
echo "<Name> NFS 설정파일 접근권한 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml
echo "NFS 접근제어 설정파일에 대한 권한 관리가 이루어지지 않을 시 인가되지" >> ../result.xml
echo "않은 사용자를 등록하고 파일시스템을 마운트하여 불법적인 변조를 시도할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -al /etc/exports" >> ../result.xml
ls -al /etc/exports >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : NFS 접근제어 설정파일의 소유자가 root 이고, 권한이 644 이하인 경우" >> ../result.xml
echo "[취약] : NFS 접근제어 설정파일의 소유자가 root 가 아니거나, 권한이 644 이하가 아닌 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
if [ `stat -c %a /etc/exports` -le 644 ] && [ `stat -c %U /etc/exports` == "root" ]
	then
		echo "[양호] : NFS 접근제어 설정파일의 소유자가 root 이고, 권한이 644 이하인 경우" >> ../result.xml
	else
		echo "[취약] : NFS 접근제어 설정파일의 소유자가 root 가 아니거나, 권한이 644 이하가 아닌 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-62>" >> ../result.xml
echo "" >> ../result.xml

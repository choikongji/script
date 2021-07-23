 
echo "<U-24>" >> ../result.xml 
echo "<Name> NFS 서비스 비활성화 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo " NFS 서비스는 서버의 디스크를 클라이언트와 공유하는 서비스로 적정한" >> ../result.xml
echo "보안설정이 적용되어 있지 않다면 불필요한 파일 공유로 인한 유출위험이 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef \| grep \"nfs\" \| grep -v \"[[:graph:]]nfs\\|nfs[[:graph:]]\"\| grep -v \"grep\"" >> ../result.xml
ps -ef | grep "nfs" | grep -v "[[:graph:]]nfs\|nfs<<:graph:]>"| grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ps -ef \| grep \"statd\" \| grep -v \"[[:graph:]]statd\\|statd[[:graph:]]\"\| grep -v \"grep\"" >> ../result.xml
ps -ef | grep "statd" | grep -v "[[:graph:]]statd\|statd<<:graph:]>"| grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ps -ef \| grep \"lockd\" \| grep -v \"[[:graph:]]lockd\\|lockd[[:graph:]]\"\| grep -v \"grep\"" >> ../result.xml
ps -ef | grep "lockd" | grep -v "[[:graph:]]lockd\|lockd<<:graph:]>"| grep -v "grep" >> ../result.xml
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 불필요한 NFS 서비스 관련 데몬이 비활성화 되어 있는 경우" >> ../result.xml
echo "[취약] : 불필요한 NFS 서비스 관련 데몬이 활성화 되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"
if [ `ps -ef | grep "nfs" | grep -v "[[:graph:]]nfs\|nfs<<:graph:]>"| grep -v "grep" | wc -l` -ge 1 ]
	then
		flag="False"
fi
if [ `ps -ef | grep "statd" | grep -v "[[:graph:]]statd\|statd<<:graph:]>"| grep -v "grep" | wc -l` -ge 1 ]
	then
		flag="False"
fi
if [ `ps -ef | grep "lockd" | grep -v "[[:graph:]]lockd\|lockd<<:graph:]>"| grep -v "grep" | wc -l` -ge 1 ]
	then
		flag="False"
fi

if [ $flag == "False" ] 
	then
		echo "[취약] : 불필요한 NFS 서비스 관련 데몬이 활성화 되어 있는 경우" >> ../result.xml
	else
		echo "[양호] : 불필요한 NFS 서비스 관련 데몬이 비활성화 되어 있는 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-24>" >> ../result.xml
echo "" >> ../result.xml
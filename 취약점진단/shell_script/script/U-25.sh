 
echo "<U-25>" >> ../result.xml 
echo "<Name> NFS 접근 통제 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "접근제한 설정이 적절하지 않을 경우 인증절차 없이 비인가자의 디렉터리나" >> ../result.xml
echo "파일의 접근이 가능하며, 해당 공유 시스템에 원격으로 마운트하여 중요" >> ../result.xml
echo "파일을 변조하거나 유출할 위험이 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ps -ef | grep -i \"nfs\" | grep -v \"nfsiod\" | grep -v \"grep\"" >> ../result.xml
ps -ef | grep -i "nfs" | grep -v "nfsiod" | grep -v "grep" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/exports" >> ../result.xml
cat /etc/exports >> ../result.xml
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 불필요한 NFS 서비스를 사용하지 않거나, 불가피하게 사용 시 everyone" >> ../result.xml
echo "공유를 제한한 경우" >> ../result.xml
echo "[취약] : 불필요한 NFS 서비스를 사용하고 있고, everyone 공유를 제한하지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml
flag="True"
if [ `ps -ef | grep -i "nfs" | grep -v "nfsiod" | grep -v "grep" | wc -l` -ge 1 ]
	then
		if [ `cat /etc/exports | grep -i "/stand" | wc -l` -ge 1 ]
			then
				echo "[수동점검>" >> ../result.xml
		fi
	else
		echo "[양호] : 불필요한 NFS 서비스를 사용하지 않거나, 불가피하게 사용 시 everyone" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-25>" >> ../result.xml
echo "" >> ../result.xml
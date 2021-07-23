 
echo "<U-27>" >> ../result.xml 
echo "<Name> RPC 서비스 확인 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "버퍼 오버플로우(Buffer Overflow), Dos, 원격실행 등의 취약성이 존재하는" >> ../result.xml
echo "RPC 서비스를 통해 비인가자의 root 권한 획득 및 침해사고 발생 위험이" >> ../result.xml
echo "있으므로 서비스를 중지하여야 함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /etc/xinetd.d | awk -F ' ' '{print \$9}'" >> ../result.xml
ls -l /etc/xinetd.d | awk -F ' ' '{print $9}' >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml
echo "[양호] : 불필요한 RPC 서비스가 비활성화 되어 있는 경우" >> ../result.xml
echo "[취약] : 불필요한 RPC 서비스가 활성화 되어 있는 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"
xpath=`ls -l /etc/xinetd.d | awk -F ' ' '{print $9}'`
ser=( "rpc.cmsd" "rpc.ttdbserverd" "sadmind" "rusersd" "walld" "sprayd" "rstatd" "rpc.nisd" "rexd" "rpc.pcnfsd" "rpc.statd" "rpc.statd" "rpc.ypupdated" "rpc.rquotad" "kcms_server" "cachefsd" )

for i in ${xpath[*]}
	do
		for j in ${ser[*]}
			do
				if [ $i==$j ]
					then
						if [ `cat /etc/xinetd.d/$i | grep -i "disable" | grep -i "no" | wc -l` -ge 1 ]
							then
								flag="False"
						fi
				fi
			done
	done
	
if [ $flag == "False" ]
		then
			echo "[취약] : 불필요한 RPC 서비스가 활성화 되어 있는 경우" >> ../result.xml
		else
			echo "[양호] : 불필요한 RPC 서비스가 비활성화 되어 있는 경우" >> ../result.xml
fi
echo "</Result>" >> ../result.xml 
echo "</U-27>" >> ../result.xml
echo "" >> ../result.xml
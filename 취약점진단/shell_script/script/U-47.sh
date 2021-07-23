 
echo "<U-47>" >> ../result.xml 
echo "<Name> Session Timeout 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "Session timeout 값이 설정되지 않은 경우 유휴 시간 내 비인가자의 시스템" >> ../result.xml
echo "접근으로 인해 불필요한 내부 정보의 노출 위험이 존재함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/profile | grep -v \"# ^*\" | grep -i \"TMOUT\"" >> ../result.xml
cat /etc/profile | grep -v "# ^*" | grep -i "TMOUT" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/.profile | grep -v \"# ^*\" | grep -i \"TMOUT\"" >> ../result.xml
cat /etc/.profile | grep -v "# ^*" | grep -i "TMOUT" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/csh.login | grep -i \"autologout\"" >> ../result.xml
cat /etc/csh.login | grep -i "autologout" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/csh.cshrc | grep -i \"autologout\"" >> ../result.xml
cat /etc/csh.cshrc | grep -i \"autologout\" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : Session Timeout이 600초(10분) 이하로 설정되어 있는 경우" >> ../result.xml
echo "[취약] : Session Timeout이 600초(10분) 이하로 설정되지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"
if [ -e /etc/profile ]
	then
		if [ `cat /etc/profile | grep -v "# ^*" | grep -i "export TMOUT" | awk -F '=' '{print $2}'` -gt 600 ]
			then
				flag="False"
		fi
fi
if [ -e /etc/.profile ]
	then
		if [ `cat /etc/.profile | grep -v "# ^*" | grep -i "export TMOUT" | awk -F '=' '{print $2}'` -gt 600 ]
			then
				flag="False"
		fi
fi

if [ -e /etc/csh.login ]
	then
		if [ `cat /etc/csh.login | grep -v "# ^*" | grep -i "autologout" | wc -l` -ge 1 ] 
			then
			if [ `cat /etc/csh.login | grep -v "# ^*" | grep -i "autologout" | awk -F '=' '{print $2}'` -gt 10 ]
				then
					flag="False"
			fi
		fi
fi

if [ -e /etc/csh.cshrc ]
	then
		if [ `cat /etc/csh.cshrc | grep -v "# ^*" | grep -i "autologout" | wc -l` -ge 1 ] 
			then
			if [ `cat /etc/csh.cshrc | grep -v "# ^*" | grep -i "autologout" | awk -F '=' '{print $2}'` -gt 10 ]
				then
					flag="False"
			fi
		fi
fi
if [ $flag == "False" ]
	then
		echo "[취약] : Session Timeout이 600초(10분) 이하로 설정되지 않은 경우" >> ../result.xml
	else
		echo "[양호] : Session Timeout이 600초(10분) 이하로 설정되어 있는 경우" >> ../result.xml
fi
				
echo "</Result>" >> ../result.xml 
echo "</U-47>" >> ../result.xml
echo "" >> ../result.xml

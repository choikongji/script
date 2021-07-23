 
echo "<U-10>" >> ../result.xml 
echo "<Name> /etc/(x)inetd.conf 파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "(x)inetd.conf 파일에 소유자외 쓰기 권한이 부여된 경우, 일반사용자 권한으로" >> ../result.xml
echo "(x)inetd.conf 파일에 등록된 서비스를 변조하거나 악의적인 프로그램(서비스)를 등록할 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /etc/xinetd.conf" >> ../result.xml
ls -l /etc/xinetd.conf >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /etc/xinetd.d/*" >> ../result.xml 2>&1
ls -l /etc/xinetd.d/* >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "# ls -l /etc/inetd.conf" >> ../result.xml
ls -l /etc/inetd.conf >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /etc/inetd.d/*" >> ../result.xml
ls -l /etc/inetd.d/*
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : /etc/inetd.conf 파일의 소유자가 root이고, 권한이 600인 경우" >> ../result.xml
echo "[취약] : /etc/inetd.conf 파일의 소유자가 root가 아니거나, 권한이 600이 아닌 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"

if [ -e /etc/xinetd.conf ]
	then
		if [ `stat -c %a /etc/xinetd.conf` -gt 600 ] && [ `stat -c %U /etc/xinetd.conf` != "root" ]
			then
				flag="False"
		fi
	else 
		flag="NA"
fi
test=`ls -l /etc/xinetd.d | awk -F ' ' '{print $9}'`
if [ `ls -l /etc/xinetd.d | wc -l` -ge 2 ]
	then
		for i in ${test[*]}
			do
				if [ `stat -c %a /etc/xinetd.d/$i` -gt 600 ] && [ `stat -c %U /etc/xinetd.d/$i` != "root" ]
					then
						flag="False"
				fi
			done
	else 
		flag="NA"
fi
if [ -e /etc/inetd.conf ]
	then
		if [ `stat -c %a /etc/xinetd.conf` -gt 600 ] && [ `stat -c %U /etc/xinetd.conf` != "root" ]
			then
				flag="False"
		fi
	else 
		flag="NA"
fi
test=`ls -l /etc/inetd.d | awk -F ' ' '{print $9}'`
if [ `ls -l /etc/inetd.d | wc -l` -ge 2 ]
	then
		for i in ${test[*]}
			do
				if [ `stat -c %a /etc/xinetd.d/$i` -gt 600 ] && [ `stat -c %U /etc/xinetd.d/$i` != "root" ]
					then
						flag="False"
				fi
			done
	else 
		flag="NA"
fi

if [ $flag=="NA" ] 
	then
		echo "[N/A] : (x)inetd (슈퍼데몬)을 사용하지 않는 경우 " >> ../result.xml
		else
			if [ $flag=="True" ]
				then
					echo "[양호] : /etc/inetd.conf 파일의 소유자가 root이고, 권한이 600인 경우" >> ../result.xml
				else 
					echo "[취약] : /etc/inetd.conf 파일의 소유자가 root가 아니거나, 권한이 600이 아닌 경우" >> ../result.xml
			fi
fi		
echo "</Result>" >> ../result.xml 
echo "</U-10>" >> ../result.xml
echo "" >> ../result.xml

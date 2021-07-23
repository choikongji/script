 
echo "<U-13>" >> ../result.xml 
echo "<Name> SUID, SGID, 설정 파일점검 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "SUID, SGID 파일의 접근권한이 적절하지 않을 경우 SUID, SGID 설정된" >> ../result.xml
echo "파일로 특정 명령어를 실행하여 root 권한 획득 가능함 " >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /usr/bin/admintool" >> ../result.xml
ls -l /usr/bin/admintool >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /usr/bin/at" >> ../result.xml
ls -l /usr/bin/at >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /usr/bin/atq" >> ../result.xml
ls -l /usr/bin/atq >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /usr/bin/atrm" >> ../result.xml
ls -l /usr/bin/atrm >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /usr/bin/lpset" >> ../result.xml
ls -l /usr/bin/lpset >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /usr/bin/newgrp" >> ../result.xml
ls -l /usr/bin/newgrp >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l /usr/bin/nispasswd" >> ../result.xml
ls -l /usr/bin/nispasswd >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 주요 실행파일의 권한에 SUID와 SGID에 대한 설정이 부여되어 있지 않은경우" >> ../result.xml
echo "[취약] : 주요 실행파일의 권한에 SUID와 SGID에 대한 설정이 부여되어 있는 경우" >> ../result.xml
echo "*불필요한 SUID/SGID 목록*" >> ../result.xml
echo "/usr/bin/admintool  = System Administration Tools" >> ../result.xml
echo "/usr/bin/at = 지정된 시간에 실행할 작업을 입력하고, 대기 목록을 확인하고, 제거하는 명령어" >> ../result.xml
echo "/usr/bin/atq = Daemons, 현재 대기중인 작업 목록 확인" >> ../result.xml
echo "/usr/bin/atrm = Daemons, 현재 대기중인 작업제거" >> ../result.xml
echo "/usr/bin/lpset = 프린터와 관련된 장치, 디렉터리를 접근하는 명령어로 EGID 를 변경" >> ../result.xml
echo "/usr/bin/newgrp = 현재 세션의 사용자 그룹 변경(지정한 그룹의 쉘로 환경이 바로 변경)" >> ../result.xml
echo "/usr/bin/nispasswd = RPC DAEMON,NIS+passwd 테이블 패스워드 변경" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"

if [ -e /usr/bin/admintool ]
	then
		if [ `ls -alL /usr/bin/admintool | awk '{print $1}' | grep -i 's' | wc -l ` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /usr/bin/at ]
	then
		if [ `ls -alL /usr/bin/at | awk '{print $1}' | grep -i 's' | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /usr/bin/atq ]
	then
		if [ `ls -alL /usr/bin/atq | awk '{print $1}' | grep -i 's' | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /usr/bin/atrm ]
	then
		if [ `ls -alL /usr/bin/atrm | awk '{print $1}' | grep -i 's' | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /usr/bin/lpset ]
	then
		if [ `ls -alL /usr/bin/lpset | awk '{print $1}' | grep -i 's' | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /usr/bin/newgrp ]
	then
		if [ `ls -alL /usr/bin/newgrp | awk '{print $1}' | grep -i 's' | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi
if [ -e /usr/bin/nispasswd ]
	then
		if [ `ls -alL /usr/bin/nispasswd | awk '{print $1}' | grep -i 's' | wc -l` -ge 1 ]
			then
				flag="False"
		fi
fi


if [ $flag == "False" ]
	then
		echo "[취약] : 주요 실행파일의 권한에 SUID와 SGID에 대한 설정이 부여되어 있는 경우" >> ../result.xml
	else
		echo "[양호] : 주요 실행파일의 권한에 SUID와 SGID에 대한 설정이 부여되어 있지 않은경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-13>" >> ../result.xml
echo "" >> ../result.xml
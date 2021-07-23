 
echo "<U-1>" >> ../result.xml 
echo "<Name> root 계정 원격접속 제한 </Name>"  >> ../result.xml
echo "<Security_Threat>" >> ../result.xml
echo "root 계정은 운영체제의 모든기능을 설정 및 변경이 가능하여^(프로세스, 커" >> ../result.xml 
echo "널변경 등^) root 계정을 탈취하여 외부에서 원격을 이용한 시스템 장악 및" >> ../result.xml
echo "각종 공격으로(무작위 대입 공격) 인한 root 계정 사용 불가 위협" >> ../result.xml 
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/pam.d/login | grep -o -i "pam_securetty.so" | grep -v "# ^*"" >> ../result.xml 
cat /etc/pam.d/login | grep -o -i "pam_securetty.so" | grep -v "# ^*" >> ../result.xml 2>&1
echo "" >> ../result.xml 
echo "#/etc/securetty | grep -i "pts" | grep -v "# ^*"" >> ../result.xml 
cat /etc/securetty | grep -i "pts" | grep -v "# ^*" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#cat /etc/sshd_config | grep -i "PermitRootLogin yes" | grep -v "# ^*"" >> ../result.xml 
if [ -d /etc/sshd_config ]
	then
		cat /etc/sshd_config | grep -i "PermitRootLogin yes" | grep -v "# ^*" >> ../result.xml 2>&1
fi
echo "" >> ../result.xml 
echo "]]> </Data>" >> ../result.xml 
echo "<Comment>" >> ../result.xml 
echo "[양호] : 원격 터미널 서비스를 사용하지 않거나, 사용 시 root 직접 접속을 차단한 경우" >> ../result.xml
echo "[취약] : 원격 터미널 서비스 사용 시 root 직접 접속을 허용한 경우" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"
if [ `cat /etc/pam.d/login | grep -o -i "pam_securetty.so" | grep -v "# ^*" | wc -l` -eq 0 ]
	then 
		flag="False"
fi

if [ `cat /etc/securetty | grep -i "pts" | grep -v "# ^*" | wc -l` -ge 1 ]
	then 
		flag="False"
fi

if [ -d /etc/sshd_config ] 
	then
		if [ `cat /etc/sshd_config | grep -i "PermitRootLogin yes" | grep -v "# ^*" | wc -l` -eq 1 ]
			then
				flag="False"
		fi
fi

if [ $flag == "False" ]
	then
		echo "[취약] : 원격 터미널 서비스 사용 시 root 직접 접속을 허용한 경우" >> ../result.xml 
	else
		echo "[양호] : 원격 터미널 서비스를 사용하지 않거나, 사용 시 root 직접 접속을 차단한 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 2>&1
echo "</U-1>" >> ../result.xml
echo "" >> ../result.xml
 
echo "<U-17>" >> ../result.xml 
echo "<Name> $HOME/.rhosts, hosts.equiv 사용 금지 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo " rlogin, rsh 등과 같은 ‘r’ command의 보안 설정이 적용되지 않은 경우," >> ../result.xml
echo "원격지의 공격자가 관리자 권한으로 목표 시스템상의 임의의 명령을 수행시킬" >> ../result.xml
echo "수 있으며, 명령어 원격 실행을 통해 중요 정보 유출 및 시스템 장애를 유발" >> ../result.xml
echo "시킬 수 있음. 또한 공격자 백도어 등으로도 활용될 수 있음" >> ../result.xml
echo "r-command(rlogin, rsh등) 서비스의 접근통제에 관련된 파일로 권한설정을" >> ../result.xml
echo "미 적용한 경우 r-command 서비스 사용 권한을 임의로 등록하여 무단 사용이 가능함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#ls -l /etc/hosts.equiv" >> ../result.xml
ls -l /etc/hosts.equiv >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#ls -l $HOME/.rhosts" >> ../result.xml
ls -l $HOME/.rhosts >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : login, shell, exec 서비스를 사용하지 않거나, 사용 시 아래와 같은 설정이 적용된 경우" >> ../result.xml
echo "\1. /etc/hosts.equiv 및 \$HOME/.rhosts 파일 소유자가 root 또는, 해당 계" >> ../result.xml
echo "정인 경우" >> ../result.xml
echo "\2. /etc/hosts.equiv 및 \$HOME/.rhosts 파일 권한이 600 이하인 경우" >> ../result.xml
echo "\3. /etc/hosts.equiv 및 \$HOME/.rhosts 파일 설정에 ‘+’ 설정이 없는 경우" >> ../result.xml
echo "[취약] : login, shell, exec 서비스를 사용하고, 위와 같은 설정이 적용되지 않은 경우" >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

flag="True"
if [ -e /etc/hosts.equiv ]
	then
		flag="NA"
		if [ `stat -c %a /etc/hosts.equiv` -gt 600 ] && [ `stat -c %U /etc/hosts.equiv` != "root" ]
			then
				flag="False"
		fi
fi
if [ -e $HOME/.rhosts ]
	then
		flag="NA"
		if [ `stat -c %a $HOME/.rhosts` -gt 600 ] && [ `stat -c %U $HOME/.rhosts` != "root" ]
			then
				flag="False"
		fi
fi

if [ $flag == "NA" ]
	then
		echo "[N/A] : login, shell, exec 서비스를 사용하지 않는 경우" >> ../result.xml
	else 
		if [ $flag == "True" ]
			then
				echo "[양호] : login, shell, exec 서비스를 사용하지 않거나, 사용 시 아래와 같은 설정이 적용된 경우" >> ../result.xml
			else
				echo "[취약] : login, shell, exec 서비스를 사용하고, 위와 같은 설정이 적용되지 않은 경우" >> ../result.xml
		fi
fi
echo "</Result>" >> ../result.xml 
echo "</U-17>" >> ../result.xml
echo "" >> ../result.xml
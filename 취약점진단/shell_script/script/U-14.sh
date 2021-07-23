 
echo "<U-14>" >> ../result.xml 
echo "<Name> 사용자, 시스템 시작파일 및 환경파일 소유자 및 권한 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "홈 디렉터리 내의 사용자 파일 및 사용자별 시스템 시작파일 등과 같은" >> ../result.xml
echo "환경변수 파일의 접근권한 설정이 적절하지 않을 경우 비인가자가 환경변수" >> ../result.xml
echo "파일을 변조하여 정상 사용중인 사용자의 서비스가 제한 될 수 있음" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
flag="True"
PATH_FILE=( ".profile" ".kshrc" ".cshrc" ".bashrc" ".bash_profile" ".login" ".exrc" ".netrc" )
USER=`ls -l /home | awk -F ' ' '{ print $9 }'`
for i in ${USER[*]}
	do 
		echo "#ls -al /home/$i" >> ../result.xml
		ls -al /home/$i | grep -E ".profile|.kshrc|.cshrc|.bashrc|.bash_profile|.login|.exrc|.netrc"  >> ../result.xml 2>&1
	done
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "[양호] : 홈 디렉터리 환경변수 파일 소유자가 root 또는, 해당 계정으로 지정되어 있고," >> ../result.xml
echo "홈 디렉터리 환경변수 파일에 root와 소유자만 쓰기 권한이 부여된 경우" >> ../result.xml
echo "[취약] : 홈 디렉터리 환경변수 파일 소유자가 root 또는, 해당 계정으로 지정되지 않고," >> ../result.xml 
echo "홈 디렉터리 환경변수 파일에 root와 소유자 외에 쓰기 권한이 부여된 경우" >> ../result.xml
echo "*환경변수 파일 종류*" >> ../result.xml
echo " .profile, .kshrc, .cshrc, .bashrc, .bash_profile, .login, .exrc, .netrc 등 " >> ../result.xml
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 

for i in ${USER[*]}
	do
		for j in ${PATH_FILE[*]}
			do
			if [ -e /home/$i/$j ]
				then
				if [ `stat -c %U /home/$i/$j` == $i ] || [ `stat -c %U /home/$i/$j` == "root" ]
					then
						if [ `stat -c %a /home/$i/$j` -gt 400 ]
							then
								flag="False"
						fi
					else
						flag="False"
				fi
				else
					continue
			fi
			done
	done

if [ $flag == "False" ]
	then
		echo "[취약] : 홈 디렉터리 환경변수 파일 소유자가 root 또는, 해당 계정으로 지정되지 않고," >> ../result.xml 
		echo "홈 디렉터리 환경변수 파일에 root와 소유자 외에 쓰기 권한이 부여된 경우" >> ../result.xml
	else
		echo "[양호] : 홈 디렉터리 환경변수 파일 소유자가 root 또는, 해당 계정으로 지정되어 있고," >> ../result.xml
		echo "홈 디렉터리 환경변수 파일에 root와 소유자만 쓰기 권한이 부여된 경우" >> ../result.xml
fi
	
echo "</Result>" >> ../result.xml 
echo "</U-14>" >> ../result.xml
echo "" >> ../result.xml
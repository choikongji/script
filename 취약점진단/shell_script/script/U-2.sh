 

echo "<U-2>" >> ../result.xml
echo "<Name> 패스워드 복잡성 설정 </Name>"  >> ../result.xml
echo "<Security_Threat>" >> ../result.xml
echo " 복잡성 설정이 되어있지 않은 패스워드는 사회공학적인 유추가 가능 할 수" >> ../result.xml
echo "있으며 암호화된 패스워드 해시값을 무작위 대입공격, 사전대입 공격 등으로" >> ../result.xml
echo "단시간에 패스워드 크렉이 가능함 " >> ../result.xml
echo "</Security_Threat>" >> ../result.xml
echo "<Data> <![CDATA[" >> ../result.xml
echo "#cat /etc/security/pwquality.conf | grep -E " >> ../result.xml echo "lcredit|ucredit|dcredit|ocredit|minlen|difok " >> ../result.xml
cat /etc/security/pwquality.conf | grep -E "lcredit|ucredit|dcredit|ocredit|minlen|difok" >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml 
echo "<Comment>" >> ../result.xml 
echo "[양호] : 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우" >> ../result.xml
echo "[취약] : 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우" >> ../result.xml
echo "lcredit=-1 최소 소문자 요구 소문자, 최소 1자 이상 요구" >> ../result.xml
echo "ucredit=-1 최소 대문자 요구, 최소 대문자 1자 이상 요구" >> ../result.xml
echo "dcredit=-1 최소 숫자 요구, 최소 숫자 1자 이상 요구" >> ../result.xml
echo "ocredit=-1 최소 특수문자 요구, 최소 특수문자 1자 이상 요구" >> ../result.xml
echo "minlen=8 최소 패스워드 길이 설정, 최소 8자리 이상 설정" >> ../result.xml
echo "difok=N 기존 패스워드와 비교, 기본값 10(50%))" >> ../result.xml

echo "</Comment>" >> ../result.xml
echo "<Result>" >> ../result.xml
flag="True"

if [ `cat /etc/security/pwquality.conf | grep "lcredit"| grep -v "# ^*" | awk -F '= ' '{print $2}' | wc -l` -eq 0 ] || [ `cat /etc/security/pwquality.conf | grep "lcredit"| grep -v "# ^*" | awk -F '= ' '{print $2}'` -ge 0 ]
	then 
		flag="False"
fi

if [ `cat /etc/security/pwquality.conf | grep "ucredit"| grep -v "# ^*" | awk -F '= ' '{print $2}' | wc -l` -eq 0 ] || [ `cat /etc/security/pwquality.conf | grep "ucredit"| grep -v "# ^*" | awk -F '= ' '{print $2}'` -ge 0 ]
	then 
		flag="False"
fi

if [ `cat /etc/security/pwquality.conf | grep "dcredit"| grep -v "# ^*" | awk -F '= ' '{print $2}' | wc -l` -eq 0 ] || [ `cat /etc/security/pwquality.conf | grep "dcredit"| grep -v "# ^*" | awk -F '= ' '{print $2}'` -ge 0 ]
	then 
		flag="False"
fi

if [ `cat /etc/security/pwquality.conf | grep "ocredit"| grep -v "# ^*" | awk -F '= ' '{print $2}' | wc -l` -eq 0 ] || [ `cat /etc/security/pwquality.conf | grep "ocredit"| grep -v "# ^*" | awk -F '= ' '{print $2}'` -ge 0 ]
	then 
		flag="False"
fi

if [ `cat /etc/security/pwquality.conf | grep "minlen"| grep -v "# ^*" | awk -F '= ' '{print $2}' | wc -l` -eq 0 ] || [ `cat /etc/security/pwquality.conf | grep "minlen"| grep -v "# ^*" | awk -F '= ' '{print $2}'` -lt 8 ]
	then 
		flag="False"
fi

if [ `cat /etc/security/pwquality.conf | grep "difok"| grep -v "# ^*" | awk -F '= ' '{print $2}' | wc -l` -eq 0 ] || [ `cat /etc/security/pwquality.conf | grep "difok"| grep -v "# ^*" | awk -F '= ' '{print $2}'` -le 9 ]
	then 
		flag="False"
fi

if [ $flag == "False" ]
	then
		echo "[취약] : 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우" >> ../result.xml
	else
		echo "[양호] : 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-2>" >> ../result.xml
echo "" >> ../result.xml
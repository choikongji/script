 
echo "<U-6>" >> ../result.xml 
echo "<Name> 파일 및 디렉터리 소유자 설정 </Name>"  >> ../result.xml 
echo "<Security_Threat>" >> ../result.xml 
echo "소유자가 존재하지 않는 파일의 UID와 동일한 값으로 특정계정의 UID값을" >> ../result.xml
echo "변경하면 해당 파일의 소유자가 되어 모든 작업이 가능함" >> ../result.xml
echo "</Security_Threat>" >> ../result.xml 
echo "<Data> <![CDATA[" >> ../result.xml
echo "#find / -nouser -print 2>/dev/nul" >> ../result.xml
find / -nouser -print 2>/dev/nul >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "#find / -nogroup -print 2>/dev/nul" >> ../result.xml
find / -nouser -print 2>/dev/nul >> ../result.xml 2>&1
echo "" >> ../result.xml
echo "]]> </Data>" >> ../result.xml
echo "<Comment>" >> ../result.xml 
echo "</Comment>" >> ../result.xml 
echo "<Result>" >> ../result.xml 
flag="True"
if [ `find / -nouser -print 2>/dev/nul | wc -l` -ge 1  ]
	then
		flag="False"
fi

if [ `find / -nogroup -print 2>/dev/nul | wc -l` -ge 1  ]
	then
		flag="False"
fi

if [ $flag == "True" ]
	then
		echo "[양호] : 소유자가 존재하지 않는 파일 및 디렉터리가 존재하지 않는 경우" >> ../result.xml
	else
		echo "[취약] : 소유자가 존재하지 않는 파일 및 디렉터리가 존재하는 경우" >> ../result.xml
fi

echo "</Result>" >> ../result.xml 
echo "</U-6>" >> ../result.xml
echo "" >> ../result.xml
echo ^<W-41^> >> ../result.xml
echo ^<Name^> 최근 암호 기억 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -최근 암호 기억 정책이 설정되지 않은 경우 특정 계정에 동일한 암호를 >> ../result.xml
echo 오랫동안 사용하는 것이 가능하여 공격자가 무작위 공격을 통해 패스워드 정보 >> ../result.xml
echo 노출 가능성이 커짐 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts find "Length of password history maintained:" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Length of password history maintained:" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 최근 암호 기억이 4개 이상으로 설정되어 있는 경우 >> ../result.xml
echo [취약] : 최근 암호 기억이 4개 미만으로 설정되어 있는 경우 >> ../result.xml
echo [취약] : 최근 암호 기억이 설정되어 있지 않은 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
net accounts | find "Length of password history maintained:" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
if "!b!" EQU "None" (
	echo [취약] : 최근 암호 기억이 설정되어 있지 않은 경우 >> ../result.xml
)else (
	if !b! GEQ 4 (
		echo [양호] : 최근 암호 기억이 4개 이상으로 설정되어 있는 경우 >> ../result.xml
	)else (
		echo [취약] : 최근 암호 기억이 4개 미만으로 설정되어 있는 경우 >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-41^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt 
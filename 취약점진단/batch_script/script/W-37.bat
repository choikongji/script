echo ^<W-37^> >> ../result.xml
echo ^<Name^> 패스워드 최소 사용 기간 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -패스워드 변경 후 최소 사용 기간이 설정되지 않은 경우 사용자에게 익숙한 >> ../result.xml
echo 패스워드로 즉시 변동이 가능하여, 이를 재사용함으로써 원래 암호를 같은 날 >> ../result.xml
echo 다시 사용할 수 있음 >> ../result.xml
echo -패스워드 변경 정책에 따른 주기적인 패스워드 변경이 무의미해 질 수 있으며, >> ../result.xml
echo 이로 인해 조직의 계정 보안성을 낮출 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts find "Minimum password age (days):" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Minimum password age (days):" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 최소 암호 사용 기간이 0보다 큰 값으로 설정되어 있는 경우 >> ../result.xml
echo [취약] : 최소 암호 사용 기간이 0으로 설정되어 있는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net accounts | find "Minimum password age (days):" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
if !b! GEQ 1 (
	echo [양호] : 최소 암호 사용 기간이 0보다 큰 값으로 설정되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : 최소 암호 사용 기간이 0으로 설정되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-37^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
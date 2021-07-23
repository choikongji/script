echo ^<W-33^> >> ../result.xml
echo ^<Name^> 계정 잠금 기간 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -로그인 실패 시 일정 시간 동안 계정 잠금을 하지 않은 경우, 공격자의 자동화된 >> ../result.xml
echo 암호 추측 공격이 가능하여, 사용자 계정의 패스워드 정보가 유출될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts ^| find /i "Lockout threshold:" >> ../result.xml
echo. >> ../result.xml
echo net accounts | find /i "Lockout threshold:"
echo. >> ../result.xml
echo #net accounts ^| find "Lockout duration (minutes)" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Lockout duration (minutes):" >> ../result.xml
echo. >> ../result.xml
echo #net accounts ^| find "Lockout observation window (minutes):" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Lockout observation window (minutes):" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml


echo ^<Comment^> >> ../result.xml
echo [양호] : 양호 : “계정 잠금 기간” 및 “계정 잠금 기간 원래대로 설정 기간”이 설정되어있는 경^(60분 이상의 값으로 설정하기를 권고함^) >> ../result.xml
echo [취약] : 취약 : “계정 잠금 기간” 및 “잠금 기간 원래대로 설정 기간”이 설정되지 않은 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net accounts | find /i "Lockout threshold:" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
net accounts | find "Lockout duration (minutes):" > test1.txt
for /f "tokens=2 delims=:" %%a in (test1.txt) do (
	for %%b in (%%a) do (
		set c=%%b
	)
)
net accounts | find "Lockout observation window (minutes):" > test2.txt
for /f "tokens=2 delims=:" %%a in (test2.txt) do (
	for %%b in (%%a) do (
		set d=%%b
	)
)
if "!b!" EQU "Never" (
	echo [취약] : "계정 잠금 임계값"이 설정되어 있지 않은 경우 >> ../result.xml
	goto END
)else (
	if "!c!" GEQ "60" (
		if "!d!" GEQ "60" (
			echo [양호] : 양호 : “계정 잠금 기간” 및 “계정 잠금 기간 원래대로 설정 기간”이 설정되어있는 경^(60분 이상의 값으로 설정하기를 권고함^) >> ../result.xml
		)else (
			echo [취약] : 취약 : “계정 잠금 기간” 및 “잠금 기간 원래대로 설정 기간”이 설정되지 않은 경우 >> ../result.xml
		)
	)else (
		echo [취약] : 취약 : “계정 잠금 기간” 및 “잠금 기간 원래대로 설정 기간”이 설정되지 않은 경우 >> ../result.xml
	)
)
:END
echo ^</Result^> >> ../result.xml
echo ^</W-33^> >> ../result.xml
echo. >> ../result.xml
if exist test*.txt del test*.txt
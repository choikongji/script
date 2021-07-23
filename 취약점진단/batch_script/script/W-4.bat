echo ^<W-4^> >> ../result.xml
echo ^<Name^> 계정 잠금 임계값 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -공격자는 시스템의 계정 잠금 임계값이 설정되지 않은 경우 자동화된 방법 >> ../result.xml
echo 을 이용하여 모든 사용자 계정에 대해 암호조합 공격을 자유롭게 시도할 수 >> ../result.xml
echo 있으므로 사용자 계정 정보의 노출 위험이 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts ^| find /i "Lockout threshold" >> ../result.xml
echo. >> ../result.xml
net accounts | find /i "Lockout threshold" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : 계정 잠금 임계값이 5 이하의 값으로 설정되어 있는 경우 >> ../result.xml
echo [취약] : 계정 잠금 임계값이 6 이상의 값으로 설정되어 있는 경우 >> ../result.xml
echo [취약] : 계정 잠금 임계값이 설정되어 있지 않은 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml

net accounts | find /i "Lockout threshold" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
if not "!b!" EQU "Never" (
	if !b! LEQ 5 (
		echo [양호] : 계정 잠금 임계값이 5 이하의 값으로 설정되어 있는 경우 >> ../result.xml
	)else (
		echo [취약] : 계정 잠금 임계값이 6 이상의 값으로 설정되어 있는 경우 >> ../result.xml
	)
)else (
	echo [취약] : 계정 잠금 임계값이 설정되어 있지 않은 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-4^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt

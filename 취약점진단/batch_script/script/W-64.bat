echo ^<W-64^> >> ../result.xml
echo ^<Name^> 컴퓨터 계정 암호 최대 사용 기간 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -기본적으로 도메인 구성원은 도메인 암호 변경 주기가 적절하지 않은 경우 >> ../result.xml
echo 공격자가 무단 공격을 실행하여 하나 이상의 컴퓨터 계정 암호를 추측하기에 >> ../result.xml
echo 충분한 시간을 제공할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "DisablePasswordChange" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "DisablePasswordChange" | find "DisablePasswordChange" >> ../result.xml
echo #reg query "MaximumPasswordAge" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "MaximumPasswordAge" | find "MaximumPasswordAge" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : "컴퓨터 계정 암호 변경 사용 안 함" 정책을 사용하지 않으며, "컴퓨터 계정 암호 최대 사용 기간" 정책이 "90일"로 설정되어 있는 경우 >> ../result.xml
echo [취약] : "컴퓨터 계정 암호 변경 사용 안 함" 정책이 “사용”으로 설정되어 있거나 "컴퓨터 계정 암호 최대 사용 기간" 정책이 “90일” 로 설정되어 있지않은 경우 >> ../result.xml
echo DisablePasswordChange 0x0 = 사용 안함 >> ../result.xml
echo DisablePasswordChange 0x1 = 사용 >> ../result.xml
echo MaximumPasswordAge 기간 >> ../result.xml
echo ^</Comment^> >> ../result.xml

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "MaximumPasswordAge" | find "MaximumPasswordAge" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "DisablePasswordChange" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	if !b! LEQ 0x5a (
		if !b! GTR 0x0 (
			echo [양호] : "컴퓨터 계정 암호 변경 사용 안 함" 정책을 사용하지 않으며, "컴퓨터 계정 암호 최대 사용 기간" 정책이 "90일"로 설정되어 있는 경우 >> ../result.xml
		)else (
			echo [취약] : "컴퓨터 계정 암호 최대 사용 기간" 정책이 “90일” 로 설정되어 있지않은 경우 >> ../result.xml
		)
	)else (
		echo [취약] : "컴퓨터 계정 암호 최대 사용 기간" 정책이 “90일” 을 초과한 경우 >> ../result.xml
	)
)else (
	echo [취약] : "컴퓨터 계정 암호 변경 사용 안 함" 정책이 “사용”으로 설정되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-64^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt

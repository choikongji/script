echo ^<W-51^> >> ../result.xml
echo ^<Name^> 원격터미널 접속 타임아웃 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -접속 타임아웃 값이 설정되지 않은 경우 유휴 시간 내 비인가자의 시스템 >> ../result.xml
echo 접근으로 인해 불필요한 내부 정보의 노출 위험이 존재함 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "Remote Desktop Services" >> ../result.xml
net start | find "Remote Desktop Services" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /s | find "MaxIdleTime" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 원격제어 시 Timeout 제어 설정을 적용한 경우 >> ../result.xml
echo [취약] : 원격제어 시 Timeout 제어 설정을 적용하지 않은 경우 >> ../result.xml
echo MaxIdleTime 0xea60 = 1분 >> ../result.xml
echo MaxIdleTime 0x493e0 = 5분 >> ../result.xml
echo MaxIdleTime 0x927c0 = 10분 >> ../result.xml
echo MaxIdleTime 0xdbba0 = 15분 >> ../result.xml
echo MaxIdleTime 0x1b7740 = 30분 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net start | find "Remote Desktop Services" > nul
if !ERRORLEVEL! EQU 1 (
	echo [양호] : 원격제어 서비스를 사용 안함 >> ../result.xml
	goto END
)
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /s | find "MaxIdleTime" > test.txt
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /s | find "MaxIdleTime" > nul
if !ERRORLEVEL! EQU 1 (
	echo [취약] : 레지스트리가 구성이 안되어 있을 경우 >> ../result.xml
	goto END
)
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /s | find "MaxIdleTime"> nul
if !ERRORLEVEL! EQU 0 (
	if !b! LEQ 0x1b7740 (
		if !b! GTR 0x0 (
			echo [양호] : 원격제어 시 Timeout 제어 설정을 적용한 경우 >> ../result.xml
		)else (
			echo [취약] : 원격제어 시 Timeout 제어 설정을 적용하지 않은 경우 >> ../result.xml
		)
	)else (
		echo [취약] 원격제어 시 Timeout 제어 설정을 30분을 초과한 적용한 경우 >> ../result.xml
	)
)else (
	echo [양호] : Remote Desktop Services를 사용하지 않은 경우 >> ../result.xml
)
:END
echo ^</Result^> >> ../result.xml
echo ^</W-51^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
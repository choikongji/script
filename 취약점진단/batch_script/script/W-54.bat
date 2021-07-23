echo ^<W-54^> >> ../result.xml
echo ^<Name^> 이벤트 로그 관리 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo 이벤트 로그 파일의 크기가 충분하지 않을 경우 중요 로그가 저장되지 않을 >> ../result.xml
echo 위험이 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml 
echo ##최대 로그 크기 >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "MaxSize" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "MaxSize" >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "MaxSize" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "MaxSize" >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "MaxSize" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "MaxSize" >> ../result.xml
echo. >> ../result.xml

echo ##최대 이벤트 로그 크기에 도달할 때 >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "Retention" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "Retention" | find "0xffffffff" >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "Retention" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "Retention" | find "0xffffffff" >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "Retention" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "Retention" | find "0xffffffff" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 최대 로그 크기 “10,240KB 이상”으로 설정, 로그가 꽉 차면 로그 보관,이벤트를 덮어쓰지않음 OR 이벤트 덮어쓰지 않음^(수동으로 로그 지우기^)  >> ../result.xml
echo [취약] : 최대 로그 크기 “10,240KB 미만”으로 설정, 이벤트 덮어씀 기간이 “90일 이하”로 설정된 경우  >> ../result.xml
echo Application = 응용 프로그램, Security = 보안, System = 시스템 >> ../result.xml
echo MaxSize가 0xa00000 이상이여야 양호 >> ../result.xml
echo Retention 0x0 = 필요한 경우 이벤트 덮어쓰기^(가장 오래된 이벤트 먼저^) >> ../result.xml
echo Retention 0xffffffff = 로그가 꽉 차면 로그 보관, 이벤트를 덮어쓰지 않음 OR 이벤트 덮어쓰지 않음^(수동으로 로그 지우기^) >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

set flag=False

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "MaxSize" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "Retention" | find "0xffffffff" > nul
if !ERRORLEVEL! EQU 1 (
	echo [취약] : 최대 로그 크기 “10,240KB 미만”으로 설정, 이벤트 덮어씀 기간이 “90일 이하”로 설정된 경우 >> ../result.xml
	goto end
)else (
	if !b! GEQ 0xa00000 (
		set flag=True
	)
)

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "MaxSize" > test1.txt
for /f "tokens=3 delims= " %%a in (test1.txt) do (
	for %%b in (%%a) do (
		set c=%%b
	)
)

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "Retention" | find "0xffffffff" > nul
if !ERRORLEVEL! EQU 1 (
	echo [취약] : 최대 로그 크기 “10,240KB 미만”으로 설정, 이벤트 덮어씀 기간이 “90일 이하”로 설정된 경우 >> ../result.xml
	goto end
)else (
	if !b! GEQ 0xa00000 (
		set flag=True
	)
)



reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "MaxSize" > test2.txt
for /f "tokens=3 delims= " %%a in (test2.txt) do (
	for %%b in (%%a) do (
		set d=%%b
	)
)

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "Retention" | find "0xffffffff" > nul
if !ERRORLEVEL! EQU 1 (
	echo [취약] : 최대 로그 크기 “10,240KB 미만”으로 설정, 이벤트 덮어씀 기간이 “90일 이하”로 설정된 경우 >> ../result.xml
	goto end
)else (
	if !b! GEQ 0xa00000 (
		set flag=True
	)
)

if "!flag!" EQU "True" (
	echo [양호] : 최대 로그 크기 “10,240KB 이상”으로 설정, 로그가 꽉 차면 로그 보관,이벤트를 덮어쓰지않음 OR 이벤트 덮어쓰지 않음^(수동으로 로그 지우기^)  >> ../result.xml
)else (
	echo [취약] : 최대 로그 크기 “10,240KB 미만”으로 설정, 이벤트 덮어씀 기간이 “90일 이하”로 설정된 경우 >> ../result.xml
)

:end
echo ^</Result^> >> ../result.xml
echo ^</W-54^> >> ../result.xml
echo. 
if exist test*.txt del test*.txt
echo ^<W-56^> >> ../result.xml
echo ^<Name^> DoS 공격 방어 레지스트리 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo DoS 방어 레지스트리를 설정하지 않은 경우, DoS 공격에 의한 시스템 다운 >> ../result.xml
echo 으로 서비스 제공이 중단될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s ^| find /i "SynAttackProtect" >> ../result.xml
reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "SynAttackProtect" >> ../result.xml
echo. >> ../result.xml
echo #reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s ^| find /i "EnableDeadGWDetect" >> ../result.xml
reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "EnableDeadGWDetect" >> ../result.xml
echo. >> ../result.xml
echo #reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s ^| find /i "KeepAliveTime" >> ../result.xml
reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "KeepAliveTime" >> ../result.xml
echo. >> ../result.xml
echo #reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s ^| find /i "NoNameReleaseOnDemand" >> ../result.xml
reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "NoNameReleaseOnDemand" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : DoS 방어 레지스트리 값이 아래와 같이 설정되어 있는 경우 >> ../result.xml
echo [취약] : DoS 방어 레지스트리 값이 아래와 같이 설정되어 있지 않은 경우 >> ../result.xml
echo ? SynAttackProtect = REG_DWORD 0(False) - 1 이상 >> ../result.xml
echo ? EnableDeadGWDetect = REG_DWORD 1(True) - 0 >> ../result.xml
echo ? KeepAliveTime = REG_DWORD 7,200,000(2시간) - 300,000(5분) >> ../result.xml
echo ? NoNameReleaseOnDemand = REG_DWORD 0(False) - 1 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
set flag=True
reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "SynAttackProtect" > nul
if !ERRORLEVEL! EQU 0 (
	reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "SynAttackProtect" | find "0x0"
	if !ERRORLEVEL! EQU 0 (
		set flag=False
	)
)else (
	set flag=False
)
reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "EnableDeadGWDetect" > nul
if !ERRORLEVEL! EQU 0 (
	reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "EnableDeadGWDetect" | find "0x0"
	if !ERRORLEVEL! EQU 1 (
		set flag=False
	)
)else (
	set flag=False
)
reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "KeepAliveTime" > nul
if !ERRORLEVEL! EQU 0 (
	reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "KeepAliveTime" | find "0x0"
	if !ERRORLEVEL! EQU 0 (
		set flag=False
	)
)else (
	set flag=False
)
reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "NoNameReleaseOnDemand" > nul
if !ERRORLEVEL! EQU 0 (
	reg query HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ /s | find /i "NoNameReleaseOnDemand" | find "0x0"
	if !ERRORLEVEL! EQU 0 (
		set flag=False
	)
)else (
	set flag=False
)

if "!flag!" EQU "False" (
	echo [취약] : DoS 방어 레지스트리 값이 아래와 같이 설정되어 있지 않은 경우 >> ../result.xml	
)else (
	echo [양호] : DoS 방어 레지스트리 값이 아래와 같이 설정되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-56^> >> ../result.xml
echo. >> ../result.xml
echo ^<W-56^> >> ../result.xml
echo ^<Name^> DoS ���� ��� ������Ʈ�� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo DoS ��� ������Ʈ���� �������� ���� ���, DoS ���ݿ� ���� �ý��� �ٿ� >> ../result.xml
echo ���� ���� ������ �ߴܵ� �� ���� >> ../result.xml
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
echo [��ȣ] : DoS ��� ������Ʈ�� ���� �Ʒ��� ���� �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : DoS ��� ������Ʈ�� ���� �Ʒ��� ���� �����Ǿ� ���� ���� ��� >> ../result.xml
echo ? SynAttackProtect = REG_DWORD 0(False) - 1 �̻� >> ../result.xml
echo ? EnableDeadGWDetect = REG_DWORD 1(True) - 0 >> ../result.xml
echo ? KeepAliveTime = REG_DWORD 7,200,000(2�ð�) - 300,000(5��) >> ../result.xml
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
	echo [���] : DoS ��� ������Ʈ�� ���� �Ʒ��� ���� �����Ǿ� ���� ���� ��� >> ../result.xml	
)else (
	echo [��ȣ] : DoS ��� ������Ʈ�� ���� �Ʒ��� ���� �����Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-56^> >> ../result.xml
echo. >> ../result.xml
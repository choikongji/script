echo ^<W-51^> >> ../result.xml
echo ^<Name^> �����͹̳� ���� Ÿ�Ӿƿ� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���� Ÿ�Ӿƿ� ���� �������� ���� ��� ���� �ð� �� ���ΰ����� �ý��� >> ../result.xml
echo �������� ���� ���ʿ��� ���� ������ ���� ������ ������ >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "Remote Desktop Services" >> ../result.xml
net start | find "Remote Desktop Services" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /s | find "MaxIdleTime" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �������� �� Timeout ���� ������ ������ ��� >> ../result.xml
echo [���] : �������� �� Timeout ���� ������ �������� ���� ��� >> ../result.xml
echo MaxIdleTime 0xea60 = 1�� >> ../result.xml
echo MaxIdleTime 0x493e0 = 5�� >> ../result.xml
echo MaxIdleTime 0x927c0 = 10�� >> ../result.xml
echo MaxIdleTime 0xdbba0 = 15�� >> ../result.xml
echo MaxIdleTime 0x1b7740 = 30�� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net start | find "Remote Desktop Services" > nul
if !ERRORLEVEL! EQU 1 (
	echo [��ȣ] : �������� ���񽺸� ��� ���� >> ../result.xml
	goto END
)
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /s | find "MaxIdleTime" > test.txt
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /s | find "MaxIdleTime" > nul
if !ERRORLEVEL! EQU 1 (
	echo [���] : ������Ʈ���� ������ �ȵǾ� ���� ��� >> ../result.xml
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
			echo [��ȣ] : �������� �� Timeout ���� ������ ������ ��� >> ../result.xml
		)else (
			echo [���] : �������� �� Timeout ���� ������ �������� ���� ��� >> ../result.xml
		)
	)else (
		echo [���] �������� �� Timeout ���� ������ 30���� �ʰ��� ������ ��� >> ../result.xml
	)
)else (
	echo [��ȣ] : Remote Desktop Services�� ������� ���� ��� >> ../result.xml
)
:END
echo ^</Result^> >> ../result.xml
echo ^</W-51^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
REM setlocal enabledelayedexpansion
echo ^<W-16^> >> ../result.xml
echo ^<Name^> DNS Zone Transfer ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -DNS Zone Transfer ���� ������ ������� ���� ��� DNS ������ ����Ǿ� >> ../result.xml
echo �ִ� ������ ������ ���ε� DNS ������ �ƴ� �ܺη� ���� ���� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start | find "DNS Server" >> ../result.xml
net start | find "DNS Server" >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s ^| findstr /i "SecureSecondaries" >> ../result.xml
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find /i "SecureSecondaries" > nul
if !ERRORLEVEL! EQU 0 (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find /i "SecureSecondaries" >> ../result.xml
)
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : : �Ʒ� ���ؿ� �ش�� ��� >> ../result.xml
echo 1. DNS ���񽺸� ��� �ʴ� ��� >> ../result.xml
echo 2. ���� ���� ����� ���� �ʴ� ��� >> ../result.xml
echo 3. Ư�� �����θ� ������ �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �� 3�� ���� �� �ϳ��� �ش� ���� �ʴ� ��� >> ../result.xml
echo DatabaseFile = zone �̸� >> ../result.xml
echo SecureSecondaries = DNS Zone Transfer �������� ���� >> ../result.xml
echo SecureSecondaries = 0 ��û�ϴ� ��� secondary server(���� ����)�� zone transfer ���� >> ../result.xml
echo SecureSecondaries = 1 zone�� ���Ͽ� ������ �ִ� name server�θ� ���� >> ../result.xml
echo SecureSecondaries = 2 Ư�� �����θ� zone transfer ���� >> ../result.xml
echo SecureSecondaries = 3 zone transfer �������� ���� >> ../result.xml
echo SecureSecondaries 0,1�̸� ��� 2�̸� ��ȣ >> ../result.xml
echo SecondaryServers = ���������� ���� ���� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

net start | find /i "DNS Server" > nul
if not !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : DNS ���񽺸� ������� �ʴ� ��� >> ../result.xml
) else (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | findstr /i "SecureSecondaries" | findstr /i "0x2 0x3" > nul
	if !ERRORLEVEL! EQU 0 (
		echo [��ȣ] : : �Ʒ� ���ؿ� �ش�� ��� >> ../result.xml
		echo 1. DNS ���񽺸� ��� �ʴ� ��� >> ../result.xml
		echo 2. ���� ���� ����� ���� �ʴ� ��� >> ../result.xml
		echo 3. Ư�� �����θ� ������ �Ǿ� �ִ� ��� >> ../result.xml
	) else (
		echo [���] : �� 3�� ���� �� �ϳ��� �ش� ���� �ʴ� ��� >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-16^> >> ../result.xml
echo. >> ../result.xml
REM endlocal
echo ^<W-47^> >> ../result.xml
echo ^<Name^> SNMP Access control ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo SNMP Access control ������ �������� �ʾ� �������� ���� ���� �����κ� >> ../result.xml
echo ���� SNMP Ʈ������ �������� ���� ���, ��ġ ���� ����, ����� ���̺� >> ../result.xml
echo ����, �������� TFTP ���� ���� ���� SNMP ���ݿ� ����� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo # net start ^| find "SNMP Service" >>  ../result.xml
net start | find "SNMP Service" >>  ../result.xml
echo. >>  ../result.xml
echo #reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" > nul
if !ERRORLEVEL! EQU 0 (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" >> ../result.xml
)
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : Ư�� ȣ��Ʈ�κ��� SNMP ��Ŷ �޾Ƶ��̱�� �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ��� ȣ��Ʈ�κ��� SNMP ��Ŷ �޾Ƶ��̱�� �����Ǿ� �ִ� ��� >> ../result.xml
echo [N/A] : SMTP ���񽺸� ������� �ʴ� ��� >> ../result.xml
echo *PermittedManagers = ���� Ʈ�� ������ �� ���� ȣ��Ʈ�κ��� SNMP ��Ŷ �޾Ƶ��̱� >> ../result.xml
echo *PermittedManagers �׸� localhost�� ����� ��ȣ, host name, IP�� ��ϵǾ� �ִٸ� �Ǵ� �� ���� >>  ../result.xml
echo *PermittedManagers ���� ������ ��� >>  ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
REM setlocal enabledelayedexpansion
net start | find "SNMP Service" > nul
if !ERRORLEVEL! EQU 1 (
	echo [N/A] : SMTP ���񽺸� ������� �ʴ� ��� >> ../result.xml
) else (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" | findstr /i "REG_SZ" > nul
	if !ERRORLEVEL! EQU 0 ( 
		echo [���ͺ�] �ش� ȣ��Ʈ �� IP�� � �ý������� Ȯ�� >> ../result.xml
	) else (
		echo [���] : ��� ȣ��Ʈ�κ��� SNMP ��Ŷ �޾Ƶ��̱�� �����Ǿ� �ִ� ��� >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-47^> >> ../result.xml
echo. >> ../result.xml
REM endlocal
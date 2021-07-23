echo ^<W-46^> >> ../result.xml
echo ^<Name^> SNMP ���� Ŀ�´�Ƽ��Ʈ���� ���⼺ ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Community String ������ �������� �ʰ� public, private �� Default ���� >> ../result.xml
echo ������ ����ϴ� ���, �⺻ String ���� ���� �ý����� �ֿ� ���� �� ���� >> ../result.xml
echo ������ ���ΰ��� ���� ������ ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "SNMP Service" >> ../result.xml
net start | find "SNMP Service" >> ../result.xml
echo #reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /s ^| find /v "Listing" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /s | find /v "Listing" > nul
if !ERRORLEVEL! EQU 0 (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /s | find /v "Listing" >> ../result.xml
)
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [N/A] SNMP ���񽺸� ������� �ʴ� ��� >> ../result.xml
echo [��ȣ] : SNMP ���񽺸� ������� �ʰų� Community String�� public, private�� �ƴ� ��� >> ../result.xml
echo [���] : SNMP ���񽺸� ����ϸ�, Community String�� public, private�� ��� >> ../result.xml
echo *public, private = 1(1) ^(�Ӽ� ����^) >> ../result.xml
echo *public, private = 2(2) ^(�˸� �ۼ�^) >> ../result.xml
echo *public, private = 4(4) ^(�б����� �Ӽ�^) >> ../result.xml
echo *public, private = 8(8) ^(�б�,���� ���� �Ӽ�^) >> ../result.xml
echo *public, private = 10(16) ^(�б�,����� ���� �Ӽ�^) >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

REM setlocal enabledelayedexpansion
net start | find "SNMP Service" > nul
if !ERRORLEVEL! EQU 1 (
	echo [N/A] SNMP ���񽺸� ������� �����Ƿ� �ش���� >>../result.xml
) else (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /s | findstr /i "public private"
	if !ERRORLEVEL! EQU 1 ( 
		echo [��ȣ] : SNMP ���񽺸� ������� �ʰų� Community String�� public, private�� �ƴ� ��� >> ../result.xml
	) else (
		echo [���] : SNMP ���񽺸� ����ϸ�, Community String�� public, private�� ��� >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-46^> >> ../result.xml
echo. >> ../result.xml
REM endlocal
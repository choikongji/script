echo ^<W-43^> >> ../result.xml
echo ^<Name^> �����͹̳� ���� ������ ����� �׷� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�����͹̳��� �׷��̳� ������ �������� ������ ������ ����ڰ� �������� >> ../result.xml
echo �����Ͽ� �ش� ������ ������ �����ϰų� ������ ����� ���ɼ��� �����Ƿ� >> ../result.xml
echo ����� �׷�� ������ �����Ͽ� ������ �����Ͽ��� �� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
whoami /groups >> ../result.xml
net localgroup "Administrators" >> ../result.xml
net localgroup "Remote Desktop Users" >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" | find /i "fDenyTSConnections" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ^(������ ������ ������^) ���������� ������ ������ �����Ͽ� Ÿ ������� >> ../result.xml
echo ���������� �����ϰ�, �������� ����� �׷쿡 ���ʿ��� ������ >> ../result.xml
echo ��ϵǾ� ���� ���� ��� >> ../result.xml
echo [���] : ^(������ ������ ������^) ���������� ������ ������ ������ �������� �ʴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" | find /i "fDenyTSConnections" | find /i "0x1" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : ���� ����ũ�� ���񽺰� ��Ȱ��ȭ�Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���ͺ�] : �������� ����� �׷� �� ������ ������ ������ ���� �� �ݵ�� �ʿ��� ������ ��ϵǾ� �ִ��� Ȯ�� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-43^> >> ../result.xml
echo. >> ../result.xml
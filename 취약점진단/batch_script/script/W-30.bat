echo ^<W-30^> >> ../result.xml
echo ^<Name^> �̵��� �̵�� ���� �� ������ ��� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -������ �̿� ����ڿ��� �ش� ��å�� ������ ��� ���ΰ��ڿ� ���� �ҹ����� >> ../result.xml
echo ��ü ó���� ����� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "AllocateDASD" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrator���� �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ���̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrator���� �Ǿ� ���� ���� ��� >> ../result.xml
echo llocateDASD    REG_SZ    0 = Administrator >> ../result.xml
echo llocateDASD    REG_SZ    1 = Administrator �� Power Users >> ../result.xml
echo llocateDASD    REG_SZ    2 = Administrator �� Interactive Users >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" | find "0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : ���̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrator���� �Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : ���̵��� �̵�� ���� �� ������ ��롱 ��å�� ��Administrator���� �Ǿ� ���� ���� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-30^> >> ../result.xml
echo. >> ../result.xml
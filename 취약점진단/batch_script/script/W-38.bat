echo ^<W-38^> >> ../result.xml
echo ^<Name^> ������ ����� �̸� ǥ�� �� �� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���������� �α׿��� ������� �̸��� �α׿� ��ȭ ���ڿ� ǥ�õ� ��� >> ../result.xml
echo �����ڴ� �̸� ȹ���Ͽ� ��ȣ�� �����ϰų� ������ ������ �õ��� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo reg query "dontdisplaylastusername" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "dontdisplaylastusername" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [���] : �������� ����� �̸� ǥ�� �� �ԡ��� ����� �� �ԡ����� �����Ǿ� �ִ� ��� >> ../result.xml
echo [��ȣ] : �������� ����� �̸� ǥ�� �� �ԡ��� ����롱���� �����Ǿ� �ִ� ��� >> ../result.xml
echo dontdisplaylastusername = 0x0 ��� ���� >> ../result.xml
echo dontdisplaylastusername = 0x1 ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "dontdisplaylastusername" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : �������� ����� �̸� ǥ�� �� �ԡ��� ����� �� �ԡ����� �����Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [��ȣ] : �������� ����� �̸� ǥ�� �� �ԡ��� ����롱���� �����Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-38^> >> ../result.xml
echo. >> ../result.xml
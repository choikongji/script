
echo ^<W-7^> >> ../result.xml
echo ^<Name^> ���� ���� �� ����� �׷� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Everyone�� ���������� ���ԵǾ� ������ �͸� ������� ������ �����Ͽ� >> ../result.xml
echo ���� ���� ���� �� �Ǽ��ڵ��� ���� ����� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net share >> ../result.xml
echo. >> ../result.xml
net share >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �Ϲ� ���� ���丮�� ���ų� ���� ���丮 ���� ���ѿ� Everyone ������ ���� ��� >> ../result.xml
echo [���] : �Ϲ� ���� ���丮�� ���� ���ѿ� Everyone ������ �ִ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml

set flag=True
powershell -command "Get-SmbShare | Select-Object Path" | findstr -v "Path --" > test.txt
for /f "tokens=*" %%a in (test.txt) do (
	set a=%%a
	icacls "!a!" | find /i "Everyone" > nul
	if !ERRORLEVEL! EQU 0 (
		set flag=False
	)
)

if "!flag!" EQU "False" (
	echo [���] : �Ϲ� ���� ���丮�� ���� ���ѿ� Everyone ������ �ִ� ��� >> ../result.xml
)else (
	echo [��ȣ] : �Ϲ� ���� ���丮�� ���ų� ���� ���丮 ���� ���ѿ� Everyone ������ ���� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-7^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
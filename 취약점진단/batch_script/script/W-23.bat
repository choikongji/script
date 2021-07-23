echo ^<W-23^> >> ../result.xml
echo ^<Name^> SAM ���� ���� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -SAM ������ ����� ��� �н����� ���� �õ��� ���� ���� �� �н����� �����ͺ��̽� ������ Ż��� ��� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net localgroup Administrators >> ../result.xml
echo. >> ../result.xml
net localgroup Administrators >> ../result.xml
echo #icacls !systemroot!\system32\config\SAM >> ../result.xml
echo. >> ../result.xml
icacls !systemroot!\system32\config\SAM | findstr /v /i "Administrators: System:" > test1.txt
type test1.txt >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : SAM ���� ���ٱ��ѿ� Administrator, System �׷츸 ��� �������� >> ../result.xml
echo �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : SAM ���� ���ٱ��ѿ� Administrator, System �׷� �� �ٸ� �׷쿡 ������ >> ../result.xml
echo �����Ǿ� �ִ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net localgroup Administrators > test.txt
set flag=True
for /f "tokens=2 delims=\:" %%a in (test1.txt) do (
	type test.txt | findstr /X "%%a" > nul
	if !ERRORLEVEL! EQU 1 (
		set flag=false
	)
)
if "!flag!" EQU "True" (
	echo [��ȣ] : SAM ���� ���ٱ��ѿ� Administrator, System �׷츸 ��� �������� >> ../result.xml
	echo �����Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : SAM ���� ���ٱ��ѿ� Administrator, System �׷� �� �ٸ� �׷쿡 ������ >> ../result.xml
	echo �����Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-23^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
if exist test1.txt del test1.txt
echo ^<W-19^> >> ../result.xml
echo ^<Name^> ��� ���α׷� ������Ʈ ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo - ����� ������, �ֱ������� ������Ʈ ���� ���� ��� ��ӵǴ� ���� ���̷����� >> ../result.xml
echo �������� ���� �ý��� ������ ����� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #��� ���α׷� ������Ʈ >> ../result.xml
powershell "get-ciminstance -namespace root/securitycenter2 -classname antivirusproduct | out-string -stream | select-string "productstate" | out-file -append -encoding ascii "test.txt"
type test.txt >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���̷��� ��� ���α׷��� �ֽ� ���� ������Ʈ�� ��ġ�Ǿ� �ְų�, �� �ݸ� >> ../result.xml
echo ȯ���� ��� ��� ������Ʈ�� ���� ���� �� ���� ����� ������ ��� >> ../result.xml
echo [���] : ���̷��� ��� ���α׷��� �ֽ� ���� ������Ʈ�� ��ġ�Ǿ� ���� �ʰų�, >> ../result.xml
echo �� �ݸ� ȯ���� ��� ��� ������Ʈ�� ���� ���� �� ���� ����� �������� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

for /f "tokens=2 delims=:" %%i in (test.txt) do (
	echo %%i >> test1.txt
)

for /f "delims=:" %%a in (test1.txt) do (
	powershell -NoProfile -ExecutionPolicy Bypass -File "W-19.ps1" "%%a" > nul
)

set i=0
set flag=false
for /f "delims=:" %%a in (update.txt) do (
	set /A i+=1
	if "%%a" EQU "Y" (
		set flag=True
	)
)
if "!flag!" EQU "True" (
	echo [��ȣ] : ���̷��� ��� ���α׷��� �ֽ� ���� ������Ʈ�� ��ġ�Ǿ� �ְų�, �� �ݸ� >> ../result.xml
	echo ȯ���� ��� ��� ������Ʈ�� ���� ���� �� ���� ����� ������ ��� >> ../result.xml
)else (
	echo [���] : ���̷��� ��� ���α׷��� �ֽ� ���� ������Ʈ�� ��ġ�Ǿ� ���� �ʰų�, >> ../result.xml
	echo �� �ݸ� ȯ���� ��� ��� ������Ʈ�� ���� ���� �� ���� ����� �������� ���� ��� >> ../result.xml
)

echo ^</Result^> >> ../result.xml
echo ^</W-19^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
if exist test1.txt del test1.txt
if exist update.txt del update.txt
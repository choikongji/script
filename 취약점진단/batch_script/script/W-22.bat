echo ^<W-22^> >> ../result.xml
echo ^<Name^> ��� ���α׷� ��ġ ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo ��� ���α׷��� ��ġ���� ���� ��� ��, Ʈ���̸� ���� �Ǽ� ���̷����� >> ../result.xml
echo ���� �ý��� ���� ������ ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #��ġ�� ��� ���α׷� ����Ʈ >> ../result.xml
echo. >> ../result.xml
powershell -NoProfile -ExecutionPolicy Bypass -File "W-22.ps1" > nul
type test.txt >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���̷��� ��� ���α׷��� ��ġ�Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ���̷��� ��� ���α׷��� ��ġ�Ǿ� ���� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

if exist test.txt (
	set i=0
	for /f "delims=:" %%a in (test.txt) do (
	set /A i+=1
	set name^<!i!^>=%%a
	) 
) else (
	echo [���] : ���̷��� ��� ���α׷��� �ֽ� ���� ������Ʈ�� ��ġ�Ǿ� ���� �ʰų�, >> ../result.xml
	echo �� �ݸ� ȯ���� ��� ��� ������Ʈ�� ���� ���� �� ���� ����� �������� ���� ��� >> ../result.xml
	goto end
)

echo [��ȣ] : ���̷��� ��� ���α׷��� �ֽ� ���� ������Ʈ�� ��ġ�Ǿ� �ְų�, �� �ݸ� >> ../result.xml
echo ȯ���� ��� ��� ������Ʈ�� ���� ���� �� ���� ����� ������ ��� >> ../result.xml

:end
echo ^</Result^> >> ../result.xml
echo ^</W-22^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
echo ^<W-60^> >> ../result.xml
echo ^<Name^> ����ں� Ȩ ���丮 ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
dir !systemroot!\..\Users | find /v "." | find /v "Public" | find "<DIR>" > test.txt
type test.txt >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : Ȩ ���丮�� Everyone ������ ���� ��� ^(All Users, Default User ���丮 ����^) >> ../result.xml
echo [���] : Ȩ ���丮�� Everyone ������ �ִ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

set flag=True

REM setlocal enabledelayedexpansion
for /f "tokens=5 delims= " %%a in (test.txt) do (
	cacls "!systemroot!\..\Users\%%a" | find /i "Everyone" 
	if !ERRORLEVEL! EQU 0 (
		set flag=False
	)
)

if "!flag!" EQU "False" (
	echo [���] : Ȩ ���丮�� Everyone ������ �ִ� ��� >> ../result.xml
)else (
	echo [��ȣ] : Ȩ ���丮�� Everyone ������ ���� ��� ^(All Users, Default User ���丮 ����^) >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-60^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
REM endlocal
echo ^<W-60^> >> ../result.xml
echo ^<Name^> 사용자별 홈 디렉토리 권한 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
dir !systemroot!\..\Users | find /v "." | find /v "Public" | find "<DIR>" > test.txt
type test.txt >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 홈 디렉토리에 Everyone 권한이 없는 경우 ^(All Users, Default User 디렉토리 제외^) >> ../result.xml
echo [취약] : 홈 디렉토리에 Everyone 권한이 있는 경우 >> ../result.xml
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
	echo [취약] : 홈 디렉토리에 Everyone 권한이 있는 경우 >> ../result.xml
)else (
	echo [양호] : 홈 디렉토리에 Everyone 권한이 없는 경우 ^(All Users, Default User 디렉토리 제외^) >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-60^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
REM endlocal
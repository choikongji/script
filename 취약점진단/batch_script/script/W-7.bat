
echo ^<W-7^> >> ../result.xml
echo ^<Name^> 공유 권한 및 사용자 그룹 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Everyone이 공유계정에 포함되어 있으면 익명 사용자의 접근이 가능하여 >> ../result.xml
echo 내부 정보 유출 및 악성코드의 감염 우려가 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net share >> ../result.xml
echo. >> ../result.xml
net share >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : 일반 공유 디렉토리가 없거나 공유 디렉토리 접근 권한에 Everyone 권한이 없는 경우 >> ../result.xml
echo [취약] : 일반 공유 디렉토리의 접근 권한에 Everyone 권한이 있는 경우 >> ../result.xml
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
	echo [취약] : 일반 공유 디렉토리의 접근 권한에 Everyone 권한이 있는 경우 >> ../result.xml
)else (
	echo [양호] : 일반 공유 디렉토리가 없거나 공유 디렉토리 접근 권한에 Everyone 권한이 없는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-7^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
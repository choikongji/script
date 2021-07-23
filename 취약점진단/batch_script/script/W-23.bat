echo ^<W-23^> >> ../result.xml
echo ^<Name^> SAM 파일 접근 통제 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -SAM 파일이 노출될 경우 패스워드 공격 시도로 인해 계정 및 패스워드 데이터베이스 정보가 탈취될 우려 존재 >> ../result.xml
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
echo [양호] : SAM 파일 접근권한에 Administrator, System 그룹만 모든 권한으로 >> ../result.xml
echo 설정되어 있는 경우 >> ../result.xml
echo [취약] : SAM 파일 접근권한에 Administrator, System 그룹 외 다른 그룹에 권한이 >> ../result.xml
echo 설정되어 있는 경우 >> ../result.xml
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
	echo [양호] : SAM 파일 접근권한에 Administrator, System 그룹만 모든 권한으로 >> ../result.xml
	echo 설정되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : SAM 파일 접근권한에 Administrator, System 그룹 외 다른 그룹에 권한이 >> ../result.xml
	echo 설정되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-23^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
if exist test1.txt del test1.txt
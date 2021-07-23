echo ^<W-19^> >> ../result.xml
echo ^<Name^> 백신 프로그램 업데이트 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo - 백신이 지속적, 주기적으로 업데이트 되지 않은 경우 계속되는 신종 바이러스의 >> ../result.xml
echo 출현으로 인한 시스템 공격의 우려가 존재 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #백신 프로그램 업데이트 >> ../result.xml
powershell "get-ciminstance -namespace root/securitycenter2 -classname antivirusproduct | out-string -stream | select-string "productstate" | out-file -append -encoding ascii "test.txt"
type test.txt >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 바이러스 백신 프로그램의 최신 엔진 업데이트가 설치되어 있거나, 망 격리 >> ../result.xml
echo 환경의 경우 백신 업데이트를 위한 절차 및 적용 방법이 수립된 경우 >> ../result.xml
echo [취약] : 바이러스 백신 프로그램의 최신 엔진 업데이트가 설치되어 있지 않거나, >> ../result.xml
echo 망 격리 환경의 경우 백신 업데이트를 위한 절차 및 적용 방법이 수립되지 않은 경우 >> ../result.xml
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
	echo [양호] : 바이러스 백신 프로그램의 최신 엔진 업데이트가 설치되어 있거나, 망 격리 >> ../result.xml
	echo 환경의 경우 백신 업데이트를 위한 절차 및 적용 방법이 수립된 경우 >> ../result.xml
)else (
	echo [취약] : 바이러스 백신 프로그램의 최신 엔진 업데이트가 설치되어 있지 않거나, >> ../result.xml
	echo 망 격리 환경의 경우 백신 업데이트를 위한 절차 및 적용 방법이 수립되지 않은 경우 >> ../result.xml
)

echo ^</Result^> >> ../result.xml
echo ^</W-19^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
if exist test1.txt del test1.txt
if exist update.txt del update.txt
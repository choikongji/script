echo ^<W-22^> >> ../result.xml
echo ^<Name^> 백신 프로그램 설치 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo 백신 프로그램이 설치되지 않은 경우 웜, 트로이목마 등의 악성 바이러스로 >> ../result.xml
echo 인한 시스템 피해 위험이 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #설치된 백신 프로그램 리스트 >> ../result.xml
echo. >> ../result.xml
powershell -NoProfile -ExecutionPolicy Bypass -File "W-22.ps1" > nul
type test.txt >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 바이러스 백신 프로그램이 설치되어 있는 경우 >> ../result.xml
echo [취약] : 바이러스 백신 프로그램이 설치되어 있지 않은 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

if exist test.txt (
	set i=0
	for /f "delims=:" %%a in (test.txt) do (
	set /A i+=1
	set name^<!i!^>=%%a
	) 
) else (
	echo [취약] : 바이러스 백신 프로그램의 최신 엔진 업데이트가 설치되어 있지 않거나, >> ../result.xml
	echo 망 격리 환경의 경우 백신 업데이트를 위한 절차 및 적용 방법이 수립되지 않은 경우 >> ../result.xml
	goto end
)

echo [양호] : 바이러스 백신 프로그램의 최신 엔진 업데이트가 설치되어 있거나, 망 격리 >> ../result.xml
echo 환경의 경우 백신 업데이트를 위한 절차 및 적용 방법이 수립된 경우 >> ../result.xml

:end
echo ^</Result^> >> ../result.xml
echo ^</W-22^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
echo ^<W-24^> >> ../result.xml
echo ^<Name^> 화면보호기 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -화면보호기 설정을 하지 않은 경우 사용자가 자리를 비운 사이에 임의의 >> ../result.xml
echo 사용자가 해당 시스템에 접근하여 중요 정보를 유출 하거나, 악의적인 행위를 >> ../result.xml
echo 통해 시스템 운영에 악영향을 미칠 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "HKCU\Control Panel\Desktop" /s ^| findstr /i "ScreenSave SCRNSAVE" >> ../result.xml
echo. >> ../result.xml
reg query "HKCU\Control Panel\Desktop" /s | findstr /i "ScreenSave SCRNSAVE" >> ../result.xml
echo #reg query "HKCU\Control Panel\Desktop" /s ^| find /i "SCRNSAVE.EXE" >> ../result.xml
reg query "HKCU\Control Panel\Desktop" /s | find /i "SCRNSAVE.EXE" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 화면 보호기를 설정하고 대기 시간이 10분 이하의 값으로 설정되어 >> ../result.xml
echo 있으며, 화면 보호기 해제를 위한 암호를 사용하는 경우 >> ../result.xml
echo [취약] : 화면 보호기가 설정되지 않았거나 암호를 사용하지 않은 경우 또는, 화면 >> ../result.xml
echo 보호기 대기 시간이 10분을 초과한 값으로 설정되어 있는 경우 >> ../result.xml
echo ScreenSaveActive = 1(화면 보호기 작동 유무), 양호 >> ../result.xml
echo ScreenSaverIsSecure = 1(다시 시작할 때 로그온 화면 표시), 양호 >> ../result.xml
echo ScreenSaveTimeOut = 600 이하(대기 시간, 단위 1초), 양호 >> ../result.xml
echo 화면 보호기 설정이 한번도 적용되지 않은 경우, 레지스트리 값이 존재하지 않으므로 취약 >> ../result.xml
echo ScreenSaveActive 값이 1이더라도 SCRNSAVE.EXE 값이 없을 경우, >> ../result.xml
echo 화면 보호기 설정이 적용되어 있지 않으므로 취약 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

reg query "HKCU\Control Panel\Desktop" /s | find /i "ScreenSaveActive" | find "0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : 화면 보호기 설정이 적용되어 있지 않은 경우 >> ../result.xml
	goto end
)

reg query "HKCU\Control Panel\Desktop" /s | find /i "SCRNSAVE.EXE" > nul
if !ERRORLEVEL! NEQ 0 (
	echo [취약] : 화면 보호기 설정이 적용되어 있지 않은 경우 >> ../result.xml
	goto end
)

reg query "HKCU\Control Panel\Desktop" /s | find /i "ScreenSaverIsSecure" | find "0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : 화면 보호기가 설정되지 않았거나 암호를 사용하지 않은 경우 또는, 화면 >> ../result.xml
	echo 보호기 대기 시간이 10분을 초과한 값으로 설정되어 있는 경우 >> ../result.xml
	goto end
)

reg query "HKCU\Control Panel\Desktop" /s | find /i "ScreenSaveTimeOut" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do set a=%%a
if !a! GTR 600 (
	echo [취약] 화면 보호기 설정이 10분 이상의 값으로 설정되어 있거나 해제를 위한 암호를 사용하고 있지 않으므로 취약함 >> ../result.xml
	goto end
)

echo [양호] 화면 보호기 설정이 10분 이하의 값으로 설정되어 있으며, 해제를 위한 암호를 사용하고 있으므로 양호함 >> ../result.xml


:end
echo ^</Result^> >> ../result.xml
echo ^</W-24^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt


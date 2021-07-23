echo ^<W-25^> >> ../result.xml
echo ^<Name^> 로그온 하지 않고 시스템 종료 허용 해제 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -로그온 창에 “시스템 종료” 버튼이 활성화되어 있으면 로그인을 하지 않고도 >> ../result.xml
echo 불법적인 시스템 종료가 가능하여 정상적인 서비스 운영에 영향을 줌 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "shutdownwithoutlogon" >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "shutdownwithoutlogon" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : “로그온 하지 않고 시스템 종료 허용”이 “사용 안 함”으로 설정되어 있는경우 >> ../result.xml
echo [취약] : “로그온 하지 않고 시스템 종료 허용”이 “사용”으로 설정되어 있는 경우, 0x1 >> ../result.xml
echo shutdownwithoutlogon 0x0 = 사용 안함 >> ../result.xml
echo shutdownwithoutlogon 0x1 = 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "shutdownwithoutlogon" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : “로그온 하지 않고 시스템 종료 허용”이 “사용 안 함”으로 설정되어 있는경우 >> ../result.xml
)else (
	echo [취약] : “로그온 하지 않고 시스템 종료 허용”이 “사용”으로 설정되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-25^> >> ../result.xml
echo. >> ../result.xml
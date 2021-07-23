echo ^<W-38^> >> ../result.xml
echo ^<Name^> 마지막 사용자 이름 표시 안 함 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -마지막으로 로그온한 사용자의 이름이 로그온 대화 상자에 표시될 경우 >> ../result.xml
echo 공격자는 이를 획득하여 암호를 추측하거나 무작위 공격을 시도할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo reg query "dontdisplaylastusername" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "dontdisplaylastusername" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [취약] : “마지막 사용자 이름 표시 안 함”이 “사용 안 함”으로 설정되어 있는 경우 >> ../result.xml
echo [양호] : “마지막 사용자 이름 표시 안 함”이 “사용”으로 설정되어 있는 경우 >> ../result.xml
echo dontdisplaylastusername = 0x0 사용 안함 >> ../result.xml
echo dontdisplaylastusername = 0x1 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "dontdisplaylastusername" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : “마지막 사용자 이름 표시 안 함”이 “사용 안 함”으로 설정되어 있는 경우 >> ../result.xml
)else (
	echo [양호] : “마지막 사용자 이름 표시 안 함”이 “사용”으로 설정되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-38^> >> ../result.xml
echo. >> ../result.xml
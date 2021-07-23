@echo off

echo ^<W-59^> >> ../result.xml
echo ^<Name^> 경고 메시지 설정 ^</Name^>  >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo 로그온 경고 메시지가 없는 경우 악의적인 사용자에게 관리자가 적절한 >> ../result.xml
echo 보안수준으로 시스템을 보호하고 있으며, 공격자의 활동을 주시하고 있다는 >> ../result.xml
echo 생각을 상기 시킬 수 없어 간접적인 공격 기회를 제공할 우려 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /s ^| find /i "Legalnoticetext" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /s | find /i "Legalnoticetext" > nul
echo reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /s ^| find /i "Legalnoticecaption" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /s | find /i "Legalnoticecaption" > nul
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 로그인 경고 메시지 제목 및 내용이 설정되어 있는 경우 >> ../result.xml
echo [취약] : 로그인 경고 메시지 제목 및 내용이 설정되어 있지 않은 경우 >> ../result.xml
echo *Legalnoticetext = 1,"경고 메시지 내용" >> ../result.xml
echo *Legalnoticecaption = 1,"경고 메시지 제목" >> ../result.xml
echo *경고문이 한글로 작성되어 있다면 깨져서 보일 수 있으므로 양호 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

for /f "tokens=2 delims=REG_SZ" %%a in ('reg query ^"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System^" /s ^| find /i ^"Legalnoticetext^"') do (
	echo %%a | find /i "echo" > nul
	if !ERRORLEVEL! EQU 0 (
		echo [취약] : 로그인 경고 메시지 제목 및 내용이 설정되어 있지 않은 경우 >> ../result.xml
		goto end
	)
)
for /f "tokens=2 delims=REG_SZ" %%a in ('reg query ^"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System^" /s ^| find /i ^"Legalnoticecaption^"') do (
	echo %%a | find /i "echo" > nul
	if !ERRORLEVEL! EQU 0 (
		echo [취약] : 로그인 경고 메시지 제목 및 내용이 설정되어 있지 않은 경우 >> ../result.xml
		goto end
	)
)
echo [양호] : 로그인 경고 메시지 제목 및 내용이 설정되어 있는 경우 >> ../result.xml
:end
echo ^</Result^> >> ../result.xml
echo ^</W-59^> >> ../result.xml
echo. >> ../result.xml

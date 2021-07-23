echo ^<W-44^> >> ../result.xml
echo ^<Name^> 터미널 서비스 암호화 수준 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -서버 접속 시에 낮은 암호화 수준을 적용할 경우 악의적인 사용자에 의해 >> ../result.xml
echo 서버와 클라이언트간 주고받는 정보가 노출될 우려가 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start find "TermService" >> ../result.xml
echo. >> ../result.xml
net start | find "TermService" >> ../result.xml
echo #reg query "MinEncryptionLevel" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MinEncryptionLevel" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 터미널 서비스 암호화 수준을 “높은 수준” 으로 설정한 경우 >> ../result.xml
echo [양호] : 터미널 서비스 암호화 수준을 “클라이언트와호환 가능^(중간^)” 이상으로 설정한 경우 >> ../result.xml
echo [취약] : 터미널 서비스를 사용하고 암호화 수준이 “낮음” 으로 설정한 경우 >> ../result.xml
echo MinEncryptionLevel    REG_DWORD    0x1 = 낮음 >> ../result.xml
echo MinEncryptionLevel    REG_DWORD    0x2 = 클라이언트와호환 가능^(중간^) >> ../result.xml
echo MinEncryptionLevel    REG_DWORD    0x3 = 높은수준 >> ../result.xml
echo ^</Comment^> >> ../result.xml

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MinEncryptionLevel" | find "MinEncryptionLevel" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
net start | find "TermService" > nul
if !ERRORLEVEL! EQU 0 (
	if "!b!" EQU "0x3" (
		echo [양호] : 터미널 서비스 암호화 수준을 “높은 수준” 으로 설정한 경우 >> ../result.xml
	)else (
		if "!b!" EQU "0x2" (
			echo [양호] : 터미널 서비스 암호화 수준을 “클라이언트와호환 가능^(중간^)” 이상으로 설정한 경우 >> ../result.xml
		)else (
			echo [취약] : 터미널 서비스를 사용하고 암호화 수준이 “낮음” 으로 설정한 경우 >> ../result.xml
		)
	)
)else (
	echo [양호] : 터미널 서비스를 사용하고 있지 않은 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-44^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt


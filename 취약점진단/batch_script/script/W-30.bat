echo ^<W-30^> >> ../result.xml
echo ^<Name^> 이동식 미디어 포맷 및 꺼내기 허용 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -관리자 이외 사용자에게 해당 정책이 설정된 경우 비인가자에 의한 불법적인 >> ../result.xml
echo 매체 처리를 허용할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "AllocateDASD" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : “이동식 미디어 포맷 및 꺼내기 허용” 정책이 “Administrator”로 되어 있는 경우 >> ../result.xml
echo [취약] : “이동식 미디어 포맷 및 꺼내기 허용” 정책이 “Administrator”로 되어 있지 않은 경우 >> ../result.xml
echo llocateDASD    REG_SZ    0 = Administrator >> ../result.xml
echo llocateDASD    REG_SZ    1 = Administrator 및 Power Users >> ../result.xml
echo llocateDASD    REG_SZ    2 = Administrator 및 Interactive Users >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" | find "0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : “이동식 미디어 포맷 및 꺼내기 허용” 정책이 “Administrator”로 되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : “이동식 미디어 포맷 및 꺼내기 허용” 정책이 “Administrator”로 되어 있지 않은 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-30^> >> ../result.xml
echo. >> ../result.xml
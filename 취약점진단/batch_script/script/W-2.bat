echo ^<W-2^> >> ../result.xml
echo ^<Name^> Guest 계정 비활성화 여부 점검 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Guest 계정은 시스템에 임시로 액세스해야 하는 사용자용 계정으로 >> ../result.xml
echo 이 계정을 사용하여 권한 없는 사용자가 시스템에 익명으로 액세스할 수 있으므로 >> ../result.xml
echo 비인가자 접근, 정보 유출 등 보안 위험이 따를 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net user guest ^| find "Account active" >> ../result.xml
echo. >> ../result.xml
net user guest | find "Account active" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : Guest 계정이 비활성화 되어 있는 경우 >> ../result.xml
echo [취약] : Guest 계정이 활성화 되어 있는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml


echo ^<Result^> >> ../result.xml
net user guest | find /i "Account active" | find /i "No" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : Guest 계정이 비활성화 되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : Guest 계정이 활성화 되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-2^> >> ../result.xml
echo. >> ../result.xml

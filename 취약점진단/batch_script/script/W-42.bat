echo ^<W-42^> >> ../result.xml
echo ^<Name^> 콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -이 정책이 “사용 안 함”으로 설정된 경우 빈 암호를 가진 로컬 계정에 대하여 >> ../result.xml
echo 터미널 서비스^(원격 데스크톱 서비스^), Telnet 및 FTP와 같은 네트워크 >> ../result.xml
echo 서비스의 원격 대화형 로그온이 가능하여, 시스템 보안에 심각한 위험을 줄 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "LimitBlankPasswordUse" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" | find "LimitBlankPasswordUse" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : “콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한” 정책이 “사용”인 경우 >> ../result.xml
echo [취약] : “콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한” 정책이 “사용 안 함”인 경우 >> ../result.xml
echo LimitBlankPasswordUse = 0x0 사용안함 >> ../result.xml
echo LimitBlankPasswordUse = 0x1 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : “콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한” 정책이 “사용 안 함”인 경우 >> ../result.xml
)else (
	echo [양호] : “콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한” 정책이 “사용”인 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-42^> >> ../result.xml
echo. >> ../result.xml
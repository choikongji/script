echo ^<W-47^> >> ../result.xml
echo ^<Name^> SNMP Access control 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo SNMP Access control 설정을 적용하지 않아 인증되지 않은 내부 서버로부 >> ../result.xml
echo 터의 SNMP 트래픽을 차단하지 않을 경우, 장치 구성 변경, 라우팅 테이블 >> ../result.xml
echo 조작, 악의적인 TFTP 서버 구동 등의 SNMP 공격에 노출될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo # net start ^| find "SNMP Service" >>  ../result.xml
net start | find "SNMP Service" >>  ../result.xml
echo. >>  ../result.xml
echo #reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" > nul
if !ERRORLEVEL! EQU 0 (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" >> ../result.xml
)
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 특정 호스트로부터 SNMP 패킷 받아들이기로 설정되어 있는 경우 >> ../result.xml
echo [취약] : 모든 호스트로부터 SNMP 패킷 받아들이기로 설정되어 있는 경우 >> ../result.xml
echo [N/A] : SMTP 서비스를 사용하지 않는 경우 >> ../result.xml
echo *PermittedManagers = 인증 트랩 보내기 및 다음 호스트로부터 SNMP 패킷 받아들이기 >> ../result.xml
echo *PermittedManagers 항목에 localhost만 존재시 양호, host name, IP가 등록되어 있다면 판단 후 진단 >>  ../result.xml
echo *PermittedManagers 값이 없으면 취약 >>  ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
REM setlocal enabledelayedexpansion
net start | find "SNMP Service" > nul
if !ERRORLEVEL! EQU 1 (
	echo [N/A] : SMTP 서비스를 사용하지 않는 경우 >> ../result.xml
) else (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" | findstr /i "REG_SZ" > nul
	if !ERRORLEVEL! EQU 0 ( 
		echo [인터뷰] 해당 호스트 및 IP가 어떤 시스템인지 확인 >> ../result.xml
	) else (
		echo [취약] : 모든 호스트로부터 SNMP 패킷 받아들이기로 설정되어 있는 경우 >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-47^> >> ../result.xml
echo. >> ../result.xml
REM endlocal
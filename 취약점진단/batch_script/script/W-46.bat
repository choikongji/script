echo ^<W-46^> >> ../result.xml
echo ^<Name^> SNMP 서비스 커뮤니티스트링의 복잡성 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Community String 설정을 변경하지 않고 public, private 등 Default 설정 >> ../result.xml
echo 값으로 사용하는 경우, 기본 String 값을 통한 시스템의 주요 정보 및 설정 >> ../result.xml
echo 상태의 비인가자 노출 위험이 존재 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "SNMP Service" >> ../result.xml
net start | find "SNMP Service" >> ../result.xml
echo #reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /s ^| find /v "Listing" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /s | find /v "Listing" > nul
if !ERRORLEVEL! EQU 0 (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /s | find /v "Listing" >> ../result.xml
)
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [N/A] SNMP 서비스를 사용하지 않는 경우 >> ../result.xml
echo [양호] : SNMP 서비스를 사용하지 않거나 Community String이 public, private이 아닌 경우 >> ../result.xml
echo [취약] : SNMP 서비스를 사용하며, Community String이 public, private인 경우 >> ../result.xml
echo *public, private = 1(1) ^(속성 없음^) >> ../result.xml
echo *public, private = 2(2) ^(알림 송석^) >> ../result.xml
echo *public, private = 4(4) ^(읽기전용 속성^) >> ../result.xml
echo *public, private = 8(8) ^(읽기,쓰기 전용 속성^) >> ../result.xml
echo *public, private = 10(16) ^(읽기,만들기 전용 속성^) >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

REM setlocal enabledelayedexpansion
net start | find "SNMP Service" > nul
if !ERRORLEVEL! EQU 1 (
	echo [N/A] SNMP 서비스를 사용하지 않으므로 해당없음 >>../result.xml
) else (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /s | findstr /i "public private"
	if !ERRORLEVEL! EQU 1 ( 
		echo [양호] : SNMP 서비스를 사용하지 않거나 Community String이 public, private이 아닌 경우 >> ../result.xml
	) else (
		echo [취약] : SNMP 서비스를 사용하며, Community String이 public, private인 경우 >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-46^> >> ../result.xml
echo. >> ../result.xml
REM endlocal
REM setlocal enabledelayedexpansion
echo ^<W-16^> >> ../result.xml
echo ^<Name^> DNS Zone Transfer 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -DNS Zone Transfer 차단 설정이 적용되지 않은 경우 DNS 서버에 저장되어 >> ../result.xml
echo 있는 도메인 정보를 승인된 DNS 서버가 아닌 외부로 유출 위험 존재 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start | find "DNS Server" >> ../result.xml
net start | find "DNS Server" >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s ^| findstr /i "SecureSecondaries" >> ../result.xml
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find /i "SecureSecondaries" > nul
if !ERRORLEVEL! EQU 0 (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find /i "SecureSecondaries" >> ../result.xml
)
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : : 아래 기준에 해당될 경우 >> ../result.xml
echo 1. DNS 서비스를 사용 않는 경우 >> ../result.xml
echo 2. 영역 전송 허용을 하지 않는 경우 >> ../result.xml
echo 3. 특정 서버로만 설정이 되어 있는 경우 >> ../result.xml
echo [취약] : 위 3개 기준 중 하나라도 해당 되지 않는 경우 >> ../result.xml
echo DatabaseFile = zone 이름 >> ../result.xml
echo SecureSecondaries = DNS Zone Transfer 영역전송 여부 >> ../result.xml
echo SecureSecondaries = 0 요청하는 모든 secondary server(보조 서버)로 zone transfer 전송 >> ../result.xml
echo SecureSecondaries = 1 zone에 대하여 권한이 있는 name server로만 전송 >> ../result.xml
echo SecureSecondaries = 2 특정 서버로만 zone transfer 전송 >> ../result.xml
echo SecureSecondaries = 3 zone transfer 전송하지 않음 >> ../result.xml
echo SecureSecondaries 0,1이면 취약 2이면 양호 >> ../result.xml
echo SecondaryServers = 영역전송할 서버 내역 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

net start | find /i "DNS Server" > nul
if not !ERRORLEVEL! EQU 0 (
	echo [양호] : DNS 서비스를 사용하지 않는 경우 >> ../result.xml
) else (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | findstr /i "SecureSecondaries" | findstr /i "0x2 0x3" > nul
	if !ERRORLEVEL! EQU 0 (
		echo [양호] : : 아래 기준에 해당될 경우 >> ../result.xml
		echo 1. DNS 서비스를 사용 않는 경우 >> ../result.xml
		echo 2. 영역 전송 허용을 하지 않는 경우 >> ../result.xml
		echo 3. 특정 서버로만 설정이 되어 있는 경우 >> ../result.xml
	) else (
		echo [취약] : 위 3개 기준 중 하나라도 해당 되지 않는 경우 >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-16^> >> ../result.xml
echo. >> ../result.xml
REM endlocal
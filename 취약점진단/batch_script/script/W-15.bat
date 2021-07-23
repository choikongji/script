REM setlocal enabledelayedexpansion
echo ^<W-15^> >> ../result.xml
echo ^<Name^> FTP 접근 제어 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -FTP 프로토콜은 로그온에 지정된 자격 증명이나 데이터 자체가 암호화 되지 >> ../result.xml
echo 않고 모든 자격 증명을 일반 텍스트로 네트워크를 통해 전송되는 특성상 서버 >> ../result.xml
echo 클라이언트간 트래픽 스니핑을 통해 인증정보가 쉽게 노출되므로 접속 >> ../result.xml 
echo 허용된 사용자 IP를 지정하여 접속자를 제한할 것을 권고 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start | find "FTP" >> ../result.xml
echo. >> ../result.xml
net start | find "FTP" >> ../result.xml
type !Systemroot!\System32\inetsrv\config\applicationHost.config > applicationHost.txt
echo #applicationHost.txt ^| findstr "ipAddress" >> ../result.xml
echo. >> ../result.xml
type applicationHost.txt | findstr "ipAddress" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : 특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용한 경우 >> ../result.xml
echo [취약] : 특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용하지 않은 경우 >> ../result.xml
echo ※ 조치 시 마스터 속성과 모든 사이트에 적용함 >> ../result.xml
echo [N/A] : FTP 서비스를 사용하지 않는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml

net start | find /i "FTP"
if !ERRORLEVEL! EQU 0 (
	echo [N/A] : FTP 서비스를 사용하지 않는 경우 >> ../result.xml
) else (
	type applicationHost.txt | findstr "ipAddress" > nul
	if !ERRORLEVEL! EQU 0 ( 
		echo [양호] : 특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용한 경우 >> ../result.xml
	) else (
		echo [취약] : 특정 IP 주소에서만 FTP 서버에 접속하도록 접근제어 설정을 적용하지 않은 경우 >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-15^> >> ../result.xml
echo. >> ../result.xml
if exist applicationHost.txt del applicationHost.txt
REM endlocal
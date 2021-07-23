REM setlocal enabledelayedexpansion
echo ^<W-14^> >> ../result.xml
echo ^<Name^> Anonymous FTP 금지 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -FTP 익명 접속이 허용된 경우 핵심 기밀 자료나 내부 정보의 불법 유출 가능성이 존재함 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "FTP" >> ../result.xml
echo. >> ../result.xml 
net start | find "FTP" >> ../result.xml
type !Systemroot!\System32\inetsrv\config\applicationHost.config > applicationHost.txt
echo #type anonymousAuthentication.config.txt ^| find /i "anonymousAuthentication enabled" >> ../result.xml
type applicationHost.txt | find /i "anonymousAuthentication enabled" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : FTP 서비스를 사용하지 않거나, “익명 연결 허용”이 체크되지 않은 경우 >> ../result.xml
echo [취약] : FTP 서비스를 사용하거나, “익명 연결 허용”이 체크되어 있는 경우 >> ../result.xml
echo [N/A] : FTP 서비스를 사용하지 않는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

net start | find /i "FTP"
if !ERRORLEVEL! EQU 0 (
	echo [N/A] FTP 서비스를 사용하지 않으므로 해당없음 >> ../result.xml
) else (
	type applicationHost.txt | findstr /i /C:"anonymousAuthentication enabled="true"" > nul
	if !ERRORLEVEL! EQU 0 ( 
		echo [취약] : FTP 서비스를 사용하거나, “익명 연결 허용”이 체크되어 있는 경우 >> ../result.xml
	) else (
		echo [양호] : FTP 서비스를 사용하지 않거나, “익명 연결 허용”이 체크되지 않은 경우 >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-14^> >> ../result.xml
echo. >> ../result.xml
if exist applicationHost.txt del applicationHost.txt
REM endlocal
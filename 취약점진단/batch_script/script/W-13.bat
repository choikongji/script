echo ^<W-13^> >> ../result.xml
echo ^<Name^> FTP 디렉토리 접근권한 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo FTP 홈디렉토리에 과도한 권한^(예. Everyone Full Control^)이 부여된 경우 임의의 >> ../result.xml
echo 사용자가 쓰기, 수정이 가능하여 정보유출, 파일 위?변조 등의 위험 존재 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "FTP" >> ../result.xml
echo. >> ../result.xml
net start | find "FTP" >> ../result.xml

echo #icacls !Systemroot!\..\inetpub\ftproot >> ../result.xml
echo. >> ../result.xml
icacls !Systemroot!\..\inetpub\ftproot >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : FTP 홈 디렉토리에 Everyone 권한이 없는 경우 >> ../result.xml
echo [취약] : FTP 홈 디렉토리에 Everyone 권한이 있는 경우 >> ../result.xml
echo [N/A] : FTP 서비스를 사용하지 않는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

REM setlocal enabledelayedexpansion
net start | find /i "FTP"
if !ERRORLEVEL! EQU 1 (
	echo [N/A] : FTP 서비스를 사용 안하는 경우 >> ../result.xml
)else (
	icacls %Systemroot%\..\inetpub\ftproot | findstr /i "Everyone"
	if !ERRORLEVEL! EQU 0 (
		echo [취약] : FTP 홈 디렉토리에 Everyone 권한이 있는 경우 >> ../result.xml
	)else (
		echo [양호] : FTP 홈 디렉토리에 Everyone 권한이 없는 경우 >> ../result.xml
	)
)

echo ^</Result^> >> ../result.xml
echo ^</W-13^> >> ../result.xml
echo. >> ../result.xml
REM endlocal
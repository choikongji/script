echo ^<W-12^> >> ../result.xml
echo ^<Name^> FTP 서비스 구동 점검 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -OS에서 제공하는 기본적인 FTP 서비스를 사용할 경우 계정과 패스워드가 >> ../result.xml
echo 암호화되지 않은 채로 전송 되어 Sniffer에 의한 계정 정보의 노출 위험 존재 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "FTP" >> ../result.xml
echo. >> ../result.xml
net start | find "FTP" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : FTP 서비스를 사용하지 않는 경우 또는 secure FTP 서비스를 사용하는 경우 >> ../result.xml
echo [취약] : FTP 서비스를 사용하는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net start | find "FTP" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : FTP 서비스를 사용하는 경우 >> ../result.xml
)else (
	echo [양호] : FTP 서비스를 사용하지 않는 경우 또는 secure FTP 서비스를 사용하는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-12^> >> ../result.xml
echo. >> ../result.xml
echo ^<W-10^> >> ../result.xml
echo ^<Name^> IIS 서비스 구동 점검 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -IIS 서비스는 WEB, FTP 등의 서비스를 제공해주는 유용한 서비스이나 프로파일링, >> ../result.xml
echo 서비스 거부, 불법적인 접근, 임의의 코드실행, 정보 공개, 바이러스, 웜, >> ../result.xml
echo 트로이목마 등의 위협에 노출될 수 있어 서비스 불필요 시 삭제하여야 함 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "IIS" >> ../result.xml
echo. >> ../result.xml
net start | find "IIS" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : IIS 서비스가 필요하지 않아 이용하지 않는 경우 >> ../result.xml
echo [취약] : IIS 서비스를 필요하지 않지만 사용하는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net start | find /i "IIS" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : IIS 서비스를 필요하지 않지만 사용하는 경우 >> ../result.xml
)else (
	echo [양호] : IIS 서비스가 필요하지 않아 이용하지 않는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-10^> >> ../result.xml
echo. >> ../result.xml
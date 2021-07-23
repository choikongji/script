echo ^<W-11^> >> ../result.xml
echo ^<Name^> NetBIOS 바인딩 서비스 구동 점검 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -인터넷에 직접 연결되어 있는 윈도우 시스템에서 NetBIOS TCP/IP 바인딩이 >> ../result.xml
echo 활성화 되어 있을 경우 공격자가 네트워크 공유자원을 사용할 우려 존재 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #ipconfig /all ^| findstr /i "NetBIOS over Tcpip" ^| find /i "Enabled" >> ../result.xml
echo. >> ../result.xml
ipconfig /all | findstr /i "NetBIOS over Tcpip" | find /i "Enabled" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : TCP/IP와 NetBIOS 간의 바인딩이 제거 되어 있는 경우 >> ../result.xml
echo [취약] : TCP/IP와 NetBIOS 간의 바인딩이 제거 되어있지 않은 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml
ipconfig /all | find "NetBIOS over Tcpip" | find "Enabled" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : TCP/IP와 NetBIOS 간의 바인딩이 제거 되어있지 않은 경우 >> ../result.xml
)else (
	echo [양호] : TCP/IP와 NetBIOS 간의 바인딩이 제거 되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-11^> >> ../result.xml
echo. >> ../result.xml
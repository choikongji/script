echo ^<W-11^> >> ../result.xml
echo ^<Name^> NetBIOS ���ε� ���� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���ͳݿ� ���� ����Ǿ� �ִ� ������ �ý��ۿ��� NetBIOS TCP/IP ���ε��� >> ../result.xml
echo Ȱ��ȭ �Ǿ� ���� ��� �����ڰ� ��Ʈ��ũ �����ڿ��� ����� ��� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #ipconfig /all ^| findstr /i "NetBIOS over Tcpip" ^| find /i "Enabled" >> ../result.xml
echo. >> ../result.xml
ipconfig /all | findstr /i "NetBIOS over Tcpip" | find /i "Enabled" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : TCP/IP�� NetBIOS ���� ���ε��� ���� �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : TCP/IP�� NetBIOS ���� ���ε��� ���� �Ǿ����� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml
ipconfig /all | find "NetBIOS over Tcpip" | find "Enabled" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : TCP/IP�� NetBIOS ���� ���ε��� ���� �Ǿ����� ���� ��� >> ../result.xml
)else (
	echo [��ȣ] : TCP/IP�� NetBIOS ���� ���ε��� ���� �Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-11^> >> ../result.xml
echo. >> ../result.xml
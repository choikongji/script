REM setlocal enabledelayedexpansion
echo ^<W-14^> >> ../result.xml
echo ^<Name^> Anonymous FTP ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -FTP �͸� ������ ���� ��� �ٽ� ��� �ڷᳪ ���� ������ �ҹ� ���� ���ɼ��� ������ >> ../result.xml
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
echo [��ȣ] : FTP ���񽺸� ������� �ʰų�, ���͸� ���� ��롱�� üũ���� ���� ��� >> ../result.xml
echo [���] : FTP ���񽺸� ����ϰų�, ���͸� ���� ��롱�� üũ�Ǿ� �ִ� ��� >> ../result.xml
echo [N/A] : FTP ���񽺸� ������� �ʴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

net start | find /i "FTP"
if !ERRORLEVEL! EQU 0 (
	echo [N/A] FTP ���񽺸� ������� �����Ƿ� �ش���� >> ../result.xml
) else (
	type applicationHost.txt | findstr /i /C:"anonymousAuthentication enabled="true"" > nul
	if !ERRORLEVEL! EQU 0 ( 
		echo [���] : FTP ���񽺸� ����ϰų�, ���͸� ���� ��롱�� üũ�Ǿ� �ִ� ��� >> ../result.xml
	) else (
		echo [��ȣ] : FTP ���񽺸� ������� �ʰų�, ���͸� ���� ��롱�� üũ���� ���� ��� >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-14^> >> ../result.xml
echo. >> ../result.xml
if exist applicationHost.txt del applicationHost.txt
REM endlocal
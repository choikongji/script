echo ^<W-13^> >> ../result.xml
echo ^<Name^> FTP ���丮 ���ٱ��� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo FTP Ȩ���丮�� ������ ����^(��. Everyone Full Control^)�� �ο��� ��� ������ >> ../result.xml
echo ����ڰ� ����, ������ �����Ͽ� ��������, ���� ��?���� ���� ���� ���� >> ../result.xml
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
echo [��ȣ] : FTP Ȩ ���丮�� Everyone ������ ���� ��� >> ../result.xml
echo [���] : FTP Ȩ ���丮�� Everyone ������ �ִ� ��� >> ../result.xml
echo [N/A] : FTP ���񽺸� ������� �ʴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

REM setlocal enabledelayedexpansion
net start | find /i "FTP"
if !ERRORLEVEL! EQU 1 (
	echo [N/A] : FTP ���񽺸� ��� ���ϴ� ��� >> ../result.xml
)else (
	icacls %Systemroot%\..\inetpub\ftproot | findstr /i "Everyone"
	if !ERRORLEVEL! EQU 0 (
		echo [���] : FTP Ȩ ���丮�� Everyone ������ �ִ� ��� >> ../result.xml
	)else (
		echo [��ȣ] : FTP Ȩ ���丮�� Everyone ������ ���� ��� >> ../result.xml
	)
)

echo ^</Result^> >> ../result.xml
echo ^</W-13^> >> ../result.xml
echo. >> ../result.xml
REM endlocal
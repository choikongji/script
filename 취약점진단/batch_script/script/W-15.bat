REM setlocal enabledelayedexpansion
echo ^<W-15^> >> ../result.xml
echo ^<Name^> FTP ���� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -FTP ���������� �α׿¿� ������ �ڰ� �����̳� ������ ��ü�� ��ȣȭ ���� >> ../result.xml
echo �ʰ� ��� �ڰ� ������ �Ϲ� �ؽ�Ʈ�� ��Ʈ��ũ�� ���� ���۵Ǵ� Ư���� ���� >> ../result.xml
echo Ŭ���̾�Ʈ�� Ʈ���� �������� ���� ���������� ���� ����ǹǷ� ���� >> ../result.xml 
echo ���� ����� IP�� �����Ͽ� �����ڸ� ������ ���� �ǰ� >> ../result.xml
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
echo [��ȣ] : Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ ������ ��� >> ../result.xml
echo [���] : Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ �������� ���� ��� >> ../result.xml
echo �� ��ġ �� ������ �Ӽ��� ��� ����Ʈ�� ������ >> ../result.xml
echo [N/A] : FTP ���񽺸� ������� �ʴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml

net start | find /i "FTP"
if !ERRORLEVEL! EQU 0 (
	echo [N/A] : FTP ���񽺸� ������� �ʴ� ��� >> ../result.xml
) else (
	type applicationHost.txt | findstr "ipAddress" > nul
	if !ERRORLEVEL! EQU 0 ( 
		echo [��ȣ] : Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ ������ ��� >> ../result.xml
	) else (
		echo [���] : Ư�� IP �ּҿ����� FTP ������ �����ϵ��� �������� ������ �������� ���� ��� >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-15^> >> ../result.xml
echo. >> ../result.xml
if exist applicationHost.txt del applicationHost.txt
REM endlocal
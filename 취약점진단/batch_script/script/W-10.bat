echo ^<W-10^> >> ../result.xml
echo ^<Name^> IIS ���� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -IIS ���񽺴� WEB, FTP ���� ���񽺸� �������ִ� ������ �����̳� �������ϸ�, >> ../result.xml
echo ���� �ź�, �ҹ����� ����, ������ �ڵ����, ���� ����, ���̷���, ��, >> ../result.xml
echo Ʈ���̸� ���� ������ ����� �� �־� ���� ���ʿ� �� �����Ͽ��� �� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "IIS" >> ../result.xml
echo. >> ../result.xml
net start | find "IIS" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : IIS ���񽺰� �ʿ����� �ʾ� �̿����� �ʴ� ��� >> ../result.xml
echo [���] : IIS ���񽺸� �ʿ����� ������ ����ϴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net start | find /i "IIS" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : IIS ���񽺸� �ʿ����� ������ ����ϴ� ��� >> ../result.xml
)else (
	echo [��ȣ] : IIS ���񽺰� �ʿ����� �ʾ� �̿����� �ʴ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-10^> >> ../result.xml
echo. >> ../result.xml
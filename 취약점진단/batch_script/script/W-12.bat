echo ^<W-12^> >> ../result.xml
echo ^<Name^> FTP ���� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -OS���� �����ϴ� �⺻���� FTP ���񽺸� ����� ��� ������ �н����尡 >> ../result.xml
echo ��ȣȭ���� ���� ä�� ���� �Ǿ� Sniffer�� ���� ���� ������ ���� ���� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "FTP" >> ../result.xml
echo. >> ../result.xml
net start | find "FTP" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : FTP ���񽺸� ������� �ʴ� ��� �Ǵ� secure FTP ���񽺸� ����ϴ� ��� >> ../result.xml
echo [���] : FTP ���񽺸� ����ϴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net start | find "FTP" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : FTP ���񽺸� ����ϴ� ��� >> ../result.xml
)else (
	echo [��ȣ] : FTP ���񽺸� ������� �ʴ� ��� �Ǵ� secure FTP ���񽺸� ����ϴ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-12^> >> ../result.xml
echo. >> ../result.xml
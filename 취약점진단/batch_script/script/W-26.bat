echo ^<W-26^> >> ../result.xml
echo ^<Name^> ���� �ý��ۿ��� ������ �ý��� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���� �ý��� ���� ���� ������ �������� ��� ���� �ź� ���� � �ǿ� >> ../result.xml
echo �� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG test.txt ^| find "SeRemoteShutdownPrivilege = *S-1-5-32-544" >> ../result.xml
secedit /EXPORT /CFG test.txt > nul
type test.txt | find "SeRemoteShutdownPrivilege" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� ��Administrators���� ���� >> ../result.xml
echo �ϴ� ��� >> ../result.xml
echo [���] : ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� ��Administrators�� �� �ٸ� >> ../result.xml
echo ���� �� �׷��� �����ϴ� ��� >> ../result.xml
echo echo * S-1-5-32-544: Administrators �׷� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

type test.txt | find "SeRemoteShutdownPrivilege = *S-1-5-32-544" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� ��Administrators���� ���� >> ../result.xml
	echo �ϴ� ��� >> ../result.xml
)else (
	echo [���] : ������ �ý��ۿ��� ������ �ý��� ���ᡱ ��å�� ��Administrators�� �� �ٸ� >> ../result.xml
	echo ���� �� �׷��� �����ϴ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-26^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
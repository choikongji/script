echo ^<W-25^> >> ../result.xml
echo ^<Name^> �α׿� ���� �ʰ� �ý��� ���� ��� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�α׿� â�� ���ý��� ���ᡱ ��ư�� Ȱ��ȭ�Ǿ� ������ �α����� ���� �ʰ� >> ../result.xml
echo �ҹ����� �ý��� ���ᰡ �����Ͽ� �������� ���� ��� ������ �� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "shutdownwithoutlogon" >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "shutdownwithoutlogon" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���α׿� ���� �ʰ� �ý��� ���� ��롱�� ����� �� �ԡ����� �����Ǿ� �ִ°�� >> ../result.xml
echo [���] : ���α׿� ���� �ʰ� �ý��� ���� ��롱�� ����롱���� �����Ǿ� �ִ� ���, 0x1 >> ../result.xml
echo shutdownwithoutlogon 0x0 = ��� ���� >> ../result.xml
echo shutdownwithoutlogon 0x1 = ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "shutdownwithoutlogon" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : ���α׿� ���� �ʰ� �ý��� ���� ��롱�� ����� �� �ԡ����� �����Ǿ� �ִ°�� >> ../result.xml
)else (
	echo [���] : ���α׿� ���� �ʰ� �ý��� ���� ��롱�� ����롱���� �����Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-25^> >> ../result.xml
echo. >> ../result.xml
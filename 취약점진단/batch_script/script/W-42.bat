echo ^<W-42^> >> ../result.xml
echo ^<Name^> �ܼ� �α׿� �� ���� �������� �� ��ȣ ��� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�� ��å�� ����� �� �ԡ����� ������ ��� �� ��ȣ�� ���� ���� ������ ���Ͽ� >> ../result.xml
echo �͹̳� ����^(���� ����ũ�� ����^), Telnet �� FTP�� ���� ��Ʈ��ũ >> ../result.xml
echo ������ ���� ��ȭ�� �α׿��� �����Ͽ�, �ý��� ���ȿ� �ɰ��� ������ �� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "LimitBlankPasswordUse" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" | find "LimitBlankPasswordUse" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���ܼ� �α׿� �� ���� �������� �� ��ȣ ��� ���ѡ� ��å�� ����롱�� ��� >> ../result.xml
echo [���] : ���ܼ� �α׿� �� ���� �������� �� ��ȣ ��� ���ѡ� ��å�� ����� �� �ԡ��� ��� >> ../result.xml
echo LimitBlankPasswordUse = 0x0 ������ >> ../result.xml
echo LimitBlankPasswordUse = 0x1 ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : ���ܼ� �α׿� �� ���� �������� �� ��ȣ ��� ���ѡ� ��å�� ����� �� �ԡ��� ��� >> ../result.xml
)else (
	echo [��ȣ] : ���ܼ� �α׿� �� ���� �������� �� ��ȣ ��� ���ѡ� ��å�� ����롱�� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-42^> >> ../result.xml
echo. >> ../result.xml
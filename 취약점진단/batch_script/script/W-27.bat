echo ^<W-27^> >> ../result.xml
echo ^<Name^> ���� ���縦 �α��� �� ���� ��� ��� �ý��� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�ش� ��å�� Ȱ��ȭ �Ǿ� �ִ� ��� �������� �������� �ý��� ���Ḧ ���� >> ../result.xml
echo �Ͽ� ���� �ź� ���ݿ� �ǿ�� �� ������, ���������� �ý��� ����� ���Ͽ� >> ../result.xml
echo �ý��� �� �����Ϳ� �ջ��� ���� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "crashonauditfail" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "crashonauditfail" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ������ ���縦 �α��� �� ���� ��� ��� �ý��� ���ᡱ ��å�� ����� ���ԡ����� �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ������ ���縦 �α��� �� ���� ��� ��� �ý��� ���ᡱ ��å�� ����롱���� �Ǿ� �ִ� ��� >> ../result.xml
echo crashonauditfail 0x0 = ��� ���� >> ../result.xml
echo crashonauditfail 0x1 = ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "crashonauditfail" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (

	echo [��ȣ] : ������ ���縦 �α��� �� ���� ��� ��� �ý��� ���ᡱ ��å�� ����� ���ԡ����� �Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : ������ ���縦 �α��� �� ���� ��� ��� �ý��� ���ᡱ ��å�� ����롱���� �Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-27^> >> ../result.xml
echo. >> ../result.xml
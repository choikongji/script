echo ^<W-21^> >> ../result.xml
echo ^<Name^> �������� �׼��� �� �� �ִ� ������Ʈ�� ��� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���� ������Ʈ�� ���񽺴� �׼����� ���� ������ ����Ͽ� ������ ���� �� >> ../result.xml
echo �ٸ� �����鿡�Ե� ���� ������Ʈ�� �׼����� ����� ����� ������ >> ../result.xml
echo ������Ʈ���� ���� ���Ѽ����� �߸��Ǿ� �ִ� ��� ���ݿ��� ������Ʈ���� ���� >> ../result.xml
echo ������ ������ ���� �� ����� ���� >> ../result.xml
echo -������Ʈ�� ������ ��ִ� ��ü �ý��ۿ� ������ �� �� �־� ���񽺰źΰ���^(DoS^) ���ݿ� �̿�� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "Start"  >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /v "Start" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : Remote Registry Service�� �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : Remote Registry Service�� ��� ���� ��� >> ../result.xml
echo Start    REG_DWORD    0x2 = �ڵ� >> ../result.xml
echo Start    REG_DWORD    0x3 = ���� >> ../result.xml
echo Start    REG_DWORD    0x4 = ��� ���� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /v "Start" | find "0x4" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : Remote Registry Service�� �����Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : Remote Registry Service�� ��� ���� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-21^> >> ../result.xml
echo. >> ../result.xml
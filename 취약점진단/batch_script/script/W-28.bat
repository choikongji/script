echo ^<W-28^> >> ../result.xml
echo ^<Name^> SAM ������ ������ �͸� ���� ��� �� �� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo Windows������ �͸��� ����ڰ� ������ ����^(�����, ��ǻ�� �� �׷�^)�� >> ../result.xml
echo ��Ʈ��ũ ���� �̸��� ���� �۾��� ������ �� �����Ƿ� SAM^(���Ȱ���������^) >> ../result.xml
echo ������ ������ �͸� ���Ű� ���� ��� �������� ����ڰ� ���� �̸� ����� >> ../result.xml
echo Ȯ���ϰ� �� ������ ����Ͽ� ��ȣ�� �����ϰų� ��ȸ ������ ���ݱ���� >> ../result.xml
echo ������ �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "restrictanonymoussam" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "restrictanonymoussam" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �ش� ���� �ɼ� ���� ���� �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �ش� ���� �ɼ� ���� ���� �Ǿ� ���� �ʴ� ��� >> ../result.xml
echo restrictanonymoussam 0x0 = ��� ���� >> ../result.xml
echo restrictanonymoussam 0x1 = ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "restrictanonymoussam" | find "0x1" >nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : �ش� ���� �ɼ� ���� ���� �Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : �ش� ���� �ɼ� ���� ���� �Ǿ� ���� �ʴ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-28^> >> ../result.xml
echo. >> ../result.xml
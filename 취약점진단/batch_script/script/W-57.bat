echo ^<W-57^> >> ../result.xml
echo ^<Name^> ����ڰ� ������ ����̹��� ��ġ�� �� ���� �� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -������ ������ ����̹��� ��ġ�ϴ� ��� �������� ����ڰ� ���������� >> ../result.xml
echo �߸��� ������ ����̹��� ��ġ�Ͽ� ��ǻ�͸� �ջ��ų �� ������, ������ >> ../result.xml
echo ����̹��� ������ �Ǽ� �ڵ带 ��ġ�� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" ^| find "AddPrinterDrivers" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" | find "AddPrinterDrivers" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ������ڰ� ������ ����̹��� ��ġ�� �� ���� �ԡ� ��å >> ../result.xml
echo [���] : ������ڰ� ������ ����̹��� ��ġ�� �� ���� �ԡ� ��å�� ����� �� �ԡ��� ��� >> ../result.xml
echo AddPrinterDrivers 0x0 = ��� ���� >> ../result.xml
echo AddPrinterDrivers 0x1 = ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" | find "0x1" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : ������ڰ� ������ ����̹��� ��ġ�� �� ���� �ԡ� ��å >> ../result.xml
)else (
	echo [���] : ������ڰ� ������ ����̹��� ��ġ�� �� ���� �ԡ� ��å�� ����� �� �ԡ��� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-57^> >> ../result.xml
echo. >> ../result.xml
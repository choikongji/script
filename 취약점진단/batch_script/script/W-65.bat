echo ^<W-65^> >> ../result.xml
echo ^<Name^> �������α׷� ��� �м� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -������ ���� �� �ʹ� ���� �������α׷��� ���ÿ� ����Ǹ� �ӵ��� ���ϵǴ� >> ../result.xml
echo ������ �߻��ϸ�, �����ڰ� �ɾ���� �Ǽ� ���α׷��̳� ��ŷ ���� ����Ǿ� >> ../result.xml
echo �ý��ۿ� ���ظ� �� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo ^<���� ����� ���ӿ� ���� ���α׷� ������Ʈ��^(�ش� ����� �������� �α׿� �� �Ź� �����^)^> >> ../result.xml
echo #reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /s >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /s >> ../result.xml
echo. >> ../result.xml
echo ^<���� ����� ��ȸ�� ���� ���α׷� ������Ʈ��^(�ش� ����� �������� �α׿� �� �ѹ� ���� �� ������^)^> >> ../result.xml
echo #reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s >> ../result.xml
echo. >> ../result.xml
echo ^<��ü ����� ���ӿ� ���� ���α׷� ������Ʈ��^(�α׿� �� �Ź� �����^)^> >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /s >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /s >> ../result.xml
echo. >> ../result.xml
echo ^<��ü ����� ��ȸ�� ���� ���α׷� ������Ʈ��^(���� �α׿� �� �ѹ� ���� �� ������^)^> >> ../result.xml
echo # reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml 
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �������α׷� ����� ���������� �˻��ϰ� ���ʿ��� ���� üũ�������� ��� >> ../result.xml
echo [���] : �������α׷� ����� ���������� �˻����� �ʰ�, ���� �� ���ʿ��� ���񽺵� ����ǰ� �ִ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

set flag=True
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /s | find /i "REG_" > nul
if !ERRORLEVEL! EQU 0 (
	set flag=False
)

reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s | find /i "REG_" > nul
if !ERRORLEVEL! EQU 0 (
	set flag=False
)

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /s | find /i "REG_" > nul
if !ERRORLEVEL! EQU 0 (
	set flag=False
)

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s | find /i "REG_" > nul
if !ERRORLEVEL! EQU 0 (
	set flag=False
)

if "!flag!" EQU "True" (
	echo [��ȣ] �������α׷� ��Ͽ� ���ʿ��� ���񽺰� �����Ƿ� ��ȣ�� >> ../result.xml
) else (
	echo [���ͺ�] �������α׷� ��Ͽ� ���ʿ��� ���� �ִ��� Ȯ�� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-65^> >> ../result.xml

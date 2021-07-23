echo ^<W-54^> >> ../result.xml
echo ^<Name^> �̺�Ʈ �α� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo �̺�Ʈ �α� ������ ũ�Ⱑ ������� ���� ��� �߿� �αװ� ������� ���� >> ../result.xml
echo ������ ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml 
echo ##�ִ� �α� ũ�� >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "MaxSize" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "MaxSize" >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "MaxSize" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "MaxSize" >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "MaxSize" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "MaxSize" >> ../result.xml
echo. >> ../result.xml

echo ##�ִ� �̺�Ʈ �α� ũ�⿡ ������ �� >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "Retention" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "Retention" | find "0xffffffff" >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "Retention" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "Retention" | find "0xffffffff" >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "Retention" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "Retention" | find "0xffffffff" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �ִ� �α� ũ�� ��10,240KB �̻����� ����, �αװ� �� ���� �α� ����,�̺�Ʈ�� ��������� OR �̺�Ʈ ����� ����^(�������� �α� �����^)  >> ../result.xml
echo [���] : �ִ� �α� ũ�� ��10,240KB �̸������� ����, �̺�Ʈ ��� �Ⱓ�� ��90�� ���ϡ��� ������ ���  >> ../result.xml
echo Application = ���� ���α׷�, Security = ����, System = �ý��� >> ../result.xml
echo MaxSize�� 0xa00000 �̻��̿��� ��ȣ >> ../result.xml
echo Retention 0x0 = �ʿ��� ��� �̺�Ʈ �����^(���� ������ �̺�Ʈ ����^) >> ../result.xml
echo Retention 0xffffffff = �αװ� �� ���� �α� ����, �̺�Ʈ�� ����� ���� OR �̺�Ʈ ����� ����^(�������� �α� �����^) >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

set flag=False

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "MaxSize" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Application" /v "Retention" | find "0xffffffff" > nul
if !ERRORLEVEL! EQU 1 (
	echo [���] : �ִ� �α� ũ�� ��10,240KB �̸������� ����, �̺�Ʈ ��� �Ⱓ�� ��90�� ���ϡ��� ������ ��� >> ../result.xml
	goto end
)else (
	if !b! GEQ 0xa00000 (
		set flag=True
	)
)

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "MaxSize" > test1.txt
for /f "tokens=3 delims= " %%a in (test1.txt) do (
	for %%b in (%%a) do (
		set c=%%b
	)
)

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\Security" /v "Retention" | find "0xffffffff" > nul
if !ERRORLEVEL! EQU 1 (
	echo [���] : �ִ� �α� ũ�� ��10,240KB �̸������� ����, �̺�Ʈ ��� �Ⱓ�� ��90�� ���ϡ��� ������ ��� >> ../result.xml
	goto end
)else (
	if !b! GEQ 0xa00000 (
		set flag=True
	)
)



reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "MaxSize" > test2.txt
for /f "tokens=3 delims= " %%a in (test2.txt) do (
	for %%b in (%%a) do (
		set d=%%b
	)
)

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\EventLog\System" /v "Retention" | find "0xffffffff" > nul
if !ERRORLEVEL! EQU 1 (
	echo [���] : �ִ� �α� ũ�� ��10,240KB �̸������� ����, �̺�Ʈ ��� �Ⱓ�� ��90�� ���ϡ��� ������ ��� >> ../result.xml
	goto end
)else (
	if !b! GEQ 0xa00000 (
		set flag=True
	)
)

if "!flag!" EQU "True" (
	echo [��ȣ] : �ִ� �α� ũ�� ��10,240KB �̻����� ����, �αװ� �� ���� �α� ����,�̺�Ʈ�� ��������� OR �̺�Ʈ ����� ����^(�������� �α� �����^)  >> ../result.xml
)else (
	echo [���] : �ִ� �α� ũ�� ��10,240KB �̸������� ����, �̺�Ʈ ��� �Ⱓ�� ��90�� ���ϡ��� ������ ��� >> ../result.xml
)

:end
echo ^</Result^> >> ../result.xml
echo ^</W-54^> >> ../result.xml
echo. 
if exist test*.txt del test*.txt
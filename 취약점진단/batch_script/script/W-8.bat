echo ^<W-8^> >> ../result.xml
echo ^<Name^> �ϵ��ũ �⺻ ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Windows�� ���α׷� �� ���񽺸� ��Ʈ��ũ�� ��ǻ�� ȯ�濡�� �����ϱ� ���� >> ../result.xml
echo �ý��� �⺻ ���� �׸��� �ڵ����� ������. �̸� �������� ������ ���ΰ��ڰ� >> ../result.xml
echo ��� �ý��� �ڿ��� ������ �� �ִ� ������ ��Ȳ�� �߻��� �� ������ >> ../result.xml
echo �̷��� ���� ����� ��θ� �̿��Ͽ� ���̷����� ħ���� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net share ^| findstr /v "IPC" ^| find "$" >> ../result.xml
echo. >> ../result.xml
net share | findstr /v "IPC" | find "$" >> ../result.xml
echo reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s ^| find /i "AutoShareServer" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s | find /i "AutoShareServer" >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s ^| find /i "AutoShareWks" >> ../result.xml
echo reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s | find /i "AutoShareWks" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ������Ʈ���� AutoShareServer ^(WinNT: AutoShareWks^)�� 0�̸� �⺻ ������ �������� �ʴ� ��� >> ../result.xml
echo [���] : ������Ʈ����AutoShareServer ^(WinNT: AutoShareWks^)�� 1�̰ų� �⺻ ������ �����ϴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

set flag=False

reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s | find /i "AutoShareServer" | find "0" >> ../result.xml
if !ERRORLEVEL! EQU 0 (
	set flag=True
	goto auto
)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s | find /i "AutoShareWks" | find "0" >> ../result.xml
if !ERRORLEVEL! EQU 0 (
	set flag=True
	goto auto
)

:auto
net share | findstr /v "IPC" | find "$" > nul
if not !ERRORLEVEL! EQU 0 (
	if "!flag!" EQU "True" (
		echo [��ȣ] : ������Ʈ���� AutoShareServer ^(WinNT: AutoShareWks^)�� 0�̸� �⺻ ������ �������� �ʴ� ��� >> ../result.xml
	)else (
		echo [���] : ������Ʈ����AutoShareServer ^(WinNT: AutoShareWks^)�� 1�� ��� >> ../result.xml
	)
)else (
	echo [���] : �⺻ ������ �����ϴ� ��� >> ../result.xml
)

echo ^</Result^> >> ../result.xml
echo ^</W-8^> >> ../result.xml
echo. >> ../result.xml

echo ^<W-64^> >> ../result.xml
echo ^<Name^> ��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�⺻������ ������ �������� ������ ��ȣ ���� �ֱⰡ �������� ���� ��� >> ../result.xml
echo �����ڰ� ���� ������ �����Ͽ� �ϳ� �̻��� ��ǻ�� ���� ��ȣ�� �����ϱ⿡ >> ../result.xml
echo ����� �ð��� ������ �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "DisablePasswordChange" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "DisablePasswordChange" | find "DisablePasswordChange" >> ../result.xml
echo #reg query "MaximumPasswordAge" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "MaximumPasswordAge" | find "MaximumPasswordAge" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : "��ǻ�� ���� ��ȣ ���� ��� �� ��" ��å�� ������� ������, "��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ" ��å�� "90��"�� �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : "��ǻ�� ���� ��ȣ ���� ��� �� ��" ��å�� ����롱���� �����Ǿ� �ְų� "��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ" ��å�� ��90�ϡ� �� �����Ǿ� �������� ��� >> ../result.xml
echo DisablePasswordChange 0x0 = ��� ���� >> ../result.xml
echo DisablePasswordChange 0x1 = ��� >> ../result.xml
echo MaximumPasswordAge �Ⱓ >> ../result.xml
echo ^</Comment^> >> ../result.xml

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "MaximumPasswordAge" | find "MaximumPasswordAge" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "DisablePasswordChange" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	if !b! LEQ 0x5a (
		if !b! GTR 0x0 (
			echo [��ȣ] : "��ǻ�� ���� ��ȣ ���� ��� �� ��" ��å�� ������� ������, "��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ" ��å�� "90��"�� �����Ǿ� �ִ� ��� >> ../result.xml
		)else (
			echo [���] : "��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ" ��å�� ��90�ϡ� �� �����Ǿ� �������� ��� >> ../result.xml
		)
	)else (
		echo [���] : "��ǻ�� ���� ��ȣ �ִ� ��� �Ⱓ" ��å�� ��90�ϡ� �� �ʰ��� ��� >> ../result.xml
	)
)else (
	echo [���] : "��ǻ�� ���� ��ȣ ���� ��� �� ��" ��å�� ����롱���� �����Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-64^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt

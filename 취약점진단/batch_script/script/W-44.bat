echo ^<W-44^> >> ../result.xml
echo ^<Name^> �͹̳� ���� ��ȣȭ ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���� ���� �ÿ� ���� ��ȣȭ ������ ������ ��� �������� ����ڿ� ���� >> ../result.xml
echo ������ Ŭ���̾�Ʈ�� �ְ�޴� ������ ����� ����� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start find "TermService" >> ../result.xml
echo. >> ../result.xml
net start | find "TermService" >> ../result.xml
echo #reg query "MinEncryptionLevel" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MinEncryptionLevel" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �͹̳� ���� ��ȣȭ ������ ������ ���ء� ���� ������ ��� >> ../result.xml
echo [��ȣ] : �͹̳� ���� ��ȣȭ ������ ��Ŭ���̾�Ʈ��ȣȯ ����^(�߰�^)�� �̻����� ������ ��� >> ../result.xml
echo [���] : �͹̳� ���񽺸� ����ϰ� ��ȣȭ ������ �������� ���� ������ ��� >> ../result.xml
echo MinEncryptionLevel    REG_DWORD    0x1 = ���� >> ../result.xml
echo MinEncryptionLevel    REG_DWORD    0x2 = Ŭ���̾�Ʈ��ȣȯ ����^(�߰�^) >> ../result.xml
echo MinEncryptionLevel    REG_DWORD    0x3 = �������� >> ../result.xml
echo ^</Comment^> >> ../result.xml

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MinEncryptionLevel" | find "MinEncryptionLevel" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
net start | find "TermService" > nul
if !ERRORLEVEL! EQU 0 (
	if "!b!" EQU "0x3" (
		echo [��ȣ] : �͹̳� ���� ��ȣȭ ������ ������ ���ء� ���� ������ ��� >> ../result.xml
	)else (
		if "!b!" EQU "0x2" (
			echo [��ȣ] : �͹̳� ���� ��ȣȭ ������ ��Ŭ���̾�Ʈ��ȣȯ ����^(�߰�^)�� �̻����� ������ ��� >> ../result.xml
		)else (
			echo [���] : �͹̳� ���񽺸� ����ϰ� ��ȣȭ ������ �������� ���� ������ ��� >> ../result.xml
		)
	)
)else (
	echo [��ȣ] : �͹̳� ���񽺸� ����ϰ� ���� ���� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-44^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt


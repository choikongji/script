echo ^<W-62^> >> ../result.xml
echo ^<Name^> ���� ä�� ������ ������ ��ȣȭ �Ǵ� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���� ä���� ��ȣȭ ���� ���� ��� ���� Ʈ���� ������ ����, �ݺ� ���� >> ../result.xml
echo �� ��Ÿ ������ ��Ʈ��ũ ���� ���� ���� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "RequireSignOrSeal" >> ../result.xml
echo. >> ../result.xml 
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "RequireSignOrSeal" | find "RequireSignOrSeal" >> ../result.xml
echo #reg query "SealSecureChannel" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SealSecureChannel" | find "SealSecureChannel" >> ../result.xml
echo #reg query "SignSecureChannel" >> ../result.xml
echo. >> ../result.xml >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SignSecureChannel" | find "SignSecureChannel" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �Ʒ� 3���� ��å�� "���"���� �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �Ʒ� 3���� ��å�� "��� �� ��" ���� �Ǿ� �ִ� ��� >> ../result.xml
echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ����^(�׻�^) >> ../result.xml
echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ^(������ ���^) >> ../result.xml
echo - ������ ������: ���� ä�� ������ ������ ����^(������ ���^) >> ../result.xml
echo RequireSignOrSeal ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ����^(�׻�^) 0x0 = ��� ���� >> ../result.xml
echo RequireSignOrSeal ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ����^(�׻�^) 0x1 = ��� >> ../result.xml
echo SealSecureChannel ������ ������: ���� ä�� �����͸� ������ ��ȣȭ^(������ ���^) 0x0 = ��� ���� >> ../result.xml
echo SealSecureChannel ������ ������: ���� ä�� �����͸� ������ ��ȣȭ^(������ ���^) 0x1 = ��� >> ../result.xml
echo SignSecureChannel ������ ������: ���� ä�� �����͸� ������ ����^(������ ���^) 0x0 = ��� ���� >> ../result.xml
echo SignSecureChannel ������ ������: ���� ä�� �����͸� ������ ����^(������ ���^) 0x1 = ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SignSecureChannel" | find "SignSecureChannel" > test.txt 
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set sing=%%b
	)
)
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "RequireSignOrSeal" | find "RequireSignOrSeal" >test1.txt
for /f "tokens=3 delims= " %%a in (test1.txt) do (
	for %%b in (%%a) do (
		set req=%%b
	)
)
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SealSecureChannel" | find "0x1" > nul
if !ERRORLEVEL! EQU 0 (
	if "!sing!" EQU "0x1" (
		if "!req!" EQU "0x1" (
			echo [��ȣ] : �Ʒ� 3���� ��å�� "���"���� �Ǿ� �ִ� ��� >> ../result.xml
 		)else (
			echo [���] : �Ʒ� 3���� ��å�� "��� �� ��" ���� �Ǿ� �ִ� ��� >> ../result.xml
			echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ����^(�׻�^) >> ../result.xml
			echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ^(������ ���^) >> ../result.xml
			echo - ������ ������: ���� ä�� ������ ������ ����^(������ ���^) >> ../result.xml
		)
	)else (
		echo [���] : �Ʒ� 3���� ��å�� "��� �� ��" ���� �Ǿ� �ִ� ��� >> ../result.xml
		echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ����^(�׻�^) >> ../result.xml
		echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ^(������ ���^) >> ../result.xml
		echo - ������ ������: ���� ä�� ������ ������ ����^(������ ���^) >> ../result.xml
	)
)else (
	echo [���] : �Ʒ� 3���� ��å�� "��� �� ��" ���� �Ǿ� �ִ� ��� >> ../result.xml
	echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ �Ǵ� ����^(�׻�^) >> ../result.xml
	echo - ������ ������: ���� ä�� �����͸� ������ ��ȣȭ^(������ ���^) >> ../result.xml	
	echo - ������ ������: ���� ä�� ������ ������ ����^(������ ���^) >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-62^> >> ../result.xml
echo. >> ../result.xml
if exist test*.txt del test*.txt


echo ^<W-58^> >> ../result.xml
echo ^<Name^> ���� ������ �ߴ��ϱ� ���� �ʿ��� ���޽ð� ^</Name^>  >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -SMB ���ǿ����� ���� ���ҽ��� ����ϸ�, null^(����^) ���Ǽ��� ������ ���� >> ../result.xml
echo �ӵ��� �������ų� ������ ������ �߻���ų �� �����Ƿ� �����ڴ� �̸� >> ../result.xml
echo �ǿ��Ͽ� SMB ������ �ݺ� �����Ͽ� ������ SMB ���񽺰� �������ų� ���� >> ../result.xml
echo ���� �ʰ� �Ͽ� ���� �ź� ������ ���� �� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "enableforcedlogoff" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "enableforcedlogoff" >> ../result.xml
echo #reg query "autodisconnect" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "autodisconnect" >> ../result.xml

echo ]]^> ^</Data^> >> ../result.xml
echo. >> ../result.xml

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "autodisconnect" | find "autodisconnect" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���α׿� �ð��� ����Ǹ� Ŭ���̾�Ʈ ���� ���⡱ ��å�� ����롱����, ������ ������ �ߴ��ϱ� ���� �ʿ��� ���� �ð��� ��å�� ��15�С����� ������ ��� >> ../result.xml
echo [���] : ������ ������ �ߴ��ϱ� ���� �ʿ��� ���� �ð��� ��å�� ��15�С����μ��� �Ǿ� ���� ���� ��� >> ../result.xml
echo enableforcedlogoff = 0x0 ��� ���� >> ../result.xml
echo enableforcedlogoff = 0x1 ��� >> ../result.xml
echo autodisconnect �ð� >> ../result.xml
echo ^</Comment^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "enableforcedlogoff" | find "0x1" > nul
if !ERRORLEVEL! EQU 0 (
	if "!b!" EQU "0xf" (
		echo [��ȣ] : ���α׿� �ð��� ����Ǹ� Ŭ���̾�Ʈ ���� ���⡱ ��å�� ����롱����, ������ ������ �ߴ��ϱ� ���� �ʿ��� ���� �ð��� ��å�� ��15�С����� ������ ��� >> ../result.xml
	)else (
		echo [���] : ������ ������ �ߴ��ϱ� ���� �ʿ��� ���� �ð��� ��å�� ��15�С����μ��� �Ǿ� ���� ���� ��� >> ../result.xml
	)
)else (
	echo [���] : ���α׿� �ð��� ����Ǹ� Ŭ���̾�Ʈ ���� ���⡱ ��å�� ����� �� �ԡ����� �Ǿ� ���� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-58^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
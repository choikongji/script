echo ^<W-24^> >> ../result.xml
echo ^<Name^> ȭ�麸ȣ�� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -ȭ�麸ȣ�� ������ ���� ���� ��� ����ڰ� �ڸ��� ��� ���̿� ������ >> ../result.xml
echo ����ڰ� �ش� �ý��ۿ� �����Ͽ� �߿� ������ ���� �ϰų�, �������� ������ >> ../result.xml
echo ���� �ý��� ��� �ǿ����� ��ĥ �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "HKCU\Control Panel\Desktop" /s ^| findstr /i "ScreenSave SCRNSAVE" >> ../result.xml
echo. >> ../result.xml
reg query "HKCU\Control Panel\Desktop" /s | findstr /i "ScreenSave SCRNSAVE" >> ../result.xml
echo #reg query "HKCU\Control Panel\Desktop" /s ^| find /i "SCRNSAVE.EXE" >> ../result.xml
reg query "HKCU\Control Panel\Desktop" /s | find /i "SCRNSAVE.EXE" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ȭ�� ��ȣ�⸦ �����ϰ� ��� �ð��� 10�� ������ ������ �����Ǿ� >> ../result.xml
echo ������, ȭ�� ��ȣ�� ������ ���� ��ȣ�� ����ϴ� ��� >> ../result.xml
echo [���] : ȭ�� ��ȣ�Ⱑ �������� �ʾҰų� ��ȣ�� ������� ���� ��� �Ǵ�, ȭ�� >> ../result.xml
echo ��ȣ�� ��� �ð��� 10���� �ʰ��� ������ �����Ǿ� �ִ� ��� >> ../result.xml
echo ScreenSaveActive = 1(ȭ�� ��ȣ�� �۵� ����), ��ȣ >> ../result.xml
echo ScreenSaverIsSecure = 1(�ٽ� ������ �� �α׿� ȭ�� ǥ��), ��ȣ >> ../result.xml
echo ScreenSaveTimeOut = 600 ����(��� �ð�, ���� 1��), ��ȣ >> ../result.xml
echo ȭ�� ��ȣ�� ������ �ѹ��� ������� ���� ���, ������Ʈ�� ���� �������� �����Ƿ� ��� >> ../result.xml
echo ScreenSaveActive ���� 1�̴��� SCRNSAVE.EXE ���� ���� ���, >> ../result.xml
echo ȭ�� ��ȣ�� ������ ����Ǿ� ���� �����Ƿ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

reg query "HKCU\Control Panel\Desktop" /s | find /i "ScreenSaveActive" | find "0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : ȭ�� ��ȣ�� ������ ����Ǿ� ���� ���� ��� >> ../result.xml
	goto end
)

reg query "HKCU\Control Panel\Desktop" /s | find /i "SCRNSAVE.EXE" > nul
if !ERRORLEVEL! NEQ 0 (
	echo [���] : ȭ�� ��ȣ�� ������ ����Ǿ� ���� ���� ��� >> ../result.xml
	goto end
)

reg query "HKCU\Control Panel\Desktop" /s | find /i "ScreenSaverIsSecure" | find "0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : ȭ�� ��ȣ�Ⱑ �������� �ʾҰų� ��ȣ�� ������� ���� ��� �Ǵ�, ȭ�� >> ../result.xml
	echo ��ȣ�� ��� �ð��� 10���� �ʰ��� ������ �����Ǿ� �ִ� ��� >> ../result.xml
	goto end
)

reg query "HKCU\Control Panel\Desktop" /s | find /i "ScreenSaveTimeOut" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do set a=%%a
if !a! GTR 600 (
	echo [���] ȭ�� ��ȣ�� ������ 10�� �̻��� ������ �����Ǿ� �ְų� ������ ���� ��ȣ�� ����ϰ� ���� �����Ƿ� ����� >> ../result.xml
	goto end
)

echo [��ȣ] ȭ�� ��ȣ�� ������ 10�� ������ ������ �����Ǿ� ������, ������ ���� ��ȣ�� ����ϰ� �����Ƿ� ��ȣ�� >> ../result.xml


:end
echo ^</Result^> >> ../result.xml
echo ^</W-24^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt


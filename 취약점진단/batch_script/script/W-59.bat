@echo off

echo ^<W-59^> >> ../result.xml
echo ^<Name^> ��� �޽��� ���� ^</Name^>  >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo �α׿� ��� �޽����� ���� ��� �������� ����ڿ��� �����ڰ� ������ >> ../result.xml
echo ���ȼ������� �ý����� ��ȣ�ϰ� ������, �������� Ȱ���� �ֽ��ϰ� �ִٴ� >> ../result.xml
echo ������ ��� ��ų �� ���� �������� ���� ��ȸ�� ������ ��� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /s ^| find /i "Legalnoticetext" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /s | find /i "Legalnoticetext" > nul
echo reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /s ^| find /i "Legalnoticecaption" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /s | find /i "Legalnoticecaption" > nul
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �α��� ��� �޽��� ���� �� ������ �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �α��� ��� �޽��� ���� �� ������ �����Ǿ� ���� ���� ��� >> ../result.xml
echo *Legalnoticetext = 1,"��� �޽��� ����" >> ../result.xml
echo *Legalnoticecaption = 1,"��� �޽��� ����" >> ../result.xml
echo *����� �ѱ۷� �ۼ��Ǿ� �ִٸ� ������ ���� �� �����Ƿ� ��ȣ >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

for /f "tokens=2 delims=REG_SZ" %%a in ('reg query ^"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System^" /s ^| find /i ^"Legalnoticetext^"') do (
	echo %%a | find /i "echo" > nul
	if !ERRORLEVEL! EQU 0 (
		echo [���] : �α��� ��� �޽��� ���� �� ������ �����Ǿ� ���� ���� ��� >> ../result.xml
		goto end
	)
)
for /f "tokens=2 delims=REG_SZ" %%a in ('reg query ^"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System^" /s ^| find /i ^"Legalnoticecaption^"') do (
	echo %%a | find /i "echo" > nul
	if !ERRORLEVEL! EQU 0 (
		echo [���] : �α��� ��� �޽��� ���� �� ������ �����Ǿ� ���� ���� ��� >> ../result.xml
		goto end
	)
)
echo [��ȣ] : �α��� ��� �޽��� ���� �� ������ �����Ǿ� �ִ� ��� >> ../result.xml
:end
echo ^</Result^> >> ../result.xml
echo ^</W-59^> >> ../result.xml
echo. >> ../result.xml

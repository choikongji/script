echo ^<W-48^> >> ../result.xml
echo ^<Name^> DNS ���� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml

echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "DNS Server" >> ../result.xml
net start | find /i "DNS Server" >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s ^| find "AllowUpdate" >> ../result.xml
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find "AllowUpdate" > nul
if !ERRORLEVEL! EQU 0 (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find "AllowUpdate" >> ../result.xml
)
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : DNS ���񽺸� ������� �ʰų� ���� ������Ʈ ������^(�ƴϿ�^)������ ���� >> ../result.xml
echo �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ���񽺸� ����ϸ� ���� ������Ʈ�� �����Ǿ� �ִ� ��� >> ../result.xml
echo *AllowUpdate = ���� ������Ʈ ��뿩�� >> ../result.xml
echo *AllowUpdate = 0^(������^) - ��ȣ >> ../result.xml
echo *AllowUpdate = 1^(�����^) - ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

net start | find "DNS Server" > nul
if !ERRORLEVEL! EQU 1 (
	echo [N/A] DNS ���񽺸� ������� �����Ƿ� �ش���� >> ../result.xml
) else (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find "AllowUpdate" | findstr /i "0x0" > nul
	if !ERRORLEVEL! EQU 0 (
		echo [��ȣ] DNS ���񽺸� ����ϳ� ���� ������Ʈ ������ "����"^(�ƴϿ�^)�� �����Ǿ� �����Ƿ� ��ȣ�� >> ../result.xml
	) else (
		echo [���] DNS ���񽺸� ����ϸ� ���� ������Ʈ ������ �Ǿ� �����Ƿ� ����� >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-48^> >> ../result.xml
echo. >> ../result.xml
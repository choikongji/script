echo ^<W-9^> >> ../result.xml
echo ^<Name^> ���ʿ��� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�ý��ۿ� �⺻������ ��ġ�Ǵ� ���ʿ��� ��� ���񽺵��� ���ŵ��� ���� ��� >> ../result.xml
echo �ش� ������ ��������� ���� ������ �����ϸ�, ��Ʈ��ũ ������ ��� >> ../result.xml
echo ���� ��Ʈ�� ���� �ܺ� ħ���� ���ɼ��� ������ >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| findstr "���ʿ��� ����" >> ../result.xml
net start | findstr /C:"Alerter" /C:"Automatic Updates" /C:"Clipbook" /C:"Computer Browser" /C:"Cryptographic Services" /C:"DHCP Client" /C:"Distributed Link Tracking Client Server" /C:"Error reporting Service" /C:"Human Interface Device Access" /C:"IMAPI CD-Burning COM Service" /C:"Messenger" /C:"NetMeeting Remote Desktop Sharing" /C:"Portable Media Serial Numbe" /C:"Print Spooler" /C:"Remote Registry" /C:"Simple TCP/IP Services" /C:"Wireless Zero Configuration" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �Ϲ������� ���ʿ��� ���񽺰� �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �Ϲ������� ���ʿ��� ���񽺰� ���� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net start | findstr /C:"Alerter" /C:"Automatic Updates" /C:"Clipbook" /C:"Computer Browser" /C:"Cryptographic Services" /C:"DHCP Client" /C:"Distributed Link Tracking Client Server" /C:"Error reporting Service" /C:"Human Interface Device Access" /C:"IMAPI CD-Burning COM Service" /C:"Messenger" /C:"NetMeeting Remote Desktop Sharing" /C:"Portable Media Serial Numbe" /C:"Print Spooler" /C:"Remote Registry" /C:"Simple TCP/IP Services" /C:"Wireless Zero Configuration" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : �Ϲ������� ���ʿ��� ���񽺰� ���� ���� ��� >> ../result.xml
)else (
	echo [��ȣ] : �Ϲ������� ���ʿ��� ���񽺰� �����Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-9^> >> ../result.xml
echo. >> ../result.xml

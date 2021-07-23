echo ^<W-9^> >> ../result.xml
echo ^<Name^> 불필요한 서비스 제거 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -시스템에 기본적으로 설치되는 불필요한 취약 서비스들이 제거되지 않은 경우 >> ../result.xml
echo 해당 서비스의 취약점으로 인한 공격이 가능하며, 네트워크 서비스의 경우 >> ../result.xml
echo 열린 포트를 통한 외부 침입의 가능성이 존재함 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| findstr "불필요한 서비스" >> ../result.xml
net start | findstr /C:"Alerter" /C:"Automatic Updates" /C:"Clipbook" /C:"Computer Browser" /C:"Cryptographic Services" /C:"DHCP Client" /C:"Distributed Link Tracking Client Server" /C:"Error reporting Service" /C:"Human Interface Device Access" /C:"IMAPI CD-Burning COM Service" /C:"Messenger" /C:"NetMeeting Remote Desktop Sharing" /C:"Portable Media Serial Numbe" /C:"Print Spooler" /C:"Remote Registry" /C:"Simple TCP/IP Services" /C:"Wireless Zero Configuration" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 일반적으로 불필요한 서비스가 중지되어 있는 경우 >> ../result.xml
echo [취약] : 일반적으로 불필요한 서비스가 구동 중인 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net start | findstr /C:"Alerter" /C:"Automatic Updates" /C:"Clipbook" /C:"Computer Browser" /C:"Cryptographic Services" /C:"DHCP Client" /C:"Distributed Link Tracking Client Server" /C:"Error reporting Service" /C:"Human Interface Device Access" /C:"IMAPI CD-Burning COM Service" /C:"Messenger" /C:"NetMeeting Remote Desktop Sharing" /C:"Portable Media Serial Numbe" /C:"Print Spooler" /C:"Remote Registry" /C:"Simple TCP/IP Services" /C:"Wireless Zero Configuration" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : 일반적으로 불필요한 서비스가 구동 중인 경우 >> ../result.xml
)else (
	echo [양호] : 일반적으로 불필요한 서비스가 중지되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-9^> >> ../result.xml
echo. >> ../result.xml

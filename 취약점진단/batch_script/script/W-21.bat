echo ^<W-21^> >> ../result.xml
echo ^<Name^> 원격으로 액세스 할 수 있는 레지스트리 경로 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -원격 레지스트리 서비스는 액세스에 대한 인증이 취약하여 관리자 계정 외 >> ../result.xml
echo 다른 계정들에게도 원격 레지스트리 액세스를 허용할 우려가 있으며 >> ../result.xml
echo 레지스트리에 대한 권한설정이 잘못되어 있는 경우 원격에서 레지스트리를 통해 >> ../result.xml
echo 임의의 파일을 실행 할 우려가 있음 >> ../result.xml
echo -레지스트리 서비스의 장애는 전체 시스템에 영향을 줄 수 있어 서비스거부공격^(DoS^) 공격에 이용될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "Start"  >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /v "Start" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : Remote Registry Service가 중지되어 있는 경우 >> ../result.xml
echo [취약] : Remote Registry Service가 사용 중인 경우 >> ../result.xml
echo Start    REG_DWORD    0x2 = 자동 >> ../result.xml
echo Start    REG_DWORD    0x3 = 수동 >> ../result.xml
echo Start    REG_DWORD    0x4 = 사용 안함 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /v "Start" | find "0x4" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : Remote Registry Service가 중지되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : Remote Registry Service가 사용 중인 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-21^> >> ../result.xml
echo. >> ../result.xml
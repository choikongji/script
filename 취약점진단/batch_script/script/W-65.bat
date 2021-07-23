echo ^<W-65^> >> ../result.xml
echo ^<Name^> 시작프로그램 목록 분석 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -윈도우 부팅 시 너무 많은 시작프로그램이 동시에 실행되면 속도가 저하되는 >> ../result.xml
echo 문제가 발생하며, 공격자가 심어놓은 악성 프로그램이나 해킹 툴이 실행되어 >> ../result.xml
echo 시스템에 피해를 줄 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo ^<개인 사용자 지속용 시작 프로그램 레지스트리^(해당 사용자 계정으로 로그온 시 매번 실행됨^)^> >> ../result.xml
echo #reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /s >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /s >> ../result.xml
echo. >> ../result.xml
echo ^<개인 사용자 일회용 시작 프로그램 레지스트리^(해당 사용자 계정으로 로그온 시 한번 실행 후 삭제됨^)^> >> ../result.xml
echo #reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s >> ../result.xml
echo. >> ../result.xml
echo ^<전체 사용자 지속용 시작 프로그램 레지스트리^(로그온 시 매번 실행됨^)^> >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /s >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /s >> ../result.xml
echo. >> ../result.xml
echo ^<전체 사용자 일회용 시작 프로그램 레지스트리^(다음 로그온 시 한번 실행 후 삭제됨^)^> >> ../result.xml
echo # reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml 
echo ^<Comment^> >> ../result.xml
echo [양호] : 시작프로그램 목록을 정기적으로 검사하고 불필요한 서비스 체크해제를한 경우 >> ../result.xml
echo [취약] : 시작프로그램 목록을 정기적으로 검사하지 않고, 부팅 시 불필요한 서비스도 실행되고 있는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

set flag=True
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /s | find /i "REG_" > nul
if !ERRORLEVEL! EQU 0 (
	set flag=False
)

reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s | find /i "REG_" > nul
if !ERRORLEVEL! EQU 0 (
	set flag=False
)

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /s | find /i "REG_" > nul
if !ERRORLEVEL! EQU 0 (
	set flag=False
)

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /s | find /i "REG_" > nul
if !ERRORLEVEL! EQU 0 (
	set flag=False
)

if "!flag!" EQU "True" (
	echo [양호] 시작프로그램 목록에 불필요한 서비스가 없으므로 양호함 >> ../result.xml
) else (
	echo [인터뷰] 시작프로그램 목록에 불필요한 서비스 있는지 확인 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-65^> >> ../result.xml

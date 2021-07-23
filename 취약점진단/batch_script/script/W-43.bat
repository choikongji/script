echo ^<W-43^> >> ../result.xml
echo ^<Name^> 원격터미널 접속 가능한 사용자 그룹 제한 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -원격터미널의 그룹이나 계정을 제한하지 않으면 임의의 사용자가 원격으로 >> ../result.xml
echo 접속하여 해당 서버에 정보를 변경하거나 정보가 유출될 가능성이 있으므로 >> ../result.xml
echo 사용자 그룹과 계정을 설정하여 접속을 제한하여야 함 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
whoami /groups >> ../result.xml
net localgroup "Administrators" >> ../result.xml
net localgroup "Remote Desktop Users" >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" | find /i "fDenyTSConnections" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : ^(관리자 계정을 제외한^) 원격접속이 가능한 계정을 생성하여 타 사용자의 >> ../result.xml
echo 원격접속을 제한하고, 원격접속 사용자 그룹에 불필요한 계정이 >> ../result.xml
echo 등록되어 있지 않은 경우 >> ../result.xml
echo [취약] : ^(관리자 계정을 제외한^) 원격접속이 가능한 별도의 계정이 존재하지 않는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" | find /i "fDenyTSConnections" | find /i "0x1" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : 원격 데스크톱 서비스가 비활성화되어 있는 경우 >> ../result.xml
)else (
	echo [인터뷰] : 원격접속 사용자 그룹 내 관리자 계정을 제외한 계정 중 반드시 필요한 계정만 등록되어 있는지 확인 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-43^> >> ../result.xml
echo. >> ../result.xml
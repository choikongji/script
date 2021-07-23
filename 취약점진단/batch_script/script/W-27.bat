echo ^<W-27^> >> ../result.xml
echo ^<Name^> 보안 감사를 로그할 수 없는 경우 즉시 시스템 종료 해제 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -해당 정책이 활성화 되어 있는 경우 악의적인 목적으로 시스템 종료를 유발 >> ../result.xml
echo 하여 서비스 거부 공격에 악용될 수 있으며, 비정상적인 시스템 종료로 인하여 >> ../result.xml
echo 시스템 및 데이터에 손상을 입힐 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "crashonauditfail" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "crashonauditfail" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : “보안 감사를 로그할 수 없는 경우 즉시 시스템 종료” 정책이 “사용 안함”으로 되어 있는 경우 >> ../result.xml
echo [취약] : “보안 감사를 로그할 수 없는 경우 즉시 시스템 종료” 정책이 “사용”으로 되어 있는 경우 >> ../result.xml
echo crashonauditfail 0x0 = 사용 안함 >> ../result.xml
echo crashonauditfail 0x1 = 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "crashonauditfail" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (

	echo [양호] : “보안 감사를 로그할 수 없는 경우 즉시 시스템 종료” 정책이 “사용 안함”으로 되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : “보안 감사를 로그할 수 없는 경우 즉시 시스템 종료” 정책이 “사용”으로 되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-27^> >> ../result.xml
echo. >> ../result.xml
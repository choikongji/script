echo ^<W-32^> >> ../result.xml
echo ^<Name^> Everyone 사용 권한을 익명 사용자에 적용 해제 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -해당 정책이 “사용”으로 설정될 경우 권한이 없는 사용자가 익명으로 계정 >> ../result.xml
echo 이름 및 공유 리소스를 나열하고 이 정보를 사용하여 암호를 추측하거나 >> ../result.xml
echo DoS^(Denial of Service^) 공격을 실행할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo reg query "everyoneincludesanonymous" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "everyoneincludesanonymous" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : “Everyone 사용 권한을 익명 사용자에게 적용” 정책이 “사용 안 함” 으로 되어 있는 경우 >> ../result.xml
echo [취약] : “Everyone 사용 권한을 익명 사용자에게 적용” 정책이 “사용” 으로 되어있는 경우 >> ../result.xml
echo everyoneincludesanonymous = 0x0 사용안함 >> ../result.xml 
echo everyoneincludesanonymous = 0x1 사용 >> ../result.xml 
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "everyoneincludesanonymous" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : “Everyone 사용 권한을 익명 사용자에게 적용” 정책이 “사용 안 함” 으로 되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : “Everyone 사용 권한을 익명 사용자에게 적용” 정책이 “사용” 으로 되어있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-32^> >> ../result.xml
echo. >> ../result.xml
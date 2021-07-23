echo ^<W-39^> >> ../result.xml
echo ^<Name^> 로컬 로그온 허용 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo 불필요한 사용자에게 로컬 로그온이 허용된 경우 비인가자를 통한 권한 >> ../result.xml
echo 상승을 위한 악성 코드의 실행 우려가 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG test1.txt ^| find "SeInteractiveLogonRight" >> ../result.xml
echo. >> ../result.xml
secedit /EXPORT /CFG test1.txt > nul
type test1.txt | find "SeInteractiveLogonRight" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 로컬 로그온 허용 정책에 Administrators, IUSR_ 만 존재하는 경우 >> ../result.xml
echo [취약] : 로컬 로그온 허용 정책에 Administrators, IUSR_ 외 다른 계정 및 그룹이 >> ../result.xml
echo 존재하는 경우 >> ../result.xml
echo *S-1-5-32-544 = 관리자*S-1-5-32-545 = 사용자 *S-1-5-32-551 = 백업연산자 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
type test1.txt | find "SeInteractiveLogonRight" > nul
echo [수동점검] >> ../result.xml
echo ^</Result^> >> ../result.xml
echo ^</W-39^> >> ../result.xml
echo. >> ../result.xml
if exist test1.txt del test1.txt

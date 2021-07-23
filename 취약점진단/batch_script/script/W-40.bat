echo ^<W-40^> >> ../result.xml
echo ^<Name^> 익명 SID/이름 변환 허용 해제 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo 이 정책이 “사용함”으로 설정된 경우 로컬 접근 권한이 있는 사용자가 잘 >> ../result.xml
echo 알려진 Administrator SID를 사용하여 Administrator 계정의 실제 이름을 >> ../result.xml
echo 알아낼 수 있으며 암호 추측 공격을 실행할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG ^| find "EveryoneIncludesAnonymous=" >> ../result.xml
echo. >> ../result.xml
secedit /EXPORT /CFG test.txt > nul
type test.txt | find "EveryoneIncludesAnonymous=" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : “익명 SID/이름 변환 허용” 정책이 “사용 안 함” 으로 되어 있는 경우 >> ../result.xml
echo [취약] : “익명 SID/이름 변환 허용” 정책이 “사용” 으로 되어 있는 경우 >> ../result.xml
echo EveryoneIncludesAnonymous=4,0 = 사용 안함 >> ../result.xml
echo EveryoneIncludesAnonymous=4,1 = 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
type test.txt | find "EveryoneIncludesAnonymous=4,0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : “익명 SID/이름 변환 허용” 정책이 “사용 안 함” 으로 되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : “익명 SID/이름 변환 허용” 정책이 “사용” 으로 되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-40^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt

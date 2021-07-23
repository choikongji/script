echo ^<W-5^> >> ../result.xml
echo ^<Name^> 해독 가능한 암호화를 사용하여 암호 저장 해제 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -위 정책이 설정된 경우 OS에서 사용자 ID, PW를 입력받아 인증을 진행하는 >> ../result.xml
echo 응용프로그램 프로토콜 지원 시 OS 는 사용자의 PW 를 해독 가능한 방식 >> ../result.xml
echo 으로 암호를 저장하기 때문에, 노출된 계정에 대해 공격자가 암호 복호화 공 >> ../result.xml
echo 격으로 PW를 획득하여 네트워크 리소스에 접근할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG ^| find /i "ClearTextPassword" >> ../result.xml
echo. >> ../result.xml
secedit /EXPORT /CFG test.txt > nul
type test.txt | find /i "ClearTextPassword" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : “해독 가능한 암호화를 사용하여 암호 저장” 정책이 “사용 안 함” 으로 되어 있는 경우 >> ../result.xml
echo [취약] : “해독 가능한 암호화를 사용하여 암호 저장” 정책이 “사용” 으로 되어 있는 경우 >> ../result.xml

echo ClearTextPassword = 0 사용 안함 >> ../result.xml
echo ClearTextPassword = 1 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml


echo ^<Result^> >> ../result.xml
type test.txt | find /i "ClearTextPassword = 0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : “해독 가능한 암호화를 사용하여 암호 저장” 정책이 “사용 안 함” 으로 되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : “해독 가능한 암호화를 사용하여 암호 저장” 정책이 “사용” 으로 되어 있는 경우 >> ../result.xml
) 
echo ^</Result^> >> ../result.xml
echo ^</W-5^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
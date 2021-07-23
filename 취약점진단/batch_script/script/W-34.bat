echo ^<W-34^> >> ../result.xml
echo ^<Name^> 패스워드 복잡성 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -사용자 암호가 패스워드 복잡성을 만족하지 못하는 반복되는 문자, 연속되는 >> ../result.xml
echo 숫자, 계정이름이 포함된 패스워드 등을 사용할 경우 무작위 대입 공격 >> ../result.xml
echo ^(Brute Force Attack^)이나 패스워드 추측 공격^(Password Guessing Attack^)에 >> ../result.xml
echo 쉽게 크랙될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG "PasswordComplexity" >> ../result.xml
echo. >> ../result.xml
secedit /EXPORT /CFG test.txt > nul
type test.txt | find "PasswordComplexity" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [취약] : “암호는 복잡성을 만족해야 함” 정책이 “사용 안 함” 으로 되어 있는 경우 >> ../result.xml
echo [양호] : “암호는 복잡성을 만족해야 함” 정책이 “사용” 으로 되어 있는 경우 >> ../result.xml
echo PasswordComplexity = 0 사용 안함 >> ../result.xml
echo PasswordComplexity = 1 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
type test.txt | find "PasswordComplexity = 0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : “암호는 복잡성을 만족해야 함” 정책이 “사용 안 함” 으로 되어 있는 경우 >> ../result.xml
)else (
	echo [양호] : “암호는 복잡성을 만족해야 함” 정책이 “사용” 으로 되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-34^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
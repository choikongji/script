echo ^<W-35^> >> ../result.xml
echo ^<Name^> 패스워드 최소 암호 길이 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -짧은 패스워드 및 일반적인 단어와 일반적인 어구를 이용해 암호를 설정한 >> ../result.xml
echo 경우 사전 공격이나 가능한 모든 문자의 조합을 시도하는 무작위 공격을 통해 >> ../result.xml
echo 쉽게 패스워드가 도용될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts find "Minimum password length" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Minimum password length" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 최소 암호 길이가 8문자 이상으로 설정되어 있는 경우 >> ../result.xml
echo [취약] : 최소 암호 길이가 설정되지 않았거나 8문자 미만으로 설정되어 있는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
net accounts | find "Minimum password length" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)

echo ^<Result^> >> ../result.xml
if !b! GEQ 8 (
	echo [양호] : 최소 암호 길이가 8문자 이상으로 설정되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : 최소 암호 길이가 설정되지 않았거나 8문자 미만으로 설정되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-35^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
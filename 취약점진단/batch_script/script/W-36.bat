echo ^<W-36^> >> ../result.xml
echo ^<Name^> 패스워드 최대 사용 기간 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -오랫동안 변경하지 않은 패스워드를 지속적으로 사용하는 경우 암호 추측 >> ../result.xml
echo 공격에 의해 유출될 수 있으므로 사용자가 암호를 자주 바꾸도록 하면 유효한 >> ../result.xml
echo 암호가 공격당하는 위험을 줄일 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts find "Maximum password age (days):" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Maximum password age (days):" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 최대 암호 사용 기간이 90일 이하로 설정되어 있는 경우 >> ../result.xml
echo [취약] : 최대 암호 사용 기간이 설정되지 않았거나 90일을 초과하는 값으로 설정된 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
net accounts | find "Maximum password age (days):" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
if !b! LEQ 90 (
	if !b! GTR 0 (
		echo [양호] : 최대 암호 사용 기간이 90일 이하로 설정되어 있는 경우 >> ../result.xml
	)else (
		echo [취약] : 최대 암호 사용 기간이 설정되지 않았거나 90일을 초과하는 값으로 설정된 경우 >> ../result.xml
	)
)else (
	echo [취약] : 최대 암호 사용 기간이 설정되지 않았거나 90일을 초과하는 값으로 설정된 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-36^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
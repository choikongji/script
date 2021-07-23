echo ^<W-1^> >> ../result.xml
echo ^<Name^> Administrator 계정 이름 변경 또는 보안성 강화 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -일반적으로 관리자 계정으로 잘 알려진 Administrator를 변경하지 않은 경우 >> ../result.xml
echo 악의적인 사용자의 패스워드 추측 공격을 통해 사용 권한 상승의 위험이 있으며, >> ../result.xml
echo 관리자를 유인하여 침입자의 액세스를 허용하는 악성코드를 실행할 우려가 있음 >> ../result.xml
echo -윈도우즈 최상위 관리자 계정인 Administrator는 기본적으로 삭제하거나 잠글 수 없어 악의적인 사용자의 목표가 됨 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net user find "Administrator" >> ../result.xml
echo. >> ../result.xml
net user | find "Administrator" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : Administrator Default 계정 이름을 변경하거나 강화된 비밀번호를 적용한 경우 >> ../result.xml
echo [취약] : Administrator Default 계정 이름을 변경하지 않거나 단순 비밀번호를 적용한 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml
net user | find /i "Administrator" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] Administrator Default 계정 이름이 변경되어 있지 않으므로 취약함 >> ../result.xml
)else (
	echo [양호] Administrator Default 계정 이름이 변경되어 있으므로 양호함 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-1^> >> ../result.xml
echo. >> ../result.xml


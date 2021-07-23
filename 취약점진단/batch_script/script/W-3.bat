echo ^<W-3^> >> ../result.xml
echo ^<Name^> 불필요한 계정 제거 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -관리되지 않은 불필요한 계정은 장기간 패스워드가 변경되지 않아 무작위 >> ../result.xml
echo 대입 공격^(Brute Force Attack^)이나 패스워드 추측 공격 ^(Password Guessing >> ../result.xml
echo Attack^)의 가능성이 존재하며, 또한 이런 공격에 의해 계정 정보가 유출되어 >> ../result.xml
echo 도 유출 사실을 인지하기 어려움 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net user >> ../result.xml
echo. >> ../result.xml
net user >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : 불필요한 계정이 존재하지 않는 경우 >> ../result.xml
echo [취약] : 불필요한 계정이 존재하는 경우 >> ../result.xml
echo 1. 시작> 실행> lusrmgr.msc 명령어 입력 >> ../result.xml
echo 2. 사용자> 존재하는 계정에 대한 용도 확인^(스크린샷과 계정에 대한 용도 요청^) >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<RESULT^> >> ../result.xml
echo [인터뷰] >> ../result.xml
echo ^</RESULT^> >> ../result.xml
echo ^</W-3^> >> ../result.xml
echo. >> ../result.xml
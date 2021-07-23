echo ^<W-52^> >> ../result.xml
echo ^<Name^> 예약된 작업에 의심스러운 명령이 등록되어 있는지 점검 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -일정 시간마다 미리 설정해둔 프로그램을 실행할 수 있는 예약된 작업은 >> ../result.xml
echo 시작프로그램과 더불어서 해킹과 트로이 목마, 백도어를 설치하여 공격하기 좋은 >> ../result.xml
echo 루트로 사용될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml 
echo #schtasks >> ../result.xml
echo. >> ../result.xml
schtasks >> ../result.xml 
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 불필요한 명령어나 파일 등 주기적인 예약 작업의 존재 여부를 주기적으로 점검하고 제거한 경우 >> ../result.xml
echo [취약] : 불필요한 명령어나 파일 등 주기적인 예약 작업의 존재 여부를 주기적으로 점검하지 않거나, 해당 작업을 제거하지 않은 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
echo [인터뷰] >> ../result.xml
echo ^</Result^> >> ../result.xml
echo ^</W-52^> >> ../result.xml
echo. >> ../result.xml

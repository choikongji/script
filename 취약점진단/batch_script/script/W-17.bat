echo ^<W-17^> >> ../result.xml
echo ^<Name^> 최신 서비스팩 적용 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -보안 업데이트를 적용하지 않은 경우 시스템 및 응용프로그램의 취약성으로 >> ../result.xml
echo 인해 권한 상승, 원격 코드 실행, 보안 기능 우회 등의 문제를 일으킬 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #현재 Windows Version >> ../result.xml
echo. >> ../result.xml
ver >> ../result.xml

echo ]]^> ^</Data^> >> ../result.xml
echo 제품별 수명주기 사이트^(2020년 8월 기준^) >> ../result.xml
echo Microsoft Windows Server 제품별 지원 >> ../result.xml
echo https://support.microsoft.com/ko-kr/lifecycle/search >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 최신 서비스팩이 설치되어 있으며 적용 절차 및 방법이 수립된 경우 >> ../result.xml
echo [취약] : 최신 서비스팩이 설치되지 않거나, 적용 절차 및 방법이 수립되지 않은 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml
echo [수동점검] >> ../result.xml
echo ^</Result^> >> ../result.xml
echo ^</W-17^> >> ../result.xml
echo. >> ../result.xml
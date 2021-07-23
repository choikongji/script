echo ^<W-6^> >> ../result.xml
echo ^<Name^> 관리자 그룹에 최소한의 사용자 포함 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Administrators와 같은 관리자 그룹에 속한 구성원은 컴퓨터 시스템에 대한 >> ../result.xml
echo 완전하고 제한 없는 액세스 권한을 가지므로, 사용자를 관리자 그룹에 포함 >> ../result.xml
echo 시킬 경우 비인가 사용자에 대한 과도한 관리 권한이 부여될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net localgroup Administrators >> ../result.xml
echo. >> ../result.xml
net localgroup Administrators >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : Administrators 그룹의 구성원을 1명 이하로 유지하거나, 불필요한 관리자 계정이 존재하지 않는 경우 >> ../result.xml
echo [취약] : Administrators 그룹에 불필요한 관리자 계정이 존재하는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml


echo ^<RESULT^> >> ../result.xml
echo [인터뷰] >> ../result.xml
echo ^</RESULT^> >> ../result.xml
echo ^</W-6^> >> ../result.xml
echo. >> ../result.xml
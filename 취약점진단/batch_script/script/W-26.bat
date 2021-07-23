echo ^<W-26^> >> ../result.xml
echo ^<Name^> 원격 시스템에서 강제로 시스템 종료 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -원격 시스템 강제 종료 설정이 부적절한 경우 서비스 거부 공격 등에 악용 >> ../result.xml
echo 될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG test.txt ^| find "SeRemoteShutdownPrivilege = *S-1-5-32-544" >> ../result.xml
secedit /EXPORT /CFG test.txt > nul
type test.txt | find "SeRemoteShutdownPrivilege" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : “원격 시스템에서 강제로 시스템 종료” 정책에 “Administrators”만 존재 >> ../result.xml
echo 하는 경우 >> ../result.xml
echo [취약] : “원격 시스템에서 강제로 시스템 종료” 정책에 “Administrators” 외 다른 >> ../result.xml
echo 계정 및 그룹이 존재하는 경우 >> ../result.xml
echo echo * S-1-5-32-544: Administrators 그룹 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

type test.txt | find "SeRemoteShutdownPrivilege = *S-1-5-32-544" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : “원격 시스템에서 강제로 시스템 종료” 정책에 “Administrators”만 존재 >> ../result.xml
	echo 하는 경우 >> ../result.xml
)else (
	echo [취약] : “원격 시스템에서 강제로 시스템 종료” 정책에 “Administrators” 외 다른 >> ../result.xml
	echo 계정 및 그룹이 존재하는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-26^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
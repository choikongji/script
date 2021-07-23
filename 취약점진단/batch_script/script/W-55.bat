echo ^<W-55^> >> ../result.xml
echo ^<Name^> 원격에서 이벤트 로그 파일 접근 차단 ^</Name^> >> ../result.xml
echo ^<Security_Threat^>>> ../result.xml
echo -원격 익명 사용자의 시스템 로그 파일에 접근이 가능한 경우 ‘중요 시스템 >> ../result.xml
echo 로그’ 파일 및 ‘애플리케이션 로그’ 등 중요 보안 감사 정보의 변조·삭제·유출 >> ../result.xml
echo 의 위험이 존재 >> ../result.xml
echo ^</Security_Threat^>>> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #cacls systemroot\system32\config >> ../result.xml
echo. >> ../result.xml
icacls !systemroot!\system32\config >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 로그 디렉토리의 접근권한에 Everyone 권한이 없는 경우 >> ../result.xml
echo [취약] : 로그 디렉토리의 접근권한에 Everyone 권한이 있는 경우 >> ../result.xml
echo [권한 약어] >> ../result.xml
echo N - 없음 >> ../result.xml
echo R - 읽기 >> ../result.xml
echo W - 쓰기 >> ../result.xml
echo C - 바꾸기^(쓰기^) >> ../result.xml
echo F - 모든 권한 >> ../result.xml
echo . >> ../result.xml
echo [상속 약어] >> ../result.xml
echo CI - Container Inherit. >> ../result.xml
echo ACE가 디렉터리에 의해 상속됩니다. >> ../result.xml
echo OI - Object Inherit. >> ../result.xml
echo ACE가 파일에 의해 상속됩니다. >> ../result.xml
echo IO - Inherit Only. >> ../result.xml
echo ACE가 현재 파일/디렉터리에 적용되지 않습니다. >> ../result.xml
echo ID - Inherited. >> ../result.xml
echo ACE가 부모 디렉터리의 ACL에서 상속되었습니다. >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
icacls !systemroot!\system32\config | findstr /i "Everyone"
if !ERRORLEVEL! EQU 0 (
	echo [취약] : 로그 디렉토리의 접근권한에 Everyone 권한이 있는 경우 >> ../result.xml
)else (
	echo [양호] : 로그 디렉토리의 접근권한에 Everyone 권한이 없는 경우 >> ../result.xml
)
echo ^</Result^>.txt >> ../result.xml
echo ^</W-55^> >> ../result.xml
echo. >> ../result.xml
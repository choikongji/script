echo ^<W-28^> >> ../result.xml
echo ^<Name^> SAM 계정과 공유의 익명 열거 허용 안 함 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo Windows에서는 익명의 사용자가 도메인 계정^(사용자, 컴퓨터 및 그룹^)과 >> ../result.xml
echo 네트워크 공유 이름의 열거 작업을 수행할 수 있으므로 SAM^(보안계정관리자^) >> ../result.xml
echo 계정과 공유의 익명 열거가 허용될 경우 악의적인 사용자가 계정 이름 목록을 >> ../result.xml
echo 확인하고 이 정보를 사용하여 암호를 추측하거나 사회 공학적 공격기법을 >> ../result.xml
echo 수행할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "restrictanonymoussam" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "restrictanonymoussam" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : 해당 보안 옵션 값이 설정 되어 있는 경우 >> ../result.xml
echo [취약] : 해당 보안 옵션 값이 설정 되어 있지 않는 경우 >> ../result.xml
echo restrictanonymoussam 0x0 = 사용 안함 >> ../result.xml
echo restrictanonymoussam 0x1 = 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "restrictanonymoussam" | find "0x1" >nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : 해당 보안 옵션 값이 설정 되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : 해당 보안 옵션 값이 설정 되어 있지 않는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-28^> >> ../result.xml
echo. >> ../result.xml
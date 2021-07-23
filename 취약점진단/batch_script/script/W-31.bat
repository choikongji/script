echo ^<W-31^> >> ../result.xml
echo ^<Name^> 디스크볼륨 암호화 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -디스크 볼륨이 암호화 되어 있지 않은 경우 비인가자가 데이터를 열람할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #manage-bde -status ^| findstr /C:"Conversion Status" >> ../result.xml
echo manage-bde -status | findstr /C:"Conversion Status:" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : "데이터 보호를 위해 내용을 암호화" 정책이 선택된 경우 >> ../result.xml
echo [취약] : "데이터 보호를 위해 내용을 암호화" 정책이 선택되어 있지 않은 경우>> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
manage-bde -status | findstr /C:"Conversion Status:    Fully Decrypted" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : "데이터 보호를 위해 내용을 암호화" 정책이 선택되어 있지 않은 경우>> ../result.xml
)else (
	echo [양호] : "데이터 보호를 위해 내용을 암호화" 정책이 선택된 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-31^> >> ../result.xml
echo. >> ../result.xml
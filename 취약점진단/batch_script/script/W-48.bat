echo ^<W-48^> >> ../result.xml
echo ^<Name^> DNS 서비스 구동 점검 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml

echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "DNS Server" >> ../result.xml
net start | find /i "DNS Server" >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s ^| find "AllowUpdate" >> ../result.xml
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find "AllowUpdate" > nul
if !ERRORLEVEL! EQU 0 (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find "AllowUpdate" >> ../result.xml
)
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : DNS 서비스를 사용하지 않거나 동적 업데이트 “없음^(아니오^)”으로 설정 >> ../result.xml
echo 되어 있는 경우 >> ../result.xml
echo [취약] : 서비스를 사용하며 동적 업데이트가 설정되어 있는 경우 >> ../result.xml
echo *AllowUpdate = 동적 업데이트 사용여부 >> ../result.xml
echo *AllowUpdate = 0^(사용안함^) - 양호 >> ../result.xml
echo *AllowUpdate = 1^(사용함^) - 취약 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

net start | find "DNS Server" > nul
if !ERRORLEVEL! EQU 1 (
	echo [N/A] DNS 서비스를 사용하지 않으므로 해당없음 >> ../result.xml
) else (
	reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DNS Server\Zones" /s | find "AllowUpdate" | findstr /i "0x0" > nul
	if !ERRORLEVEL! EQU 0 (
		echo [양호] DNS 서비스를 사용하나 동적 업데이트 설정이 "없음"^(아니오^)로 설정되어 있으므로 양호함 >> ../result.xml
	) else (
		echo [취약] DNS 서비스를 사용하며 동적 업데이트 설정이 되어 있으므로 취약함 >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-48^> >> ../result.xml
echo. >> ../result.xml
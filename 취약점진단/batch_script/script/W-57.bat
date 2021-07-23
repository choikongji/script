echo ^<W-57^> >> ../result.xml
echo ^<Name^> 사용자가 프린터 드라이버를 설치할 수 없게 함 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -서버에 프린터 드라이버를 설치하는 경우 악의적인 사용자가 고의적으로 >> ../result.xml
echo 잘못된 프린터 드라이버를 설치하여 컴퓨터를 손상시킬 수 있으며, 프린터 >> ../result.xml
echo 드라이버로 위장한 악성 코드를 설치할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" ^| find "AddPrinterDrivers" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" | find "AddPrinterDrivers" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : “사용자가 프린터 드라이버를 설치할 수 없게 함” 정책 >> ../result.xml
echo [취약] : “사용자가 프린터 드라이버를 설치할 수 없게 함” 정책이 “사용 안 함”인 경우 >> ../result.xml
echo AddPrinterDrivers 0x0 = 사용 안함 >> ../result.xml
echo AddPrinterDrivers 0x1 = 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" | find "0x1" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : “사용자가 프린터 드라이버를 설치할 수 없게 함” 정책 >> ../result.xml
)else (
	echo [취약] : “사용자가 프린터 드라이버를 설치할 수 없게 함” 정책이 “사용 안 함”인 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-57^> >> ../result.xml
echo. >> ../result.xml
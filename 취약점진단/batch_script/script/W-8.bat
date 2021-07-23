echo ^<W-8^> >> ../result.xml
echo ^<Name^> 하드디스크 기본 공유 제거 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Windows는 프로그램 및 서비스를 네트워크나 컴퓨터 환경에서 관리하기 위해 >> ../result.xml
echo 시스템 기본 공유 항목을 자동으로 생성함. 이를 제거하지 않으면 비인가자가 >> ../result.xml
echo 모든 시스템 자원에 접근할 수 있는 위험한 상황이 발생할 수 있으며 >> ../result.xml
echo 이러한 공유 기능의 경로를 이용하여 바이러스가 침투될 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net share ^| findstr /v "IPC" ^| find "$" >> ../result.xml
echo. >> ../result.xml
net share | findstr /v "IPC" | find "$" >> ../result.xml
echo reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s ^| find /i "AutoShareServer" >> ../result.xml
echo. >> ../result.xml
reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s | find /i "AutoShareServer" >> ../result.xml
echo. >> ../result.xml
echo #reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s ^| find /i "AutoShareWks" >> ../result.xml
echo reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s | find /i "AutoShareWks" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 레지스트리의 AutoShareServer ^(WinNT: AutoShareWks^)가 0이며 기본 공유가 존재하지 않는 경우 >> ../result.xml
echo [취약] : 레지스트리의AutoShareServer ^(WinNT: AutoShareWks^)가 1이거나 기본 공유가 존재하는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

set flag=False

reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s | find /i "AutoShareServer" | find "0" >> ../result.xml
if !ERRORLEVEL! EQU 0 (
	set flag=True
	goto auto
)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /s | find /i "AutoShareWks" | find "0" >> ../result.xml
if !ERRORLEVEL! EQU 0 (
	set flag=True
	goto auto
)

:auto
net share | findstr /v "IPC" | find "$" > nul
if not !ERRORLEVEL! EQU 0 (
	if "!flag!" EQU "True" (
		echo [양호] : 레지스트리의 AutoShareServer ^(WinNT: AutoShareWks^)가 0이며 기본 공유가 존재하지 않는 경우 >> ../result.xml
	)else (
		echo [취약] : 레지스트리의AutoShareServer ^(WinNT: AutoShareWks^)가 1인 경우 >> ../result.xml
	)
)else (
	echo [취약] : 기본 공유가 존재하는 경우 >> ../result.xml
)

echo ^</Result^> >> ../result.xml
echo ^</W-8^> >> ../result.xml
echo. >> ../result.xml

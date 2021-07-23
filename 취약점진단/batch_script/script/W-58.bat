echo ^<W-58^> >> ../result.xml
echo ^<Name^> 세션 연결을 중단하기 전에 필요한 유휴시간 ^</Name^>  >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -SMB 세션에서는 서버 리소스를 사용하며, null^(공백^) 세션수가 많으면 서버 >> ../result.xml
echo 속도가 느려지거나 서버에 오류를 발생시킬 수 있으므로 공격자는 이를 >> ../result.xml
echo 악용하여 SMB 세션을 반복 설정하여 서버의 SMB 서비스가 느려지거나 응답 >> ../result.xml
echo 하지 않게 하여 서비스 거부 공격을 실행 할 수 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "enableforcedlogoff" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "enableforcedlogoff" >> ../result.xml
echo #reg query "autodisconnect" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "autodisconnect" >> ../result.xml

echo ]]^> ^</Data^> >> ../result.xml
echo. >> ../result.xml

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "autodisconnect" | find "autodisconnect" > test.txt
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : “로그온 시간이 만료되면 클라이언트 연결 끊기” 정책을 “사용”으로, “세션 연결을 중단하기 전에 필요한 유휴 시간” 정책을 “15분”으로 설정한 경우 >> ../result.xml
echo [취약] : “세션 연결을 중단하기 전에 필요한 유휴 시간” 정책이 “15분”으로설정 되어 있지 않은 경우 >> ../result.xml
echo enableforcedlogoff = 0x0 사용 안함 >> ../result.xml
echo enableforcedlogoff = 0x1 사용 >> ../result.xml
echo autodisconnect 시간 >> ../result.xml
echo ^</Comment^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "enableforcedlogoff" | find "0x1" > nul
if !ERRORLEVEL! EQU 0 (
	if "!b!" EQU "0xf" (
		echo [양호] : “로그온 시간이 만료되면 클라이언트 연결 끊기” 정책을 “사용”으로, “세션 연결을 중단하기 전에 필요한 유휴 시간” 정책을 “15분”으로 설정한 경우 >> ../result.xml
	)else (
		echo [취약] : “세션 연결을 중단하기 전에 필요한 유휴 시간” 정책이 “15분”으로설정 되어 있지 않은 경우 >> ../result.xml
	)
)else (
	echo [취약] : “로그온 시간이 만료되면 클라이언트 연결 끊기” 정책이 “사용 안 함”으로 되어 있을 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-58^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
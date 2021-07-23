echo ^<W-62^> >> ../result.xml
echo ^<Name^> 보안 채널 데이터 디지털 암호화 또는 서명 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -보안 채널이 암호화 되지 않은 경우 인증 트래픽 끼어들기 공격, 반복 공격 >> ../result.xml
echo 및 기타 유형의 네트워크 공격 등의 위험 존재 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "RequireSignOrSeal" >> ../result.xml
echo. >> ../result.xml 
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "RequireSignOrSeal" | find "RequireSignOrSeal" >> ../result.xml
echo #reg query "SealSecureChannel" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SealSecureChannel" | find "SealSecureChannel" >> ../result.xml
echo #reg query "SignSecureChannel" >> ../result.xml
echo. >> ../result.xml >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SignSecureChannel" | find "SignSecureChannel" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [양호] : 아래 3가지 정책이 "사용"으로 되어 있는 경우 >> ../result.xml
echo [취약] : 아래 3가지 정책이 "사용 안 함" 으로 되어 있는 경우 >> ../result.xml
echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명^(항상^) >> ../result.xml
echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화^(가능한 경우^) >> ../result.xml
echo - 도메인 구성원: 보안 채널 데이터 디지털 서명^(가능한 경우^) >> ../result.xml
echo RequireSignOrSeal 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명^(항상^) 0x0 = 사용 안함 >> ../result.xml
echo RequireSignOrSeal 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명^(항상^) 0x1 = 사용 >> ../result.xml
echo SealSecureChannel 도메인 구성원: 보안 채널 데이터를 디지털 암호화^(가능한 경우^) 0x0 = 사용 안함 >> ../result.xml
echo SealSecureChannel 도메인 구성원: 보안 채널 데이터를 디지털 암호화^(가능한 경우^) 0x1 = 사용 >> ../result.xml
echo SignSecureChannel 도메인 구성원: 보안 채널 데이터를 디지털 서명^(가능한 경우^) 0x0 = 사용 안함 >> ../result.xml
echo SignSecureChannel 도메인 구성원: 보안 채널 데이터를 디지털 서명^(가능한 경우^) 0x1 = 사용 >> ../result.xml
echo ^</Comment^> >> ../result.xml

reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SignSecureChannel" | find "SignSecureChannel" > test.txt 
for /f "tokens=3 delims= " %%a in (test.txt) do (
	for %%b in (%%a) do (
		set sing=%%b
	)
)
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "RequireSignOrSeal" | find "RequireSignOrSeal" >test1.txt
for /f "tokens=3 delims= " %%a in (test1.txt) do (
	for %%b in (%%a) do (
		set req=%%b
	)
)
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SealSecureChannel" | find "0x1" > nul
if !ERRORLEVEL! EQU 0 (
	if "!sing!" EQU "0x1" (
		if "!req!" EQU "0x1" (
			echo [양호] : 아래 3가지 정책이 "사용"으로 되어 있는 경우 >> ../result.xml
 		)else (
			echo [취약] : 아래 3가지 정책이 "사용 안 함" 으로 되어 있는 경우 >> ../result.xml
			echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명^(항상^) >> ../result.xml
			echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화^(가능한 경우^) >> ../result.xml
			echo - 도메인 구성원: 보안 채널 데이터 디지털 서명^(가능한 경우^) >> ../result.xml
		)
	)else (
		echo [취약] : 아래 3가지 정책이 "사용 안 함" 으로 되어 있는 경우 >> ../result.xml
		echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명^(항상^) >> ../result.xml
		echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화^(가능한 경우^) >> ../result.xml
		echo - 도메인 구성원: 보안 채널 데이터 디지털 서명^(가능한 경우^) >> ../result.xml
	)
)else (
	echo [취약] : 아래 3가지 정책이 "사용 안 함" 으로 되어 있는 경우 >> ../result.xml
	echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화 또는 서명^(항상^) >> ../result.xml
	echo - 도메인 구성원: 보안 채널 데이터를 디지털 암호화^(가능한 경우^) >> ../result.xml	
	echo - 도메인 구성원: 보안 채널 데이터 디지털 서명^(가능한 경우^) >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-62^> >> ../result.xml
echo. >> ../result.xml
if exist test*.txt del test*.txt


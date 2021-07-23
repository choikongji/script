echo ^<W-61^> >> ../result.xml
echo ^<Name^> LAN Manager 인증 수준 ^</Name^> >> ../result.xml
echo ^<Security_Threat^>>> ../result.xml
echo -안전하지 않은 LAN Manager 인증 수준을 사용하는 경우 인증 트래픽을 >> ../result.xml
echo 가로채기를 통해 악의적인 계정 정보 노출을 허용할 수 있음 >> ../result.xml
echo ^</Security_Threat^>>> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "LmCompatibilityLevel" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : "LAN Manager 인증 수준" 정책에 "NTLMv2 응답만 보냄"이 설정 되어 있는 경우 >> ../result.xml
echo [취약] : "LAN Manager 인증 수준" 정책에 "LM" 및 "NTLM"인증이 설정되어 있는 경우 >> ../result.xml
echo LmCompatibilityLevel 0x0 = LM 및 NTLM 응답 보내기 >> ../result.xml
echo LmCompatibilityLevel 0x1 = LM 및 NTLM 응답 보내기-협상되면 NTLMv2 세션 보안 사용 >> ../result.xml
echo LmCompatibilityLevel 0x2 = NTLM 응답만 보내기 >> ../result.xml
echo LmCompatibilityLevel 0x3 = NTLMv2 응답만 보내기 >> ../result.xml
echo LmCompatibilityLevel 0x4 = NTLMv2 응답만 보내기 및 LM 거부 >> ../result.xml
echo LmCompatibilityLevel 0x5 = NTLMv2 응답만 보내기, LM 및 NTLM 거부 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" | find "0x3" > nul
if !ERRORLEVEL! EQU 0 (
	echo [양호] : "LAN Manager 인증 수준" 정책에 "NTLMv2 응답만 보냄"이 설정 되어 있는 경우 >> ../result.xml
)else (
	echo [취약] : "LAN Manager 인증 수준" 정책에 "LM" 및 "NTLM"인증이 설정되어 있는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-61^> >> ../result.xml
echo. >> ../result.xml
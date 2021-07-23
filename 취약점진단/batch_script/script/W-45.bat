echo ^<W-45^> >> ../result.xml
echo ^<Name^> SNMP 서비스 구동 점검 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -취약한 SNMP 서비스를 사용하는 경우 서비스거부공격^(DoS, DDoS^), 버퍼 >> ../result.xml
echo 오버플로우, 비인가 접속 등의 공격의 위험이 있음 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "SNMP" >> ../result.xml
echo. >> ../result.xml
net start | find "SNMP" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : SNMP 서비스를 사용하지 않는 경우 >> ../result.xml
echo [취약] : SNMP 서비스를 사용하는 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml
net start | find "SNMP" > nul
if !ERRORLEVEL! EQU 0 (
	echo [취약] : SNMP 서비스를 사용하는 경우 >> ../result.xml
)else (
	echo [양호] : SNMP 서비스를 사용하지 않는 경우 >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-45^> >> ../result.xml
echo. >> ../result.xml
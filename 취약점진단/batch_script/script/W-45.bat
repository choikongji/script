echo ^<W-45^> >> ../result.xml
echo ^<Name^> SNMP ���� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -����� SNMP ���񽺸� ����ϴ� ��� ���񽺰źΰ���^(DoS, DDoS^), ���� >> ../result.xml
echo �����÷ο�, ���ΰ� ���� ���� ������ ������ ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net start ^| find "SNMP" >> ../result.xml
echo. >> ../result.xml
net start | find "SNMP" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : SNMP ���񽺸� ������� �ʴ� ��� >> ../result.xml
echo [���] : SNMP ���񽺸� ����ϴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml
net start | find "SNMP" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : SNMP ���񽺸� ����ϴ� ��� >> ../result.xml
)else (
	echo [��ȣ] : SNMP ���񽺸� ������� �ʴ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-45^> >> ../result.xml
echo. >> ../result.xml
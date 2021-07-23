echo ^<W-50^> >> ../result.xml
echo ^<Name^> 불필요한 ODBC/OLE-DB 데이터 소스와 드라이브 제거 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -불필요한 ODBC/OLE-DB 데이터 소스를 통한 비인가자에 의한 데이터베이스 >> ../result.xml
echo 접속 및 자료 유출 위험 존재 >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "HKLM\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" ^| find /i "reg_sz" >> ../result.xml
reg query "HKLM\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" | find /i "reg_sz" > nul
if !ERRORLEVEL! EQU 0 (
	echo reg query "HKLM\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" | find /i "reg_sz"
)
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [양호] : 시스템 DSN 부분의 Data Source를 현재 사용하고 있는 경우 >> ../result.xml
echo [취약] : 시스템 DSN 부분의 Data Source를 현재 사용하고 있지 않은 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKLM\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" | find /i "reg_sz" > nul
if not !ERRORLEVEL! EQU 0 (
	echo [양호] : 시스템 DSN 부분의 Data Source를 현재 사용하고 있는 경우 >> ../result.xml
) else (
	echo [인터뷰] 불필요한 ODBC/OLE-DB 데이터 소스와 드라이브가 있는지 확인 >> ../result.xml
)

echo ^</Result^> >> ../result.xml
echo ^</W-50^> >> ../result.xml
echo. >> ../result.xml
echo ^<W-50^> >> ../result.xml
echo ^<Name^> ���ʿ��� ODBC/OLE-DB ������ �ҽ��� ����̺� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���ʿ��� ODBC/OLE-DB ������ �ҽ��� ���� ���ΰ��ڿ� ���� �����ͺ��̽� >> ../result.xml
echo ���� �� �ڷ� ���� ���� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "HKLM\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" ^| find /i "reg_sz" >> ../result.xml
reg query "HKLM\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" | find /i "reg_sz" > nul
if !ERRORLEVEL! EQU 0 (
	echo reg query "HKLM\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" | find /i "reg_sz"
)
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �ý��� DSN �κ��� Data Source�� ���� ����ϰ� �ִ� ��� >> ../result.xml
echo [���] : �ý��� DSN �κ��� Data Source�� ���� ����ϰ� ���� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKLM\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" | find /i "reg_sz" > nul
if not !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : �ý��� DSN �κ��� Data Source�� ���� ����ϰ� �ִ� ��� >> ../result.xml
) else (
	echo [���ͺ�] ���ʿ��� ODBC/OLE-DB ������ �ҽ��� ����̺갡 �ִ��� Ȯ�� >> ../result.xml
)

echo ^</Result^> >> ../result.xml
echo ^</W-50^> >> ../result.xml
echo. >> ../result.xml
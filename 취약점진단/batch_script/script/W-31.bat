echo ^<W-31^> >> ../result.xml
echo ^<Name^> ��ũ���� ��ȣȭ ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -��ũ ������ ��ȣȭ �Ǿ� ���� ���� ��� ���ΰ��ڰ� �����͸� ������ �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #manage-bde -status ^| findstr /C:"Conversion Status" >> ../result.xml
echo manage-bde -status | findstr /C:"Conversion Status:" >> ../result.xml
echo. >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : "������ ��ȣ�� ���� ������ ��ȣȭ" ��å�� ���õ� ��� >> ../result.xml
echo [���] : "������ ��ȣ�� ���� ������ ��ȣȭ" ��å�� ���õǾ� ���� ���� ���>> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
manage-bde -status | findstr /C:"Conversion Status:    Fully Decrypted" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : "������ ��ȣ�� ���� ������ ��ȣȭ" ��å�� ���õǾ� ���� ���� ���>> ../result.xml
)else (
	echo [��ȣ] : "������ ��ȣ�� ���� ������ ��ȣȭ" ��å�� ���õ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-31^> >> ../result.xml
echo. >> ../result.xml
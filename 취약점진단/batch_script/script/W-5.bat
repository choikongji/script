echo ^<W-5^> >> ../result.xml
echo ^<Name^> �ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�� ��å�� ������ ��� OS���� ����� ID, PW�� �Է¹޾� ������ �����ϴ� >> ../result.xml
echo �������α׷� �������� ���� �� OS �� ������� PW �� �ص� ������ ��� >> ../result.xml
echo ���� ��ȣ�� �����ϱ� ������, ����� ������ ���� �����ڰ� ��ȣ ��ȣȭ �� >> ../result.xml
echo ������ PW�� ȹ���Ͽ� ��Ʈ��ũ ���ҽ��� ������ �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG ^| find /i "ClearTextPassword" >> ../result.xml
echo. >> ../result.xml
secedit /EXPORT /CFG test.txt > nul
type test.txt | find /i "ClearTextPassword" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ���塱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ���ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ���塱 ��å�� ����롱 ���� �Ǿ� �ִ� ��� >> ../result.xml

echo ClearTextPassword = 0 ��� ���� >> ../result.xml
echo ClearTextPassword = 1 ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml


echo ^<Result^> >> ../result.xml
type test.txt | find /i "ClearTextPassword = 0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : ���ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ���塱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : ���ص� ������ ��ȣȭ�� ����Ͽ� ��ȣ ���塱 ��å�� ����롱 ���� �Ǿ� �ִ� ��� >> ../result.xml
) 
echo ^</Result^> >> ../result.xml
echo ^</W-5^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
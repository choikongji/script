echo ^<W-34^> >> ../result.xml
echo ^<Name^> �н����� ���⼺ ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -����� ��ȣ�� �н����� ���⼺�� �������� ���ϴ� �ݺ��Ǵ� ����, ���ӵǴ� >> ../result.xml
echo ����, �����̸��� ���Ե� �н����� ���� ����� ��� ������ ���� ���� >> ../result.xml
echo ^(Brute Force Attack^)�̳� �н����� ���� ����^(Password Guessing Attack^)�� >> ../result.xml
echo ���� ũ���� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG "PasswordComplexity" >> ../result.xml
echo. >> ../result.xml
secedit /EXPORT /CFG test.txt > nul
type test.txt | find "PasswordComplexity" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [���] : ����ȣ�� ���⼺�� �����ؾ� �ԡ� ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ��� >> ../result.xml
echo [��ȣ] : ����ȣ�� ���⼺�� �����ؾ� �ԡ� ��å�� ����롱 ���� �Ǿ� �ִ� ��� >> ../result.xml
echo PasswordComplexity = 0 ��� ���� >> ../result.xml
echo PasswordComplexity = 1 ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
type test.txt | find "PasswordComplexity = 0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] : ����ȣ�� ���⼺�� �����ؾ� �ԡ� ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [��ȣ] : ����ȣ�� ���⼺�� �����ؾ� �ԡ� ��å�� ����롱 ���� �Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-34^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
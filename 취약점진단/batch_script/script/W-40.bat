echo ^<W-40^> >> ../result.xml
echo ^<Name^> �͸� SID/�̸� ��ȯ ��� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo �� ��å�� ������ԡ����� ������ ��� ���� ���� ������ �ִ� ����ڰ� �� >> ../result.xml
echo �˷��� Administrator SID�� ����Ͽ� Administrator ������ ���� �̸��� >> ../result.xml
echo �˾Ƴ� �� ������ ��ȣ ���� ������ ������ �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG ^| find "EveryoneIncludesAnonymous=" >> ../result.xml
echo. >> ../result.xml
secedit /EXPORT /CFG test.txt > nul
type test.txt | find "EveryoneIncludesAnonymous=" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���͸� SID/�̸� ��ȯ ��롱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ���͸� SID/�̸� ��ȯ ��롱 ��å�� ����롱 ���� �Ǿ� �ִ� ��� >> ../result.xml
echo EveryoneIncludesAnonymous=4,0 = ��� ���� >> ../result.xml
echo EveryoneIncludesAnonymous=4,1 = ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
type test.txt | find "EveryoneIncludesAnonymous=4,0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : ���͸� SID/�̸� ��ȯ ��롱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : ���͸� SID/�̸� ��ȯ ��롱 ��å�� ����롱 ���� �Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-40^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt

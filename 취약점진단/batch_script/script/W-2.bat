echo ^<W-2^> >> ../result.xml
echo ^<Name^> Guest ���� ��Ȱ��ȭ ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Guest ������ �ý��ۿ� �ӽ÷� �׼����ؾ� �ϴ� ����ڿ� �������� >> ../result.xml
echo �� ������ ����Ͽ� ���� ���� ����ڰ� �ý��ۿ� �͸����� �׼����� �� �����Ƿ� >> ../result.xml
echo ���ΰ��� ����, ���� ���� �� ���� ������ ���� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net user guest ^| find "Account active" >> ../result.xml
echo. >> ../result.xml
net user guest | find "Account active" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : Guest ������ ��Ȱ��ȭ �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : Guest ������ Ȱ��ȭ �Ǿ� �ִ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml


echo ^<Result^> >> ../result.xml
net user guest | find /i "Account active" | find /i "No" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : Guest ������ ��Ȱ��ȭ �Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : Guest ������ Ȱ��ȭ �Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-2^> >> ../result.xml
echo. >> ../result.xml

echo ^<W-1^> >> ../result.xml
echo ^<Name^> Administrator ���� �̸� ���� �Ǵ� ���ȼ� ��ȭ ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�Ϲ������� ������ �������� �� �˷��� Administrator�� �������� ���� ��� >> ../result.xml
echo �������� ������� �н����� ���� ������ ���� ��� ���� ����� ������ ������, >> ../result.xml
echo �����ڸ� �����Ͽ� ħ������ �׼����� ����ϴ� �Ǽ��ڵ带 ������ ����� ���� >> ../result.xml
echo -�������� �ֻ��� ������ ������ Administrator�� �⺻������ �����ϰų� ��� �� ���� �������� ������� ��ǥ�� �� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net user find "Administrator" >> ../result.xml
echo. >> ../result.xml
net user | find "Administrator" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : Administrator Default ���� �̸��� �����ϰų� ��ȭ�� ��й�ȣ�� ������ ��� >> ../result.xml
echo [���] : Administrator Default ���� �̸��� �������� �ʰų� �ܼ� ��й�ȣ�� ������ ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<Result^> >> ../result.xml
net user | find /i "Administrator" > nul
if !ERRORLEVEL! EQU 0 (
	echo [���] Administrator Default ���� �̸��� ����Ǿ� ���� �����Ƿ� ����� >> ../result.xml
)else (
	echo [��ȣ] Administrator Default ���� �̸��� ����Ǿ� �����Ƿ� ��ȣ�� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-1^> >> ../result.xml
echo. >> ../result.xml


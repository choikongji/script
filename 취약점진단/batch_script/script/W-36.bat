echo ^<W-36^> >> ../result.xml
echo ^<Name^> �н����� �ִ� ��� �Ⱓ ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�������� �������� ���� �н����带 ���������� ����ϴ� ��� ��ȣ ���� >> ../result.xml
echo ���ݿ� ���� ����� �� �����Ƿ� ����ڰ� ��ȣ�� ���� �ٲٵ��� �ϸ� ��ȿ�� >> ../result.xml
echo ��ȣ�� ���ݴ��ϴ� ������ ���� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts find "Maximum password age (days):" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Maximum password age (days):" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �ִ� ��ȣ ��� �Ⱓ�� 90�� ���Ϸ� �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �ִ� ��ȣ ��� �Ⱓ�� �������� �ʾҰų� 90���� �ʰ��ϴ� ������ ������ ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
net accounts | find "Maximum password age (days):" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
if !b! LEQ 90 (
	if !b! GTR 0 (
		echo [��ȣ] : �ִ� ��ȣ ��� �Ⱓ�� 90�� ���Ϸ� �����Ǿ� �ִ� ��� >> ../result.xml
	)else (
		echo [���] : �ִ� ��ȣ ��� �Ⱓ�� �������� �ʾҰų� 90���� �ʰ��ϴ� ������ ������ ��� >> ../result.xml
	)
)else (
	echo [���] : �ִ� ��ȣ ��� �Ⱓ�� �������� �ʾҰų� 90���� �ʰ��ϴ� ������ ������ ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-36^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
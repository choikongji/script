echo ^<W-4^> >> ../result.xml
echo ^<Name^> ���� ��� �Ӱ谪 ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�����ڴ� �ý����� ���� ��� �Ӱ谪�� �������� ���� ��� �ڵ�ȭ�� ��� >> ../result.xml
echo �� �̿��Ͽ� ��� ����� ������ ���� ��ȣ���� ������ �����Ӱ� �õ��� �� >> ../result.xml
echo �����Ƿ� ����� ���� ������ ���� ������ ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts ^| find /i "Lockout threshold" >> ../result.xml
echo. >> ../result.xml
net accounts | find /i "Lockout threshold" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���� ��� �Ӱ谪�� 5 ������ ������ �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ���� ��� �Ӱ谪�� 6 �̻��� ������ �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ���� ��� �Ӱ谪�� �����Ǿ� ���� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml

net accounts | find /i "Lockout threshold" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
if not "!b!" EQU "Never" (
	if !b! LEQ 5 (
		echo [��ȣ] : ���� ��� �Ӱ谪�� 5 ������ ������ �����Ǿ� �ִ� ��� >> ../result.xml
	)else (
		echo [���] : ���� ��� �Ӱ谪�� 6 �̻��� ������ �����Ǿ� �ִ� ��� >> ../result.xml
	)
)else (
	echo [���] : ���� ��� �Ӱ谪�� �����Ǿ� ���� ���� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-4^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt

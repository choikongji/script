echo ^<W-33^> >> ../result.xml
echo ^<Name^> ���� ��� �Ⱓ ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�α��� ���� �� ���� �ð� ���� ���� ����� ���� ���� ���, �������� �ڵ�ȭ�� >> ../result.xml
echo ��ȣ ���� ������ �����Ͽ�, ����� ������ �н����� ������ ����� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts ^| find /i "Lockout threshold:" >> ../result.xml
echo. >> ../result.xml
echo net accounts | find /i "Lockout threshold:"
echo. >> ../result.xml
echo #net accounts ^| find "Lockout duration (minutes)" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Lockout duration (minutes):" >> ../result.xml
echo. >> ../result.xml
echo #net accounts ^| find "Lockout observation window (minutes):" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Lockout observation window (minutes):" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml


echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ��ȣ : ������ ��� �Ⱓ�� �� ������ ��� �Ⱓ ������� ���� �Ⱓ���� �����Ǿ��ִ� ��^(60�� �̻��� ������ �����ϱ⸦ �ǰ���^) >> ../result.xml
echo [���] : ��� : ������ ��� �Ⱓ�� �� ����� �Ⱓ ������� ���� �Ⱓ���� �������� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net accounts | find /i "Lockout threshold:" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
net accounts | find "Lockout duration (minutes):" > test1.txt
for /f "tokens=2 delims=:" %%a in (test1.txt) do (
	for %%b in (%%a) do (
		set c=%%b
	)
)
net accounts | find "Lockout observation window (minutes):" > test2.txt
for /f "tokens=2 delims=:" %%a in (test2.txt) do (
	for %%b in (%%a) do (
		set d=%%b
	)
)
if "!b!" EQU "Never" (
	echo [���] : "���� ��� �Ӱ谪"�� �����Ǿ� ���� ���� ��� >> ../result.xml
	goto END
)else (
	if "!c!" GEQ "60" (
		if "!d!" GEQ "60" (
			echo [��ȣ] : ��ȣ : ������ ��� �Ⱓ�� �� ������ ��� �Ⱓ ������� ���� �Ⱓ���� �����Ǿ��ִ� ��^(60�� �̻��� ������ �����ϱ⸦ �ǰ���^) >> ../result.xml
		)else (
			echo [���] : ��� : ������ ��� �Ⱓ�� �� ����� �Ⱓ ������� ���� �Ⱓ���� �������� ���� ��� >> ../result.xml
		)
	)else (
		echo [���] : ��� : ������ ��� �Ⱓ�� �� ����� �Ⱓ ������� ���� �Ⱓ���� �������� ���� ��� >> ../result.xml
	)
)
:END
echo ^</Result^> >> ../result.xml
echo ^</W-33^> >> ../result.xml
echo. >> ../result.xml
if exist test*.txt del test*.txt
echo ^<W-35^> >> ../result.xml
echo ^<Name^> �н����� �ּ� ��ȣ ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -ª�� �н����� �� �Ϲ����� �ܾ�� �Ϲ����� ��� �̿��� ��ȣ�� ������ >> ../result.xml
echo ��� ���� �����̳� ������ ��� ������ ������ �õ��ϴ� ������ ������ ���� >> ../result.xml
echo ���� �н����尡 ����� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts find "Minimum password length" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Minimum password length" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �ּ� ��ȣ ���̰� 8���� �̻����� �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �ּ� ��ȣ ���̰� �������� �ʾҰų� 8���� �̸����� �����Ǿ� �ִ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
net accounts | find "Minimum password length" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)

echo ^<Result^> >> ../result.xml
if !b! GEQ 8 (
	echo [��ȣ] : �ּ� ��ȣ ���̰� 8���� �̻����� �����Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : �ּ� ��ȣ ���̰� �������� �ʾҰų� 8���� �̸����� �����Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-35^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
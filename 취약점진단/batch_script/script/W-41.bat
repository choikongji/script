echo ^<W-41^> >> ../result.xml
echo ^<Name^> �ֱ� ��ȣ ��� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�ֱ� ��ȣ ��� ��å�� �������� ���� ��� Ư�� ������ ������ ��ȣ�� >> ../result.xml
echo �������� ����ϴ� ���� �����Ͽ� �����ڰ� ������ ������ ���� �н����� ���� >> ../result.xml
echo ���� ���ɼ��� Ŀ�� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts find "Length of password history maintained:" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Length of password history maintained:" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �ֱ� ��ȣ ����� 4�� �̻����� �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �ֱ� ��ȣ ����� 4�� �̸����� �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �ֱ� ��ȣ ����� �����Ǿ� ���� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
net accounts | find "Length of password history maintained:" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
echo ^<Result^> >> ../result.xml
if "!b!" EQU "None" (
	echo [���] : �ֱ� ��ȣ ����� �����Ǿ� ���� ���� ��� >> ../result.xml
)else (
	if !b! GEQ 4 (
		echo [��ȣ] : �ֱ� ��ȣ ����� 4�� �̻����� �����Ǿ� �ִ� ��� >> ../result.xml
	)else (
		echo [���] : �ֱ� ��ȣ ����� 4�� �̸����� �����Ǿ� �ִ� ��� >> ../result.xml
	)
)
echo ^</Result^> >> ../result.xml
echo ^</W-41^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt 
echo ^<W-37^> >> ../result.xml
echo ^<Name^> �н����� �ּ� ��� �Ⱓ ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�н����� ���� �� �ּ� ��� �Ⱓ�� �������� ���� ��� ����ڿ��� �ͼ��� >> ../result.xml
echo �н������ ��� ������ �����Ͽ�, �̸� ���������ν� ���� ��ȣ�� ���� �� >> ../result.xml
echo �ٽ� ����� �� ���� >> ../result.xml
echo -�н����� ���� ��å�� ���� �ֱ����� �н����� ������ ���ǹ��� �� �� ������, >> ../result.xml
echo �̷� ���� ������ ���� ���ȼ��� ���� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net accounts find "Minimum password age (days):" >> ../result.xml
echo. >> ../result.xml
net accounts | find "Minimum password age (days):" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �ּ� ��ȣ ��� �Ⱓ�� 0���� ū ������ �����Ǿ� �ִ� ��� >> ../result.xml
echo [���] : �ּ� ��ȣ ��� �Ⱓ�� 0���� �����Ǿ� �ִ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
net accounts | find "Minimum password age (days):" > test.txt
for /f "tokens=2 delims=:" %%a in (test.txt) do (
	for %%b in (%%a) do (
		set b=%%b
	)
)
if !b! GEQ 1 (
	echo [��ȣ] : �ּ� ��ȣ ��� �Ⱓ�� 0���� ū ������ �����Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : �ּ� ��ȣ ��� �Ⱓ�� 0���� �����Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-37^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
echo ^<W-6^> >> ../result.xml
echo ^<Name^> ������ �׷쿡 �ּ����� ����� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -Administrators�� ���� ������ �׷쿡 ���� �������� ��ǻ�� �ý��ۿ� ���� >> ../result.xml
echo �����ϰ� ���� ���� �׼��� ������ �����Ƿ�, ����ڸ� ������ �׷쿡 ���� >> ../result.xml
echo ��ų ��� ���ΰ� ����ڿ� ���� ������ ���� ������ �ο��� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net localgroup Administrators >> ../result.xml
echo. >> ../result.xml
net localgroup Administrators >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : Administrators �׷��� �������� 1�� ���Ϸ� �����ϰų�, ���ʿ��� ������ ������ �������� �ʴ� ��� >> ../result.xml
echo [���] : Administrators �׷쿡 ���ʿ��� ������ ������ �����ϴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml


echo ^<RESULT^> >> ../result.xml
echo [���ͺ�] >> ../result.xml
echo ^</RESULT^> >> ../result.xml
echo ^</W-6^> >> ../result.xml
echo. >> ../result.xml
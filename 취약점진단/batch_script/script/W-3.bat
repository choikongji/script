echo ^<W-3^> >> ../result.xml
echo ^<Name^> ���ʿ��� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�������� ���� ���ʿ��� ������ ��Ⱓ �н����尡 ������� �ʾ� ������ >> ../result.xml
echo ���� ����^(Brute Force Attack^)�̳� �н����� ���� ���� ^(Password Guessing >> ../result.xml
echo Attack^)�� ���ɼ��� �����ϸ�, ���� �̷� ���ݿ� ���� ���� ������ ����Ǿ� >> ../result.xml
echo �� ���� ����� �����ϱ� ����� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #net user >> ../result.xml
echo. >> ../result.xml
net user >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml

echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���ʿ��� ������ �������� �ʴ� ��� >> ../result.xml
echo [���] : ���ʿ��� ������ �����ϴ� ��� >> ../result.xml
echo 1. ����> ����> lusrmgr.msc ��ɾ� �Է� >> ../result.xml
echo 2. �����> �����ϴ� ������ ���� �뵵 Ȯ��^(��ũ������ ������ ���� �뵵 ��û^) >> ../result.xml
echo ^</Comment^> >> ../result.xml

echo ^<RESULT^> >> ../result.xml
echo [���ͺ�] >> ../result.xml
echo ^</RESULT^> >> ../result.xml
echo ^</W-3^> >> ../result.xml
echo. >> ../result.xml
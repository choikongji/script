echo ^<W-18^> >> ../result.xml
echo ^<Name^> �ֽ� HOT FIX ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�ֽ� Hot Fix�� ��� ������� ���� ��� �˷��� ��༺���� ���� �ý��� >> ../result.xml
echo ���� ���ɼ� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #HOT FIX>> ../result.xml
echo. >> ../result.xml
ver >> ../result.xml
systeminfo >> ../result.xml
wmic QFE Get HotFixID, InstalledOn > test.txt
type test.txt > test1.txt
type test1.txt >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �ֽ� Hotfix�� �ִ��� �ֱ������� ����͸��ϰ� �ݿ��ϰų�, PMS (PatchManagement System) Agent�� ��ġ�Ǿ� �ڵ���ġ������ ����� ��� >> ../result.xml
echo [���] : �ֽ� Hotfix�� �ִ��� �ֱ������� ����� ������ ���ų�, �ֽ� Hotfix�� �ݿ����� ���� ���, ���� PMS(Patch Management System) Agent�� ��ġ�Ǿ� ���� �ʰų�, ��ġ�Ǿ� ������ �ڵ���ġ������ ������� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
echo [��������] >> ../result.xml
echo ^</Result^> >> ../result.xml
echo ^</W-18^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
if exist test1.txt del test1.txt
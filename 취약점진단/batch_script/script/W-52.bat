echo ^<W-52^> >> ../result.xml
echo ^<Name^> ����� �۾��� �ǽɽ����� ����� ��ϵǾ� �ִ��� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���� �ð����� �̸� �����ص� ���α׷��� ������ �� �ִ� ����� �۾��� >> ../result.xml
echo �������α׷��� ���Ҿ ��ŷ�� Ʈ���� ��, �鵵� ��ġ�Ͽ� �����ϱ� ���� >> ../result.xml
echo ��Ʈ�� ���� �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml 
echo #schtasks >> ../result.xml
echo. >> ../result.xml
schtasks >> ../result.xml 
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���ʿ��� ��ɾ ���� �� �ֱ����� ���� �۾��� ���� ���θ� �ֱ������� �����ϰ� ������ ��� >> ../result.xml
echo [���] : ���ʿ��� ��ɾ ���� �� �ֱ����� ���� �۾��� ���� ���θ� �ֱ������� �������� �ʰų�, �ش� �۾��� �������� ���� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
echo [���ͺ�] >> ../result.xml
echo ^</Result^> >> ../result.xml
echo ^</W-52^> >> ../result.xml
echo. >> ../result.xml

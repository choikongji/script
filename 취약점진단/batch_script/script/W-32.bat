echo ^<W-32^> >> ../result.xml
echo ^<Name^> Everyone ��� ������ �͸� ����ڿ� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -�ش� ��å�� ����롱���� ������ ��� ������ ���� ����ڰ� �͸����� ���� >> ../result.xml
echo �̸� �� ���� ���ҽ��� �����ϰ� �� ������ ����Ͽ� ��ȣ�� �����ϰų� >> ../result.xml
echo DoS^(Denial of Service^) ������ ������ �� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo reg query "everyoneincludesanonymous" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "everyoneincludesanonymous" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ��Everyone ��� ������ �͸� ����ڿ��� ���롱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ��Everyone ��� ������ �͸� ����ڿ��� ���롱 ��å�� ����롱 ���� �Ǿ��ִ� ��� >> ../result.xml
echo everyoneincludesanonymous = 0x0 ������ >> ../result.xml 
echo everyoneincludesanonymous = 0x1 ��� >> ../result.xml 
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "everyoneincludesanonymous" | find "0x0" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : ��Everyone ��� ������ �͸� ����ڿ��� ���롱 ��å�� ����� �� �ԡ� ���� �Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : ��Everyone ��� ������ �͸� ����ڿ��� ���롱 ��å�� ����롱 ���� �Ǿ��ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-32^> >> ../result.xml
echo. >> ../result.xml
echo ^<W-55^> >> ../result.xml
echo ^<Name^> ���ݿ��� �̺�Ʈ �α� ���� ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^>>> ../result.xml
echo -���� �͸� ������� �ý��� �α� ���Ͽ� ������ ������ ��� ���߿� �ý��� >> ../result.xml
echo �αס� ���� �� �����ø����̼� �αס� �� �߿� ���� ���� ������ ���������������� >> ../result.xml
echo �� ������ ���� >> ../result.xml
echo ^</Security_Threat^>>> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #cacls systemroot\system32\config >> ../result.xml
echo. >> ../result.xml
icacls !systemroot!\system32\config >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : �α� ���丮�� ���ٱ��ѿ� Everyone ������ ���� ��� >> ../result.xml
echo [���] : �α� ���丮�� ���ٱ��ѿ� Everyone ������ �ִ� ��� >> ../result.xml
echo [���� ���] >> ../result.xml
echo N - ���� >> ../result.xml
echo R - �б� >> ../result.xml
echo W - ���� >> ../result.xml
echo C - �ٲٱ�^(����^) >> ../result.xml
echo F - ��� ���� >> ../result.xml
echo . >> ../result.xml
echo [��� ���] >> ../result.xml
echo CI - Container Inherit. >> ../result.xml
echo ACE�� ���͸��� ���� ��ӵ˴ϴ�. >> ../result.xml
echo OI - Object Inherit. >> ../result.xml
echo ACE�� ���Ͽ� ���� ��ӵ˴ϴ�. >> ../result.xml
echo IO - Inherit Only. >> ../result.xml
echo ACE�� ���� ����/���͸��� ������� �ʽ��ϴ�. >> ../result.xml
echo ID - Inherited. >> ../result.xml
echo ACE�� �θ� ���͸��� ACL���� ��ӵǾ����ϴ�. >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
icacls !systemroot!\system32\config | findstr /i "Everyone"
if !ERRORLEVEL! EQU 0 (
	echo [���] : �α� ���丮�� ���ٱ��ѿ� Everyone ������ �ִ� ��� >> ../result.xml
)else (
	echo [��ȣ] : �α� ���丮�� ���ٱ��ѿ� Everyone ������ ���� ��� >> ../result.xml
)
echo ^</Result^>.txt >> ../result.xml
echo ^</W-55^> >> ../result.xml
echo. >> ../result.xml
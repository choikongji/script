echo ^<W-39^> >> ../result.xml
echo ^<Name^> ���� �α׿� ��� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo ���ʿ��� ����ڿ��� ���� �α׿��� ���� ��� ���ΰ��ڸ� ���� ���� >> ../result.xml
echo ����� ���� �Ǽ� �ڵ��� ���� ����� ���� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #secedit /EXPORT /CFG test1.txt ^| find "SeInteractiveLogonRight" >> ../result.xml
echo. >> ../result.xml
secedit /EXPORT /CFG test1.txt > nul
type test1.txt | find "SeInteractiveLogonRight" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���� �α׿� ��� ��å�� Administrators, IUSR_ �� �����ϴ� ��� >> ../result.xml
echo [���] : ���� �α׿� ��� ��å�� Administrators, IUSR_ �� �ٸ� ���� �� �׷��� >> ../result.xml
echo �����ϴ� ��� >> ../result.xml
echo *S-1-5-32-544 = ������*S-1-5-32-545 = ����� *S-1-5-32-551 = ��������� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
type test1.txt | find "SeInteractiveLogonRight" > nul
echo [��������] >> ../result.xml
echo ^</Result^> >> ../result.xml
echo ^</W-39^> >> ../result.xml
echo. >> ../result.xml
if exist test1.txt del test1.txt

echo ^<W-53^> >> ../result.xml
echo ^<Name^> ��å�� ���� �ý��� �α� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -���� ������ �����Ǿ� ���� �ʰų� ���� ���� ������ �ʹ� ���� ��� ���� >> ../result.xml
echo ���� ���� �߻� �� ������ �ľ��ϱ� ������ ���� ������ ���� ����� ���� >> ../result.xml
echo Ȯ���� ����� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml 
secedit /EXPORT /CFG test.txt > nul
type test.txt | find "AuditObjectAccess" >> ../result.xml
type test.txt | find "AuditAccountManage" >> ../result.xml
type test.txt | find "AuditAccountLogon" >> ../result.xml
type test.txt | find "AuditPrivilegeUse" >> ../result.xml
type test.txt | find "AuditDSAccess" >> ../result.xml
type test.txt | find "AuditLogonEvents"  >> ../result.xml
type test.txt | find "AuditSystemEvents" >> ../result.xml
type test.txt | find "AuditPolicyChange" >> ../result.xml
type test.txt | find "AuditProcessTracking" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : ���� ��å �ǰ� ���ؿ� ���� ���� ������ �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : ���� ��å �ǰ� ���ؿ� ���� ���� ������ �Ǿ� ���� �ʴ� ��� >> ../result.xml
echo "AuditObjectAccess" = ��ü �׼��� ���� >> ../result.xml
echo "AuditAccountManage" = ���� ���� ���� >> ../result.xml
echo "AuditAccountLogon" = ���� �α׿� �̺�Ʈ ���� >> ../result.xml
echo "AuditPrivilegeUse" = ���� ��� ���� >> ../result.xml
echo "AuditDSAccess" = ���͸� ���� �׼��� ���� >> ../result.xml
echo "AuditLogonEvents" = �α׿� �̺�Ʈ ���� >> ../result.xml
echo "AuditSystemEvents" = �ý��� �̺�Ʈ ���� >> ../result.xml
echo "AuditPolicyChange" = ��å ���� ���� >> ../result.xml
echo "AuditProcessTracking" = ���μ��� ���� ���� >> ../result.xml
echo 0 = ������� 1 = ���� 2 = ���� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

set flag=True

type test.txt | find "AuditSystemEvents = 0" > nul
if !ERRORLEVEL! EQU 1 (
	set flag=False
)
type test.txt | find "AuditLogonEvents = 3" > nul
if !ERRORLEVEL! EQU 1 (
	set flag=False
)
type test.txt | find "AuditObjectAccess = 0" > nul
if !ERRORLEVEL! EQU 1 (
	set flag=False
)
type test.txt | find "AuditPrivilegeUse = 2" > nul
if !ERRORLEVEL! EQU 1 (
	set flag=False
)
type test.txt | find "AuditPolicyChange = 3" > nul
if !ERRORLEVEL! EQU 1 (
	set flag=False
)
type test.txt | find "AuditAccountManage = 2" > nul
if !ERRORLEVEL! EQU 1 (
	set flag=False
)
type test.txt | find "AuditProcessTracking = 0" > nul
if !ERRORLEVEL! EQU 1 (
	set flag=False
)
type test.txt | find "AuditDSAccess = 2" > nul
if !ERRORLEVEL! EQU 1 (
	set flag=False
)
type test.txt | find "AuditAccountLogon = 3" > nul
if !ERRORLEVEL! EQU 1 (
	set flag=False
)
if "!flag!" EQU "False" (
	echo [���] : ���� ��å �ǰ� ���ؿ� ���� ���� ������ �Ǿ� ���� �ʴ� ��� >> ../result.xml
)else (
	echo [��ȣ] : ���� ��å �ǰ� ���ؿ� ���� ���� ������ �Ǿ� �ִ� ��� >> ../result.xml
)

if exist test.txt del test.txt
echo ^</Result^> >> ../result.xml
echo ^</W-53^> >> ../result.xml
echo. >> ../result.xml
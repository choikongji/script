echo ^<W-53^> >> ../result.xml
echo ^<Name^> 정책에 따른 시스템 로깅 설정 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -감사 설정이 구성되어 있지 않거나 감사 설정 수준이 너무 낮은 경우 보안 >> ../result.xml
echo 관련 문제 발생 시 원인을 파악하기 어려우며 법적 대응을 위한 충분한 증거 >> ../result.xml
echo 확보가 어려움 >> ../result.xml
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
echo [양호] : 감사 정책 권고 기준에 따라 감사 설정이 되어 있는 경우 >> ../result.xml
echo [취약] : 감사 정책 권고 기준에 따라 감사 설정이 되어 있지 않는 경우 >> ../result.xml
echo "AuditObjectAccess" = 개체 액세스 감사 >> ../result.xml
echo "AuditAccountManage" = 계정 관리 감사 >> ../result.xml
echo "AuditAccountLogon" = 계정 로그온 이벤트 감사 >> ../result.xml
echo "AuditPrivilegeUse" = 권한 사용 감사 >> ../result.xml
echo "AuditDSAccess" = 디렉터리 서비스 액세스 감사 >> ../result.xml
echo "AuditLogonEvents" = 로그온 이벤트 감사 >> ../result.xml
echo "AuditSystemEvents" = 시스템 이벤트 감사 >> ../result.xml
echo "AuditPolicyChange" = 정책 변경 감사 >> ../result.xml
echo "AuditProcessTracking" = 프로세스 추적 감사 >> ../result.xml
echo 0 = 감사안함 1 = 성공 2 = 실패 >> ../result.xml
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
	echo [취약] : 감사 정책 권고 기준에 따라 감사 설정이 되어 있지 않는 경우 >> ../result.xml
)else (
	echo [양호] : 감사 정책 권고 기준에 따라 감사 설정이 되어 있는 경우 >> ../result.xml
)

if exist test.txt del test.txt
echo ^</Result^> >> ../result.xml
echo ^</W-53^> >> ../result.xml
echo. >> ../result.xml
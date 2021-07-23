echo ^<W-18^> >> ../result.xml
echo ^<Name^> 최신 HOT FIX 적용 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -최신 Hot Fix가 즉시 적용되지 않은 경우 알려진 취약성으로 인한 시스템 >> ../result.xml
echo 공격 가능성 존재 >> ../result.xml
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
echo [양호] : 최신 Hotfix가 있는지 주기적으로 모니터링하고 반영하거나, PMS (PatchManagement System) Agent가 설치되어 자동패치배포가 적용된 경우 >> ../result.xml
echo [취약] : 최신 Hotfix가 있는지 주기적으로 모니터 절차가 없거나, 최신 Hotfix를 반영하지 않은 경우, 또한 PMS(Patch Management System) Agent가 설치되어 있지 않거나, 설치되어 있으나 자동패치배포가 적용되지 않은 경우 >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
echo [수동점검] >> ../result.xml
echo ^</Result^> >> ../result.xml
echo ^</W-18^> >> ../result.xml
echo. >> ../result.xml
if exist test.txt del test.txt
if exist test1.txt del test1.txt
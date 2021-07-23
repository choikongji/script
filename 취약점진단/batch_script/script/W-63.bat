REM setlocal enabledelayedexpansion 
echo ^<W-63^> >> ../result.xml
echo ^<Name^> ���� �� ���丮 ��ȣ ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -FAT ���� �ý��� ��� �� ����ں� ���� ������ ������ �� ���� �߿� ������ >> ../result.xml
echo ���� å�� ������ Ȯ���� ����� >> ../result.xml
echo ^</Security_Threat^> >> ../result.xml

echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #fsutil fsinfo drives >> ../result.xml
echo. >> ../result.xml
fsutil fsinfo drives > test.txt
for /f "tokens=2 delims= " %%a in (test.txt) do (
	echo %%a >> test1.txt
)
type test1.txt >> ../result.xml
echo #fsutil fsinfo volumeInfo drives ^| find "File System Name" >> ../result.xml
echo. >> ../result.xml
for /f %%b in (test1.txt) do (
	fsutil fsinfo volumeInfo %%b | find "File System Name" >> ../result.xml
)

echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : NTFS ���� �ý����� ����ϴ� ��� >> ../result.xml
echo [���] : FAT���� �ý����� ����ϴ� ��� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml

set flag=True

for /f %%c in (test1.txt) do (
	fsutil fsinfo volumeInfo %%c | findstr /C:"NTFS" > nul
	if !ERRORLEVEL! EQU 1 (
		set flag=False
	)
)

if /i "!flag!" EQU "False" (
	echo [���] : FAT���� �ý����� ����ϴ� ��� >> ../result.xml
)else (
	echo [��ȣ] : NTFS ���� �ý����� ����ϴ� ��� >> ../result.xml
)

echo ^</Result^> >> ../result.xml
echo ^</W-63^> >> ../result.xml
echo. >> ../result.xml
if exist test*.txt del test*.txt
REM endlocal
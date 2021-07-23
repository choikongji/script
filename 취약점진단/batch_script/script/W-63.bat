REM setlocal enabledelayedexpansion 
echo ^<W-63^> >> ../result.xml
echo ^<Name^> 파일 및 디렉토리 보호 ^</Name^> >> ../result.xml
echo ^<Security_Threat^> >> ../result.xml
echo -FAT 파일 시스템 사용 시 사용자별 접근 통제를 적용할 수 없어 중요 정보에 >> ../result.xml
echo 대한 책임 추적성 확보가 어려움 >> ../result.xml
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
echo [양호] : NTFS 파일 시스템을 사용하는 경우 >> ../result.xml
echo [취약] : FAT파일 시스템을 사용하는 경우 >> ../result.xml
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
	echo [취약] : FAT파일 시스템을 사용하는 경우 >> ../result.xml
)else (
	echo [양호] : NTFS 파일 시스템을 사용하는 경우 >> ../result.xml
)

echo ^</Result^> >> ../result.xml
echo ^</W-63^> >> ../result.xml
echo. >> ../result.xml
if exist test*.txt del test*.txt
REM endlocal
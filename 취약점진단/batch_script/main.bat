@echo off
chcp 437

setlocal enabledelayedexpansion
cd > pwd.txt
set /p pwd=<pwd.txt
del pwd.txt

cd script
echo ^<?xml version="1.0" encoding="UTF-8" ?^> > ../result.xml
echo ^<Windows^> >> ../result.xml
call W-1.bat
call W-2.bat
call W-3.bat
call W-4.bat
call W-5.bat
call W-6.bat
call W-7.bat
call W-8.bat
call W-9.bat
call W-10.bat
call W-11.bat
call W-12.bat
call W-13.bat
call W-14.bat
call W-15.bat
call W-16.bat
call W-17.bat
call W-18.bat
call W-19.bat
call W-20.bat
call W-21.bat
call W-22.bat
call W-23.bat
call W-24.bat
call W-25.bat
call W-26.bat
call W-27.bat
call W-28.bat
call W-29.bat
call W-30.bat
call W-31.bat
call W-32.bat
call W-33.bat
call W-34.bat
call W-35.bat
call W-36.bat
call W-37.bat
call W-38.bat
call W-39.bat
call W-40.bat
call W-41.bat
call W-42.bat
call W-43.bat
call W-44.bat
call W-45.bat
call W-46.bat
call W-47.bat
call W-48.bat
call W-49.bat
call W-50.bat
call W-51.bat
call W-52.bat
call W-53.bat
call W-54.bat
call W-55.bat
call W-56.bat
call W-57.bat
call W-58.bat
call W-59.bat
call W-60.bat
call W-61.bat
call W-62.bat
call W-63.bat
call W-64.bat
call W-65.bat

echo ^</Windows^> >> ../result.xml
ren ..\result.xml tmp.xml
powershell "Get-Content -LiteralPath '!pwd!\tmp.xml' | Set-Content -Encoding utf8 -LiteralPath '!pwd!\result.xml'"
del ..\tmp.xml

endlocal
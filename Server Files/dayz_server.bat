@echo off
COLOR 0B
set mod=%1

tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld">NUL
if "%ERRORLEVEL%"=="0" goto server
if "%ERRORLEVEL%"=="1" start tools\3rdparty\silentcmd tools\database\bin\mysqld --defaults-file=tools\Database\bin\my.ini --standalone --console & echo Starting Database server... & REM ping -n 10 127.0.0.1>nul

:server
start "arma2" /min "Expansion\beta\arma2oaserver.exe" -beta=Expansion\beta;Expansion\beta\Expansion -port=2302 "-config=ServerFiles\DayZ_Splights\DayZ_Splights_11_Chernarus\config.cfg" "-cfg=ServerFiles\DayZ_Splights\DayZ_Splights_11_Chernarus\basic.cfg" "-profiles=ServerFiles\DayZ_Splights\DayZ_Splights_11_Chernarus" -name=DayZ_Splights_11_Chernarus "-mod=@DayZ_Splights;ServerFiles\DayZ_Splights\@DayZ_Splights_Server" -noCB -noPause -noSound -cpuCount=1 -exThreads=1 -maxMem=2048
exit

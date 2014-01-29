@echo off
COLOR 0B
setlocal ENABLEEXTENSIONS

if exist "%commonprogramfiles(x86)%" (
FOR /F "tokens=2*" %%A IN ('REG.exe query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Bohemia Interactive\ArmA 2\BattlEye" /v "MAIN"') DO (set pInstallDir=%%B)
) else (
FOR /F "tokens=2*" %%A IN ('REG.exe query "HKEY_LOCAL_MACHINE\SOFTWARE\Bohemia Interactive\ArmA 2\BattlEye" /v "MAIN"') DO (set pInstallDir=%%B)
)

if exist Build (RD /S /Q Build & mkdir Build) else mkdir Build

cd SQF
echo Build PBO files...
echo.

..\Tools\cpbo.exe -y -p dayz_code
..\Tools\cpbo.exe -y -p dayz_epoch
..\Tools\cpbo.exe -y -p dayz_server
..\Tools\cpbo.exe -y -p dayz_sfx

..\Tools\cpbo.exe -y -p SOW_sounds

echo.
echo Move PBO files...
echo.

mkdir ..\Build\@DayZ_Splights\addons\
mkdir ..\Build\ServerFiles\DayZ_Splights\@DayZ_Splights_Server\addons
move dayz_server.pbo ..\Build\ServerFiles\DayZ_Splights\@DayZ_Splights_Server\addons
move *.pbo ..\Build\@DayZ_Splights\addons\

copy extras\*.* ..\Build\@DayZ_Splights\
copy extras\addons\*.* ..\Build\@DayZ_Splights\addons\

echo.
echo Generate bikey...
echo.

if exist ..\Build\Keys (RD /S /Q ..\Build\Keys & mkdir ..\Build\Keys) else mkdir ..\Build\Keys
cd ..\Build\Keys
..\..\Tools\DSCreateKey.exe dayz_splights
REM copy "..\..\Server Files\Keys\*.*"

echo.
echo Generate bisign's...
echo.

..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz_anim.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz_code.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz_epoch.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz_epoch_b.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz_sfx.pbo
REM ..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\epoch_buildings.pbo

..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\ASC_EU_Lights.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\csj_gyroac.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz_communityassets.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz_equip.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz_vehicles.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\dayz_weapons.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\glt_m300t.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\gnt_c185.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\jetskiyanahui.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\MAP_EU.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\sigisolda.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\st_bunnyhop.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\st_collision.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\st_evasive.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\suv_colours.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\vilas_cpl.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\vilas_cpl_core.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\weapons_a2ru.pbo

..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\smk_anims_lite.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\SOW_sounds.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\ns_mutants.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\gsc_stalker.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\misc.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\skins.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\SOW_sounds_c.pbo

..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\gdtmod_plants2_tree.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\gdtmod_plants2_plant.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\gdtmod_plants2_misc.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\gdtmod_plants2_clutter.pbo
..\..\Tools\DSSignFile.exe dayz_splights.biprivatekey ..\@DayZ_Splights\addons\gdtmod_plants2_bush.pbo

echo.
echo Move and clean files...
echo.

del *.biprivatekey

echo.
echo Build missions...
echo.

cd ..\.. & cd Server Files\MPMissions\
..\..\Tools\cpbo.exe -y -p DayZ_Epoch_11.Chernarus
..\..\Tools\cpbo.exe -y -p DayZ_Epoch_25.sauerland

echo.
mkdir ..\..\Build\MPMissions\
move DayZ_Epoch_11.Chernarus.pbo ..\..\Build\MPMissions\DayZ_Splights_11.Chernarus.pbo
move DayZ_Epoch_25.sauerland.pbo ..\..\Build\MPMissions\DayZ_Splights_25.sauerland.pbo

echo.
echo Copy binaries and configs...
echo.

cd ..\..\
copy "Server Files\Binaries\Database.dll" Build
copy "Server Files\Binaries\tbb.dll" Build
copy "Server Files\Binaries\tbbmalloc.dll" Build
copy "Server Files\Binaries\DatabaseMySql.dll" Build
copy "Server Files\Binaries\DatabasePostgre.dll" Build

echo.
echo Copy Chernarus server files...
echo.

mkdir Build\ServerFiles\DayZ_Splights\DayZ_Splights_11_Chernarus\
copy "Server Files\Configs\instance_11_Chernarus\HiveExt.ini" Build\ServerFiles\DayZ_Splights\DayZ_Splights_11_Chernarus\
copy "Server Files\Configs\instance_11_Chernarus\config.cfg" Build\ServerFiles\DayZ_Splights\DayZ_Splights_11_Chernarus\

mkdir Build\ServerFiles\DayZ_Splights\DayZ_Splights_11_Chernarus\BattlEye\
copy "Server Files\Battleye\*.*" Build\ServerFiles\DayZ_Splights\DayZ_Splights_11_Chernarus\BattlEye\

REM echo.
REM echo Copy SauerLand server files...
REM echo.

REM mkdir Build\ServerFiles\DayZ_Splights\DayZ_Splights_25_sauerland\
REM copy "Server Files\Configs\instance_25_sauerland\HiveExt.ini" Build\ServerFiles\DayZ_Splights\DayZ_Splights_25_sauerland\
REM copy "Server Files\Configs\instance_25_sauerland\config.cfg" Build\ServerFiles\DayZ_Splights\DayZ_Splights_25_sauerland\

REM mkdir Build\ServerFiles\DayZ_Splights\DayZ_Splights_25_sauerland\BattlEye\
REM copy "Server Files\Battleye\*.*" Build\ServerFiles\DayZ_Splights\DayZ_Splights_25_sauerland\BattlEye\

copy "Server Files\dayz_game.bat" Build
copy "Server Files\dayz_server.bat" Build
copy "Server Files\Binaries\HiveExt.dll" Build\ServerFiles\DayZ_Splights\@DayZ_Splights_Server\

echo.
echo Copy tools and database...
echo.

mkdir Build\Tools
copy Tools\*.* Build\Tools
mkdir Build\Tools\3rdparty
copy Tools\3rdparty\*.* Build\Tools\3rdparty
mkdir Build\Tools\redist
copy Tools\redist\*.* Build\Tools\redist
copy "Server Files\mysql\epoch.sql" Build\Tools

echo.
echo Copy files into ArmA 2 folder...
echo.

RD /S /Q "%pInstallDir%\@DayZ_Splights"
RD /S /Q "%pInstallDir%\ServerFiles"
del "%pInstallDir%\Keys\dayz_splights.bikey"
del "%pInstallDir%\MPMissions\DayZ_Splights_11.Chernarus.pbo"
del "%pInstallDir%\MPMissions\DayZ_Splights_25.sauerland.pbo"

del "%pInstallDir%\dayz_server.bat"
del "%pInstallDir%\dayz_game.bat"
del "%pInstallDir%\tbbmalloc.dll"
del "%pInstallDir%\tbb.dll"
del "%pInstallDir%\Database.dll"

xcopy Build "%pInstallDir%" /y /E /H /R

if exist "%pInstallDir%\Tools\Database\bin\mysql.exe" (
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld">NUL
if "%ERRORLEVEL%"=="0" "%pInstallDir%\tools\database\bin\mysqladmin" -u root -p123456 --port=3310 shutdown & goto start_mysql
if "%ERRORLEVEL%"=="1" goto start_mysql
) else (
"tools\3rdparty\rar.exe" x "Server Files\Database.rar" "%pInstallDir%\Tools" & goto start_mysql
)

:start_mysql
cd "%pInstallDir%"
start tools\database\bin\mysqld --defaults-file=tools\database\bin\my.ini --standalone --console & echo Starting Database server...
ping -n 30 127.0.0.1>nul
echo.
echo Update database...
tools\database\bin\mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=dayz_splights < Tools\epoch.sql


echo.
echo Shutdown MySQL server...
tools\database\bin\mysqladmin -u root -p123456 --port=3310 shutdown
echo.

pause
exit

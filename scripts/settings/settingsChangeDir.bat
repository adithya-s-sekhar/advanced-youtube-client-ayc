:settingsChangeDir
mode %window_small%
color 07
title Change Download Location
cls
set "settings_dir="
call gui bannerSmall
echo.
if %loc_invalid% == 0 echo  Current download folder is:
if %loc_invalid% == 1 echo  Invalid download folder:
echo  %loc%
echo.
echo ----------------------------------------------
echo.
echo  Drag and Drop the folder you want AYC to save
echo  it's downloads into the below area.
echo.
echo  Then Press Enter to save.
echo.
echo  Leave blank and Enter to Go Back.
echo.
echo  Or Enter R to reset to default location.
echo.
echo ----------------------------------------------
echo.
set /p settings_dir=Drag and Drop here: 
if %loc_invalid% == 0 if not defined settings_dir goto :EOF
if %loc_invalid% == 1 if not defined settings_dir goto settingsChangeDir
set settings_dir=%settings_dir:"=%
if "%settings_dir%" == "r" set settings_dir=%cd%\Output
if "%settings_dir%" == "R" set settings_dir=%cd%\Output
echo "%settings_dir%">"%aycdata%\dir.txt"
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
if not exist "%loc%\" md "%loc%"
if not exist "%loc%\" set loc_invalid=1 && goto settingsChangeDir
goto :EOF

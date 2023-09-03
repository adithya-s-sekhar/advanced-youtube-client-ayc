:settingsChangeTmpDir
call tui windowSize %small_width% 36
color 07
title Change temporary folder location
cls
set "settings_tmp_dir="
call tui bannerSmall
echo.
if %tmp_loc_invalid% == 0 echo  Current temporary folder:
if %tmp_loc_invalid% == 1 echo  Invalid temporary folder:
echo  %tmp_loc%
echo.
call tui borderSmall
echo.
echo  * Drag and Drop the folder you want AYC to save it's 
echo    temporary files into the below area. Or type/paste 
echo    the location manually.
echo.
echo    Then Press Enter to save.
echo.
echo  * Leave blank and Enter to Go Back.
echo.
echo  * Enter R to reset to default location.
echo.
call tui borderSmallHalf
echo.
set /p settings_tmp_dir=Drag and Drop/Paste here: 
if %tmp_loc_invalid% == 0 if not defined settings_tmp_dir goto :EOF
if %tmp_loc_invalid% == 1 if not defined settings_tmp_dir goto settingsChangeTmpDir
set settings_tmp_dir=%settings_tmp_dir:"=%
if "%settings_tmp_dir%" == "r" set settings_tmp_dir=%cd%\tmp
if "%settings_tmp_dir%" == "R" set settings_tmp_dir=%cd%\tmp
echo "%settings_tmp_dir%">"%aycdata%\tmp_dir.txt"
set tmp_loc="%settings_tmp_dir%"
set tmp_loc=%tmp_loc:"=%
if not exist "%tmp_loc%\" md "%tmp_loc%"
if not exist "%tmp_loc%\" set tmp_loc_invalid=1 && goto settingsChangeTmpDir
goto :EOF

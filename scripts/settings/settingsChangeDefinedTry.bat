:settingsChangeDefinedTry
mode %window_small%
color 07
title Change recheck attempts
cls
set "settings_try="
call gui bannerSmall
echo.
echo  Change recheck attempts
echo.
echo  On unstable connections, playlist/batch download can 
echo  sometimes miss a file and will fail the download.
echo.
echo  The number you set here is the number of times AYC will 
echo  recheck the download to see if any files are missing.
echo.
echo  If it found any, that missing file will be downloaded.
if %try_invalid% == 1 (
    echo.
    echo  Invalid value detected: %defined_try%
    echo. 
    echo  Enter a number or Enter R to reset to default value.
)
if %try_invalid% == 0 (
    echo.
    echo  Current value: %defined_try%
    echo.
    echo  Leave blank and Enter to go back.
)
echo.
echo ------------------------------------------------------------
echo.
set /p settings_try=No. of Rechecks: 
if %try_invalid% == 0 if not defined settings_try goto :EOF
if %try_invalid% == 1 if not defined settings_try goto settingsChangeDefinedTry
if %try_invalid% == 1 if %settings_try% == r set settings_try=0
if %try_invalid% == 1 if %settings_try% == R set settings_try=0
echo "%settings_try%">"%aycdata%\try.txt"
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
echo %defined_try%| findstr /r "^[0-9][0-9]*$">nul
if not %errorlevel% == 0 set try_invalid=1 && goto settingsChangeDefinedTry
if %try_invalid% == 1 set try_invalid=0
goto :EOF

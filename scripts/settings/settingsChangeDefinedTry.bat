:settingsChangeDefinedTry
mode %window_small%
color 07
title Change retry attempts
cls
set "settings_try="
call tui bannerSmall
echo.
echo  Change retry attempts
echo.
echo  The number you set here is the number of times AYC will 
echo  retry the download if a network error occurs.
echo.
if %try_invalid% == 1 (
    echo  Invalid value detected: %defined_try%
    echo. 
    echo  Enter a number or Enter R to reset to default value.
)
if %try_invalid% == 0 (
    echo  Current value: %defined_try%
    echo.
    echo  Leave blank and Enter to go back.
)
echo.
echo ------------------------------------------------------------
echo.
set /p settings_try=No. of retry attempts: 
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

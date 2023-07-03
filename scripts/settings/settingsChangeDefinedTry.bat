:settingsChangeDefinedTry
mode %window_small%
color 07
title Change retry attempts
cls
set "settings_try="
call tui bannerSmall
echo.
if %try_invalid% == 0 echo  Current retry attempts: %defined_try%
if %try_invalid% == 1 echo  Invalid value: %defined_try%
echo.
echo ----------------------------------------------
echo.
echo  * The number you set here is the number of times AYC
echo    will retry the download if a network error occurs.
echo.
if %try_invalid% == 0 (
    echo  * Leave blank and Enter to Go back.
    echo.
)
if %try_invalid% == 1 (
    echo  * Enter a valid number.
    echo.
)
echo  * Enter R to reset to default value.
echo.
echo ----------------------------------------------
echo.
set /p settings_try=No. of retry attempts: 
if %try_invalid% == 0 if not defined settings_try goto :EOF
if %try_invalid% == 1 if not defined settings_try goto settingsChangeDefinedTry
if %settings_try% == r set settings_try=0
if %settings_try% == R set settings_try=0
echo "%settings_try%">"%aycdata%\try.txt"
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
echo %defined_try%| findstr /r "^[0-9][0-9]*$">nul
if not %errorlevel% == 0 set try_invalid=1 && goto settingsChangeDefinedTry
if %try_invalid% == 1 set try_invalid=0
goto :EOF

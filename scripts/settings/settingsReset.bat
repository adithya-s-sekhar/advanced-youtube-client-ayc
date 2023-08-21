:settingsReset
mode %window_small%
color 04
title Reset AYC
cls
call tui bannerSmall
echo.
echo  You are about to reset AYC to it's default settings.
echo.
echo  This should fix any issues caused by incorrect or corrupted settings.
echo.
call tui borderSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Reset and Exit AYC
echo.
call tui borderSmallHalf
echo.
choice /C 01 /n /m "Choose option (0-1): "
if %errorlevel% == 1 goto :EOF
goto settingsResetFinish

:settingsResetFinish
mode %window_small%
del /q "%aycdata%\first_run.txt"
del /q "%aycdata%\dir.txt"
del /q "%aycdata%\tmp_dir.txt"
del /q "%aycdata%\try.txt"
del /q "%aycdata%\aria2_status.txt"
del /q "%aycdata%\thumbs_status.txt"
del /q "%aycdata%\subs_status.txt"
del /q "%aycdata%\external_version.txt"
del /q "%aycdata%\youtube_dl_version.txt"
title Reset Succesfully
color 02
cls
call tui bannerSmall
echo.
echo  AYC reset succesfully.
echo.
timeout /t 5 /nobreak
exit

:settingsMenu
mode %window_small%
color 07
title AYC Settings
cls
call tui bannerSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Change Download Folder
echo        Currently: %loc%
echo.
echo  (2) - Number of Rechecks
echo        Currently: %defined_try%
echo.
echo  (3) - Update yt-dlp (fixes most issues)
echo        Currently: %youtube_dl_version%
echo.
echo  (4) - Force aria2 on all downloads
if %aria2_status% == 0 echo        [Disabled]
if %aria2_status% == 1 echo        [Enabled]
echo.
echo  (5) - Embed Thumbnails
if %thumbs_status% == 0 echo        [Disabled]
if %thumbs_status% == 1 echo        [Enabled]
echo.
echo  (6) - Embed Subtitles
if %subs_status% == 0 echo        [Disabled]
if %subs_status% == 1 echo        [Enabled]
echo.
echo  (7) - Reset AYC
echo.
echo -----------------------------------
echo.
choice /c 01234567 /n /m "Select Option (0-7): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 call settingsChangeDir
if %errorlevel% == 3 call settingsChangeDefinedTry
if %errorlevel% == 4 call settingsYtUpdate
if %errorlevel% == 5 call settingsToggles ChangeAria2
if %errorlevel% == 6 call settingsToggles ChangeThumbs
if %errorlevel% == 7 call settingsToggles ChangeSubs
if %errorlevel% == 8 call settingsReset

goto :settingsMenu

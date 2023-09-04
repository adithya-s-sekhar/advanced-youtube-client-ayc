:settingsMenu
call tui windowSize %small_width% 31
color %theme_colors%
title AYC Settings
cls
call tui bannerSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Manage folders
echo        Change download and temporary folders.
echo.
echo  (2) - Change retry attempts
echo        Currently: %defined_try%
echo.
echo  (3) - Multi-threaded downloading
if %aria2_status% == 0 echo        [Disabled]
if %aria2_status% == 1 echo        [Enabled for non-youtube downloads]
if %aria2_status% == 2 echo        [Enabled for all downloads]
echo.
echo  (4) - Embed thumbnails
if %thumbs_status% == 0 echo        [Disabled]
if %thumbs_status% == 1 echo        [Enabled]
echo.
echo  (5) - Embed subtitles
if %subs_status% == 0 echo        [Disabled]
if %subs_status% == 1 echo        [Enabled]
echo.
echo  (6) - Change theme - QuickKey: t
if %theme_status% == 0 echo        [Dark]
if %theme_status% == 1 echo        [Light]
if %theme_status% == 2 echo        [Blue]
if %theme_status% == 3 echo        [Purple]
if %theme_status% == 4 echo        [Yellow]
if %theme_status% == 5 echo        [Red]
echo.
echo  (7) - Reset AYC
echo.
call tui borderSmallHalf
echo.
choice /c 01234567 /n /m "Select Option (0-7): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 call settingsChangeDirHome
if %errorlevel% == 3 call settingsChangeDefinedTry
if %errorlevel% == 4 call settingsToggles ChangeAria2
if %errorlevel% == 5 call settingsToggles ChangeThumbs
if %errorlevel% == 6 call settingsToggles ChangeSubs
if %errorlevel% == 7 call settingsToggles ChangeTheme
if %errorlevel% == 8 call settingsReset
goto :settingsMenu

:moreMenu
mode %window_small%
color 07
title More Options
cls
call tui bannerSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Batch Mode         QuickKey: B
echo.
echo  (2) - Settings           QuickKey: S
echo.
echo  (3) - About
echo.
echo  (4) - Visit on GitHub
echo.
echo  (5) - Visit on Sourceforge
echo.
echo  (6) - Follow on Telegram
echo.
call tui borderSmallHalf
echo.
choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 start AYClient.bat "b"
if %errorlevel% == 3 call settingsMenu
if %errorlevel% == 4 call about
if %errorlevel% == 5 start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc"
if %errorlevel% == 6 start "" "https://sourceforge.net/projects/advanced-youtube-client-ayc"
if %errorlevel% == 7 start "" "https://t.me/ayc_news"
goto moreMenu

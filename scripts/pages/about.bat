:about
call tui windowSize %small_width% 31
color %theme_colors%
title You're a curious one..
cls
call tui bannerSmall
echo.
echo   Advanced Youtube Client - AYC Script
echo.
echo   Author           : Adithya S Sekhar
echo.
echo   First Release    : v1.0 (13/Aug/2016)
echo.
echo   Current Release  : v%major_ver%.%minor_ver% (%ver_date%)
echo.
echo   Made in Kerala.
echo.
echo   Released under the MIT License.
echo.
call tui borderSmall
echo.
echo  (0) - Go Back
echo.
echo  (1) - Visit on GitHub
echo.
echo  (2) - Visit on Sourceforge
echo.
echo  (3) - Follow on Telegram
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Select Option (0-3): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc"
if %errorlevel% == 3 start "" "https://sourceforge.net/projects/advanced-youtube-client-ayc"
if %errorlevel% == 4 start "" "https://t.me/ayc_news"

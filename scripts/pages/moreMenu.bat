:moreMenu
call tui windowSize %small_width% 17
color %theme_colors%
title More Options
cls
call tui bannerSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Batch Mode             - QuickKey: b
echo.
echo  (2) - Settings               - QuickKey: s
echo.
echo  (3) - About                  - QuickKey: a
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Select Option (0-3): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 start AYClient.bat "b"
if %errorlevel% == 3 call settingsMenu
if %errorlevel% == 4 call about
goto moreMenu

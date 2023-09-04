:about
call tui windowSize %small_width% 21
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
call tui borderSmallHalf
echo.
echo   Press Enter to go back.
pause>NUL
goto :EOF

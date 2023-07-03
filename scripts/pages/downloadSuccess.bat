:downloadSuccess
mode %window_small%
color 2F
title Download Finished
cls
call tui bannerSmall
echo.
echo  Download Finished.
echo  URL: %url%
echo.
echo  The files are saved in:
echo  %loc%
echo.
echo  Press enter to close this window.
pause>NUL
goto :EOF

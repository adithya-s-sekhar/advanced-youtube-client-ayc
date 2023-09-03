:downloadSuccess
mode %window_small%
color 2F
title Download Finished
cls
call tui bannerSmall
echo.
echo  Download Finished.
echo.
if %error_mode% == batch (
    echo  Job: %job_name%%
) else (
    echo  URL: %url%
)
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  The files are saved in:
echo  %loc%
echo.
call tui borderSmallHalf
echo.
echo  Press enter to close this window.
pause>NUL
goto :EOF

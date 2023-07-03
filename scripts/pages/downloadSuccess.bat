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
echo  The files are saved in:
echo  %loc%
echo.
echo  Press enter to close this window.
pause>NUL
goto :EOF

:downloadError
call tui windowSize %small_width% 34
color 4F
title Download Failed!
cls
call tui bannerSmall
echo.
echo  Download Failed!!!! :-(
echo.
if %error_mode% == batch (
    echo  Job: %job_name%
) else (
    echo  URL: %url%
)
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  Possible problems and solutions:
echo.
if %error_format% == av1 echo  - If you chose AV1, not all websites support it yet.
if %cookie_loaded% == 1 echo  - Your cookies may have expired or are invalid.
echo  - yt-dlp might be out of date. Update it by entering 
echo    u into the url field.
echo  - If you have an unreliable network, increase retry
echo    attempts in Settings.
echo  - You could be running into a path length limit.
echo    Always keep AYC near your root directory like C:\ayc.
echo    Or keep the temporary folder in root like D:\tmp in 
echo    settings.
if %error_mode% == batch (
    echo  - You may have entered an invalid job name.
    echo  - One of your links might be failing, rest might have
    echo    downloaded successfully.
) else (
    echo  - You may have entered an invalid/private link. These
    echo    aren't supported yet.
)
echo.
echo   If all else fails, report the failing URLs on the 
echo   Sourceforge or GitHub page. 
echo.
call tui borderSmallHalf
echo.
echo  Press enter to close this window.
pause>NUL
goto :EOF

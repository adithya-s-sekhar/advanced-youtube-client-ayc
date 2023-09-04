:downloadError
if %cookie_loaded% == 1 (
    call tui windowSize %small_width% 30
) else (
    call tui windowSize %small_width% 28
)
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
echo  - yt-dlp might be out of date. Update it by going 
echo    into Settings, Update yt-dlp.
echo  - If you have an unreliable network, increase retry
echo    attempts in Settings.
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

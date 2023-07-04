:downloadError
mode %window_small%
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
echo  Possible problems and solutions:
echo.
if %error_format% == av1 echo  - If you chose AV1, not all videos are supported by
if %error_format% == av1 echo   youtube yet.
echo  - yt-dlp might be out of date. Update it by going 
echo  into Settings, Update yt-dlp.
echo  - If you have an unreliable network, enable rechecks
echo   in Settings.
if %error_mode% == batch (
    echo  - You may have entered an invalid job name.
    echo  - One of your links might be failing, rest might have
    echo  downloaded successfully.
) else (
    echo  - You may have entered an invalid/private link. These
    echo   aren't supported yet.
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

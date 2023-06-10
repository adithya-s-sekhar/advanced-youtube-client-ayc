:update
mode %window_small%
color 07
title Update yt-dlp
cls
call gui bannerSmall
echo.
echo  Checking for updates..
%youtube_dl% -U
%youtube_dl% --version>"%aycdata%\youtube_dl_version.txt"
set /p youtube_dl_version=<"%aycdata%\youtube_dl_version.txt"
set youtube_dl_version=%youtube_dl_version:"=%
echo.
echo  Press Enter to go back.
pause>NUL
goto :EOF

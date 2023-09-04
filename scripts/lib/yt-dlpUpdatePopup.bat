@echo off
call tui windowSize 20 3
echo.
echo  Updating yt-dlp..
yt-dlp -U
exit
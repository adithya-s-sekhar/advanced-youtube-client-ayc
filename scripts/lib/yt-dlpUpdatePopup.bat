@echo off
call tui windowSize 20 3
color 0F
echo.
echo  Updating yt-dlp..
yt-dlp -U>nul
exit
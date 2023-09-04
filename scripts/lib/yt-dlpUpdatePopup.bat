@echo off
call tui windowSize 20 3
color %theme_colors%
echo.
echo  Updating yt-dlp..
yt-dlp -U>nul
exit
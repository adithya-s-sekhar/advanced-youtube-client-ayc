:qualitySelector
title Choose Quality
if %cookie_loaded% == 1 (
    call tui windowSize %small_width% 34
) else (
    call tui windowSize %small_width% 32
)
color %theme_colors%
cls
call tui bannerSmall
echo.
echo  Working on: %job_name%
echo.
echo  Job Type: Twitch only
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  Format: .MP4 (H264 Video/AAC Audio)
echo.
echo  (0) - Go Back
echo.
call tui borderSmall
echo  Choose Maximum Quality
echo.
echo   (1) - 360p 
echo   (2) - 480p   (If not available, returns to 360p) 
echo.
call tui borderSmall
echo.
echo   (3) - 720p   (If not available, returns to 480p) 
echo   (4) - 1080p  (If not available, returns to 720p) 
echo.
call tui borderSmall
echo.
echo   (5) - Show all available formats
echo         Use this if the above doesn't work.
echo.
call tui borderSmallHalf
echo.
choice /c 012345 /n /m "Select Option (0-5): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 set format_chosen=twitch && set conf="-f 360" && set batch_name_end=360p && goto :EOF
if %errorlevel% == 3 set format_chosen=twitch && set conf="-f 480" && set batch_name_end=480p && goto :EOF
if %errorlevel% == 4 set format_chosen=twitch && set conf="-f 720" && set batch_name_end=720p && goto :EOF
if %errorlevel% == 5 set format_chosen=twitch && set conf="-f 1080" && set batch_name_end=1080p && goto :EOF
if %errorlevel% == 6 set format_chosen=twitch && set conf="custom" && goto :EOF

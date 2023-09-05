set twitch_download_status=0
:qualitySelector
title Link Recieved
if %cookie_loaded% == 1 (
    call tui windowSize %small_width% 34
) else (
    call tui windowSize %small_width% 32
)
color %theme_colors%
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
echo  Twitch link detected. [BETA]
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  Format: .MP4 (H264 Video/AAC Audio)
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
choice /c 12345 /n /m "Select Option (1-5): "
if %errorlevel% == 1 set conf="-f 360" && goto download
if %errorlevel% == 2 set conf="-f 480" && goto download
if %errorlevel% == 3 set conf="-f 720" && goto download
if %errorlevel% == 4 set conf="-f 1080" && goto download
if %errorlevel% == 5 goto twitchCustomFormat


:twitchCustomFormat
call tui windowSize %large_width% 500
color %theme_colors%
title Select Format
cls
call tui bannerLarge
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
%youtube_dl% %cookies% -F "%url%" && goto twitchCustomFormatContinue
goto :EOF
:twitchCustomFormatContinue
echo.
call tui borderLargeHalf
echo.
echo Leave blank and press Enter to Go back.
echo.
echo You can also type 'best', 'b', 'worst', 'w'.
echo.
set /p twitch_custom_qual=Choose ID (green color in the list above): 
set twitch_custom_qual=%twitch_custom_qual: =%
if "%twitch_custom_qual%" equ "" goto qualitySelector
if "%twitch_custom_qual%" equ " =" goto qualitySelector
set twitch_custom_qual=%twitch_custom_qual:'=%
set twitch_custom_qual=%twitch_custom_qual:"=%
set conf="-f %twitch_custom_qual%"
goto download


:download
set "try="
set try=1

if %aria2_status% == 1 set aria2=--external-downloader aria2c

:downloadTried
call tui windowSize %small_width% 36
color %theme_colors%
title Downloading: Attempt %try% out of %max_try% (%defined_try% retries)
cls
call tui bannerSmall
echo.
echo  Starting Download: Attempt %try% out of %max_try% (%defined_try% retries)
echo.
call tui borderSmallHalf
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
%youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%" -o "%%(title)s-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_twitch% %cookies% "%url%" && set twitch_download_status=1 && goto :EOF
set /a try=%try%+1
if %try% GTR %max_try% set twitch_download_status=0 && goto :EOF
goto downloadTried

:formatSelector
if %cookie_loaded% == 1 (
    call tui windowSize %small_width% 35
) else (
    call tui windowSize %small_width% 33
)
color %theme_colors%
title Link Recieved
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
echo  YouTube link detected.
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  Choose format
call tui borderSmall
echo  Video + Audio
echo.
echo   (1) - MP4 Video/AAC Audio (Upto 1080p) (Recommended)
echo.
echo   (2) - VP9 Video/OPUS Audio (Upto 4K)
echo.
echo   (3) - AV1 Video/OPUS Audio (Upto 8K)
echo.
call tui borderSmall
echo  Audio Only
echo.
echo   (4) - M4A  - AAC Audio  - 128kbps
echo.
echo   (5) - MP3  - MP3 Audio  - 128kbps
echo.
echo   (6) - WEBM - OPUS Audio - 160kbps
echo.
call tui borderSmallHalf
echo.
choice /c 123456 /n /m "Select Option (1-6): "
if %errorlevel% == 1 set format_chosen=h264
if %errorlevel% == 2 set format_chosen=vp9
if %errorlevel% == 3 set format_chosen=av1
if %errorlevel% == 4 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a] && goto download
if %errorlevel% == 5 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k && goto download
if %errorlevel% == 6 set format_chosen=aud && set conf=--add-metadata -f bestaudio[ext=webm] && goto download
goto qualitySelector

:qualitySelector
if %format_chosen% == h264 if %cookie_loaded% == 1 call tui windowSize %small_width% 31
if %format_chosen% == h264 if %cookie_loaded% == 0 call tui windowSize %small_width% 29
if %format_chosen% == vp9 if %cookie_loaded% == 1 call tui windowSize %small_width% 36
if %format_chosen% == vp9 if %cookie_loaded% == 0 call tui windowSize %small_width% 34
if %format_chosen% == av1 if %cookie_loaded% == 1 call tui windowSize %small_width% 37
if %format_chosen% == av1 if %cookie_loaded% == 0 call tui windowSize %small_width% 35
color %theme_colors%
if %format_chosen% == h264 title  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == vp9 title  Format: .MP4 (VP9 Video/OPUS Audio)
if %format_chosen% == av1 title  Format: .MP4 (AV1 Video/OPUS Audio)
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
if %format_chosen% == h264 echo  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == vp9 echo  Format: .MP4 (VP9 Video/OPUS Audio)
if %format_chosen% == av1 echo  Format: .MP4 (AV1 Video/OPUS Audio)
echo.
echo   (0) - Back
echo.
call tui borderSmall
echo  Choose Maximum Quality
echo.
echo   (1) - 144p 
echo   (2) - 240p   (If not available, returns to 144p) 
echo   (3) - 360p   (If not available, returns to 240p) 
echo.
call tui borderSmall
echo.
echo   (4) - 480p   (If not available, returns to 360p) 
echo   (5) - 720p   (If not available, returns to 480p) 
echo   (6) - 1080p  (If not available, returns to 720p) 
echo.
if NOT %format_chosen% == h264 call tui borderSmall
if NOT %format_chosen% == h264 echo.
if NOT %format_chosen% == h264 echo   (7) - 1440p  (If not available, returns to 1080p)
if NOT %format_chosen% == h264 echo   (8) - 4K     (If not available, returns to 1440p)
if %format_chosen% == av1 echo   (9) - 8K     (If not available, returns to 4K)
if not %format_chosen% == h264 echo.
call tui borderSmallHalf
if %format_chosen% == vp9  goto choiceVp9
if %format_chosen% == av1  goto choiceAv1
echo.
choice /c 0123456 /n /m "Select Option (0-6): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=144]+worstaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=240]+worstaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=360]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=480]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]"
goto download

:choiceVp9
echo.
choice /c 012345678 /n /m "Select Option (0-8): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=vp09][height<=144]+worstaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=vp09][height<=240]+worstaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=vp09][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=vp09][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=vp09][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=vp09][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec^=vp09][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec^=vp09][height<=2160]+bestaudio[ext=webm]"
goto download

:choiceAv1
set error_format=av1
echo.
choice /c 0123456789 /n /m "Select Option (0-9): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=144]+worstaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=240]+worstaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec^=av01][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec^=av01][height<=2160]+bestaudio[ext=webm]"
if %errorlevel% == 10 set conf="-f bestvideo[vcodec^=av01][height<=4320]+bestaudio[ext=webm]"
goto download


:download
set "try="
set try=1

if %aria2_status% == 1 set aria2=--concurrent-fragments 8

:downloadTried
call tui windowSize %small_width% 36
color 0B
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
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%" -o "%%(title)s-MP4-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_youtube% %cookies% "%url%" && set regular_download_status=1 && goto :EOF
if %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% --merge-output-format mp4 %subs% %thumbs% -P home:"%loc%" -o "%%(title)s-VP9-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_youtube% %cookies% "%url%" && set regular_download_status=1 && goto :EOF
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -P home:"%loc%" -o "%%(title)s-AV1-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_youtube% %cookies% "%url%" && set regular_download_status=1 && goto :EOF
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% -P home:"%loc%" -o "%%(title)s-%%(id)s.%%(ext)s" %custom_config_youtube% %cookies% "%url%" && set regular_download_status=1 && goto :EOF
set /a try=%try%+1
if %try% GTR %max_try% set regular_download_status=0 && goto :EOF
goto downloadTried

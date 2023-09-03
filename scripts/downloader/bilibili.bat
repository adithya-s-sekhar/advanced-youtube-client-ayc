:formatSelector
set bilibili_download_status=0
call tui windowSize 60 36
color 07
title Link Recieved
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
echo  Bilibili link detected. [BETA]
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
) else (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
echo  Choose format
call tui borderSmall
echo  Video + Audio
echo.
echo   (1) - H264 Video/AAC Audio (Upto 1080p)
echo.
echo   (2) - HEVC Video/AAC Audio (Upto 1080p)
echo.
echo   (3) - AV1 Video/AAC Audio  (Upto 1080p)
echo.
call tui borderSmall
echo  Audio Only
echo.
echo   (4) - M4A - AAC Audio - 3 Qualities
echo.
call tui borderSmall
echo.
echo   (5) - Pick a Custom Format
echo.
call tui borderSmallHalf
echo.
choice /c 12345 /n /m "Enter Choice (1-5): "
if %errorlevel% == 1 set format_chosen=h264
if %errorlevel% == 2 set format_chosen=hevc
if %errorlevel% == 3 set format_chosen=av1
if %errorlevel% == 4 set format_chosen=aud && goto bilibiliM4a
if %errorlevel% == 5 set format_chosen=custom && goto bilibiliCustomFormat
goto qualitySelector

:qualitySelector
call tui windowSize 60 36
color 07
if %format_chosen% == h264 title  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == hevc title  Format: .MP4 (HEVC Video/AAC Audio)
if %format_chosen% == av1 title  Format: .MP4 (AV1 Video/AAC Audio)
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
) else (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
if %format_chosen% == h264 echo  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == hevc echo  Format: .MP4 (HEVC Video/AAC Audio)
if %format_chosen% == av1 echo  Format: .MP4 (AV1 Video/AAC Audio)
echo.
echo   (0) - Back
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
call tui borderSmallHalf
if %format_chosen% == hevc  goto choiceHevc
if %format_chosen% == av1  goto choiceAv1
echo.
choice /c 01234 /n /m "Enter Choice (0-4): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=360]+0/bestvideo[vcodec^=avc1][height<=360]+worstaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=480]+1/bestvideo[vcodec^=avc1][height<=480]+worstaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=720]+1/bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+2/bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]"
goto download

:choiceHevc
echo.
choice /c 01234 /n /m "Enter Choice (0-4): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=hev1][height<=360]+0/bestvideo[vcodec^=hev1][height<=360]+worstaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=hev1][height<=480]+1/bestvideo[vcodec^=hev1][height<=480]+worstaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=hev1][height<=720]+1/bestvideo[vcodec^=hev1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=hev1][height<=1080]+2/bestvideo[vcodec^=hev1][height<=1080]+bestaudio[ext=m4a]"
goto download

:choiceAv1
set error_format=av1
echo.
choice /c 01234 /n /m "Enter Choice (0-4): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=360]+0/bestvideo[vcodec^=av01][height<=360]+worstaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=480]+1/bestvideo[vcodec^=av01][height<=480]+worstaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=720]+1/bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=1080]+2/bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=m4a]"
goto download


:bilibiliM4a
call tui windowSize 60 36
color 07
title Select Quality
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo   (0) - Go Back
echo.
call tui borderSmall
echo.
echo   (1) - M4A - AAC - Lowest Quality
echo.
echo   (2) - M4A - AAC - Medium Quality
echo.
echo   (3) - M4A - AAC - Highest Quality
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Enter Choice (0-3): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set aud_end=lq && set conf=--add-metadata --embed-thumbnail -f worstaudio[ext=m4a]
if %errorlevel% == 3 set aud_end=mq && set conf=--add-metadata --embed-thumbnail -f 1/bestaudio[ext=m4a]
if %errorlevel% == 4 set aud_end=hq && set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a]
goto download


:bilibiliCustomFormat
call tui windowSize 180 500
set "bilibili_qual="
color 07
title Select Format
cls
call tui bannerLarge
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
) else (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
%youtube_dl% %cookies% -F "%url%" && goto bilibiliCustomFormatContinue
goto :EOF
:bilibiliCustomFormatContinue
echo.
call tui borderLargeHalf
echo.
echo Leave blank and press Enter to Go back.
echo.
echo Merge two formats using + symbol.
echo.
echo You can also type 'best', 'b', 'worst', 'w'.
echo.
set /p bilibili_qual=Choose ID (green color in the list above): 
set bilibili_qual=%bilibili_qual: =%
if "%bilibili_qual%" equ "" goto formatSelector
if "%bilibili_qual%" equ " =" goto formatSelector
goto download


:download
set "try="
set try=1

if %aria2_status% == 1 set aria2=--external-downloader aria2c

:downloadTried
call tui windowSize 60 36
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
if %cookie_loaded% == 0 if not %format_chosen% == aud (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%" -o "%%(title)s-H264-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 && goto :EOF
if %format_chosen% == hevc %youtube_dl% %default_config% %conf% %aria2% --merge-output-format mp4 %subs% %thumbs% -P home:"%loc%" -o "%%(title)s-HEVC-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 && goto :EOF
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% --merge-output-format mp4 %subs% %thumbs% -P home:"%loc%" -o "%%(title)s-AV1-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 && goto :EOF
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% -P home:"%loc%" -o "%%(title)s-%aud_end%-%%(id)s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 && goto :EOF
if %format_chosen% == custom %youtube_dl% %default_config% %conf% %aria2% -P home:"%loc%" -o "%%(title)s-%bilibili_qual%-%%(id)s.%%(ext)s" %custom_config_bilibili% %cookies% "%url%" && set bilibili_download_status=1 && goto :EOF
set /a try=%try%+1
if %try% GTR %max_try% set bilibili_download_status=0 && goto :EOF
goto downloadTried

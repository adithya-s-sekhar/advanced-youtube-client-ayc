:batchHome
call tui windowSize %small_width% 36
set batch_exists_true=0
set batch_link_counter=0
color 07
title Batch Mode
set "job_name="
cls
call tui bannerSmall
echo.
if %batch_deleted_job% == 1 (
    echo  Deleted job: %batch_deleted_job_name%
    echo.
    set batch_deleted_job=0
)
if %cookie_loaded% == 1 (
    echo  Using cookies.txt
    echo.
)
echo  Batch Mode allows you to create jobs, add videos to that 
echo  job and download it.
echo.
echo  Job URLs are saved and can be resumed by re-entering the 
echo  same job.
echo.
call tui borderSmallHalf
echo.
if %job_name_invalid% == 1 (
    echo Invalid job name.
    echo.
)
set /p job_name=Enter a job name: 
if "%job_name%" equ "" goto batchHome
set job_name=%job_name:"=%
if not exist "%loc%\%job_name%\" md "%loc%\%job_name%">NUL
if not exist "%loc%\%job_name%\" set job_name_invalid=1 && goto batchHome
if exist "%loc%\%job_name%\%job_name%.txt" set batch_exists_true=1 && goto batchJobTypeCheck
echo.>"%loc%\%job_name%\%job_name%.txt"

:batchJobTypeConfirm
echo.
echo Available download modes:
echo.
echo  (0) - Go back
echo.
echo  (1) - Regular (Supports all links)
echo.
echo  (2) - Youtube only (Enables youtube quality selector)
echo.
echo  (3) - Bilibili only (Enables bilibili quality selector)
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Select download mode (0-3): "
if %errorlevel% == 1 rd /s /q "%loc%\%job_name%\" && goto batchHome
if %errorlevel% == 2 set job_type=0 && echo "0">"%loc%\%job_name%\job_type.txt"
if %errorlevel% == 3 set job_type=1 && echo "1">"%loc%\%job_name%\job_type.txt"
if %errorlevel% == 4 set job_type=2 && echo "2">"%loc%\%job_name%\job_type.txt"
goto batchManage

:batchJobTypeCheck
if not exist "%loc%\%job_name%\job_type.txt" goto batchJobTypeConfirm
set /p job_type=<"%loc%\%job_name%\job_type.txt"
set job_type=%job_type:"=%


:batchManage
call tui windowSize %small_width% 36
color 07
title Now working on %job_name%
cls
call tui bannerSmall
echo.
if %batch_exists_true% == 1 echo  Resuming Job: %job_name%
if %batch_exists_true% == 0 echo  New Job: %job_name%
echo.
if %job_type% == 0 echo  Job type: Regular
if %job_type% == 1 echo  Job type: Youtube only
if %job_type% == 2 echo  Job type: Bilibili only [BETA]
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
call tui borderSmall
echo.
echo  (0) - Back
echo.
if %batch_link_counter% GTR 1 (
    set batch_link_counter_text=links
) else (
    set batch_link_counter_text=link
)
if %batch_link_counter% GTR 0 echo  (1) - Add video links (%batch_link_counter% %batch_link_counter_text% added now)
if %batch_link_counter% == 0 echo  (1) - Add video links
echo.
echo  (2) - Open job file (Delete, View, Add links through 
echo        Notepad)
echo.
echo  (3) - Change job type
if %job_type% == 0 echo        Currently: Regular
if %job_type% == 1 echo        Currently: Youtube only
if %job_type% == 2 echo        Currently: Bilibili only [BETA]
echo.
if %batch_exists_true% == 1 echo  (4) - Resume job
if %batch_exists_true% == 0 echo  (4) - Start job
echo.
echo  (5) - Delete job
echo.
call tui borderSmallHalf
echo.
choice /c 012345 /n /m "Enter Choice (0-5): "
if %errorlevel% == 1 goto batchHome
if %errorlevel% == 2 goto batchAddLinks
if %errorlevel% == 3 goto batchOpenJobFile
if %errorlevel% == 4 goto batchChangeType
if %errorlevel% == 5 goto batchQuickQualitySelector
if %errorlevel% == 6 goto batchDeleteConfirm
goto batchManage


:batchAddLinks
call tui windowSize %small_width% 36
color 07
title Leave blank and Enter to go back.
cls
call tui bannerSmall
echo.
echo  Paste each url and press enter, the links will be added to 
echo  your list.
echo.
echo  Leave blank and Enter to go back.
echo.
call tui borderSmallHalf
echo.

:batchAddLinksLoop
set "batch_link_tmp="
set /p batch_link_tmp=Paste Link: 
if "%batch_link_tmp%" equ "" goto batchManage
echo.
for /f "tokens=1 delims=&" %%a in ("%batch_link_tmp%") do (
  set batch_link_tmp=%%a
)

call linkValidator "%batch_link_tmp%"
if %link_validator% == 1 (
    goto batchAddLinksLoop2
) else (
    echo %url_validation_msg%
    echo.
    goto batchAddLinksLoop
)

:batchAddLinksLoop2
if %job_type% == 1 if not %youtube_link% == 1 (
    echo ERROR: Invalid link. This is a Youtube only Job.
    echo.
    echo Change job type to Regular to add non-youtube links.
    echo.
    goto batchAddLinksLoop
)
if %job_type% == 2 if not %bilibili_link% == 1 (
    echo ERROR: Invalid link. This is a Bilibili only Job.
    echo.
    echo Change job type to Regular to add non-bilibili links.
    echo.
    goto batchAddLinksLoop
)
echo %batch_link_tmp%>>"%loc%\%job_name%\%job_name%.txt"
set /a batch_link_counter=%batch_link_counter%+1
echo Link Saved.
echo.
goto batchAddLinksLoop


:batchOpenJobFile
call tui windowSize %small_width% 36
title Edit Job File
color 07
cls
call tui bannerSmall
echo.
if %batch_exists_true% == 1 echo  Resuming Job: %job_name%
if %batch_exists_true% == 0 echo  New Job: %job_name%
echo.
if %job_type% == 0 echo  Job type: Regular
if %job_type% == 1 echo  Job type: Youtube only
if %job_type% == 2 echo  Job type: Bilibili only [BETA]
call tui borderSmallHalf
echo.
echo  Job File is opened in Notepad. Follow instructions.
echo.
echo  1) Add links one by one on each line.
echo.
echo  2) Delete links you don't want.
echo.
echo  3) Empty lines will be skipped.
echo.
echo  4) After Adding links, close Notepad and click Save.
notepad.exe "%loc%\%job_name%\%job_name%.txt"
goto batchManage


:batchChangeType
if %job_type% == 0 (
    set job_type=1
    echo "1">"%loc%\%job_name%\job_type.txt"
    goto batchManage
)
if %job_type% == 1 (
    set job_type=2
    echo "2">"%loc%\%job_name%\job_type.txt"
    goto batchManage
)
if %job_type% == 2 (
    set job_type=0
    echo "0">"%loc%\%job_name%\job_type.txt"
    goto batchManage
)


:batchQuickQualitySelector
if %job_type% == 1 goto batchFormatSelector
if %job_type% == 2 goto batchBFormatSelector
call tui windowSize %small_width% 36
color 07
title Select Quality
set "batch_link_tmp="
cls
call tui bannerSmall
echo.
echo  Select Quality
echo.
call tui borderSmallHalf
echo.
echo  (0) - Back
echo.
echo  (1) - Highest Quality
echo.
echo  (2) - Lowest Quality
echo.
echo  (3) - Pick a custom format code
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Choose Quality (0-3): "
if %errorlevel% == 1 goto batchManage
if %errorlevel% == 2 set conf=-f "bv*+ba/b" & set batch_name_end=high
if %errorlevel% == 3 set conf=-f "wv*+wa/w" & set batch_name_end=low
if %errorlevel% == 4 goto batchCustomFormat
set format_chosen=batch
goto batchDownload


:batchFormatSelector
call tui windowSize %small_width% 36
color 07
title Choose format
cls
call tui bannerSmall
echo.
echo  Working on: %job_name%
echo.
echo  Job Type: Youtube
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo   (0) - Back
echo.
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
choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 goto batchManage
if %errorlevel% == 2 set format_chosen=h264
if %errorlevel% == 3 set format_chosen=vp9
if %errorlevel% == 4 set format_chosen=av1
if %errorlevel% == 5 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a] && goto batchDownload
if %errorlevel% == 6 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k && goto batchDownload
if %errorlevel% == 7 set format_chosen=aud && set conf=--add-metadata -f bestaudio[ext=webm] && goto batchDownload
goto batchQualitySelector

:batchQualitySelector
call tui windowSize %small_width% 36
color 07
if %format_chosen% == h264 title  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == vp9 title  Format: .MP4 (VP9 Video/OPUS Audio)
if %format_chosen% == av1 title  Format: .MP4 (AV1 Video/OPUS Audio)
cls
call tui bannerSmall
echo.
echo  Working on: %job_name%
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
if %format_chosen% == vp9  goto batchChoiceVp9
if %format_chosen% == av1  goto batchChoiceAv1
echo.
choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 goto batchFormatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=144]+worstaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=240]+worstaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=360]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=480]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]"
goto batchDownload

:batchChoiceVp9
echo.
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto batchFormatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=vp09][height<=144]+worstaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=vp09][height<=240]+worstaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=vp09][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=vp09][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=vp09][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=vp09][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec^=vp09][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec^=vp09][height<=2160]+bestaudio[ext=webm]"
goto batchDownload

:batchChoiceAv1
set error_format=av1
echo.
choice /c 0123456789 /n /m "Enter Choice (0-9): "
if %errorlevel% == 1 goto batchFormatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=144]+worstaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=240]+worstaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec^=av01][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec^=av01][height<=2160]+bestaudio[ext=webm]"
if %errorlevel% == 10 set conf="-f bestvideo[vcodec^=av01][height<=4320]+bestaudio[ext=webm]"
goto batchDownload


:batchBFormatSelector
call tui windowSize %small_width% 36
color 07
title Choose Format
cls
call tui bannerSmall
echo.
echo  Working on: %job_name%
echo.
echo  Job Type: Bilibili only [BETA]
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
) else (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
echo   (0) - Back
echo.
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
choice /c 012345 /n /m "Enter Choice (1-5): "
if %errorlevel% == 1 goto batchManage
if %errorlevel% == 2 set format_chosen=b_h264
if %errorlevel% == 3 set format_chosen=b_hevc
if %errorlevel% == 4 set format_chosen=b_av1
if %errorlevel% == 5 set format_chosen=b_aud && goto batchBilibiliM4a
if %errorlevel% == 6 set format_chosen=batch && goto batchCustomFormat
goto batchBQualitySelector

:batchBqualitySelector
call tui windowSize %small_width% 36
color 07
if %format_chosen% == b_h264 title  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == b_hevc title  Format: .MP4 (HEVC Video/AAC Audio)
if %format_chosen% == b_av1 title  Format: .MP4 (AV1 Video/AAC Audio)
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
if %format_chosen% == b_h264 echo  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == b_hevc echo  Format: .MP4 (HEVC Video/AAC Audio)
if %format_chosen% == b_av1 echo  Format: .MP4 (AV1 Video/AAC Audio)
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
if %format_chosen% == b_hevc  goto b_choiceHevc
if %format_chosen% == b_av1  goto b_choiceAv1
echo.
choice /c 01234 /n /m "Enter Choice (0-4): "
if %errorlevel% == 1 goto batchBFormatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=360]+0/bestvideo[vcodec^=avc1][height<=360]+worstaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=480]+1/bestvideo[vcodec^=avc1][height<=480]+worstaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=720]+1/bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+2/bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]"
goto batchDownload

:b_choiceHevc
echo.
choice /c 01234 /n /m "Enter Choice (0-4): "
if %errorlevel% == 1 goto batchBFormatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=hev1][height<=360]+0/bestvideo[vcodec^=hev1][height<=360]+worstaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=hev1][height<=480]+1/bestvideo[vcodec^=hev1][height<=480]+worstaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=hev1][height<=720]+1/bestvideo[vcodec^=hev1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=hev1][height<=1080]+2/bestvideo[vcodec^=hev1][height<=1080]+bestaudio[ext=m4a]"
goto batchDownload

:b_choiceAv1
set error_format=av1
echo.
choice /c 01234 /n /m "Enter Choice (0-4): "
if %errorlevel% == 1 goto batchBFormatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=360]+0/bestvideo[vcodec^=av01][height<=360]+worstaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=480]+1/bestvideo[vcodec^=av01][height<=480]+worstaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=720]+1/bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=1080]+2/bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=m4a]"
goto batchDownload


:batchBilibiliM4a
call tui windowSize %small_width% 36
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
if %errorlevel% == 1 goto batchBFormatSelector
if %errorlevel% == 2 set aud_end=lq && set conf=--add-metadata --embed-thumbnail -f worstaudio[ext=m4a]
if %errorlevel% == 3 set aud_end=mq && set conf=--add-metadata --embed-thumbnail -f 1/bestaudio[ext=m4a]
if %errorlevel% == 4 set aud_end=hq && set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a]
goto batchDownload


:batchCustomFormat
call tui windowSize %medium_width% 26
set "batch_custom_format_url="
color 07
title Pick custom format code
cls
call tui bannerMedium
echo.
echo  Working on: %job_name%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  Leave blank and press Enter to Go back.
echo.
echo  Paste a sample URL from your batch job to retrieve all available qualities.
echo.
call tui borderSmallHalf
echo.
if %url_invalid% == 1 (
    echo %url_validation_msg%
    echo.
)
set /p batch_custom_format_url=Sample URL: 
set batch_custom_format_url=%batch_custom_format_url: =%
if "%batch_custom_format_url%" equ "" if %job_type% == 0 goto batchQuickQualitySelector
if "%batch_custom_format_url%" equ " =" if %job_type% == 0 goto batchQuickQualitySelector
if "%batch_custom_format_url%" equ "" if %job_type% == 2 goto batchBFormatSelector
if "%batch_custom_format_url%" equ " =" if %job_type% == 2 goto batchBFormatSelector

call linkValidator "%batch_custom_format_url%"
if %link_validator% == 1 (
    set url_invalid=0
    goto batchCustomFormatSelector
) else (
    set url_invalid=1
    goto batchCustomFormat
)

:batchCustomFormatSelector
call tui windowSize %large_width% 500
set "batch_custom_qual="
title Retrieving all available qualities
color 07
cls
call tui bannerLarge
echo.
echo  Working on: %job_name%
echo.
echo  Sample URL: %batch_custom_format_url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
%youtube_dl% %cookies% -F "%batch_custom_format_url%" && goto batchCustomFormatSelectorContinue
set error_mode=batch
goto error
:batchCustomFormatSelectorContinue
echo.
call tui borderLargeHalf
echo.
echo Leave blank and press Enter to Go back.
echo.
echo Merge two formats using + symbol.
echo.
echo You can also type 'best', 'b', 'worst', 'w'.
echo.
set /p batch_custom_qual=Choose ID (green color in the list above): 
set batch_custom_qual=%batch_custom_qual: =%
if "%batch_custom_qual%" equ "" goto batchCustomFormat
if "%batch_custom_qual%" equ " =" goto batchCustomFormat
set conf=-f %batch_custom_qual%
set batch_name_end=%batch_custom_qual%
set format_chosen=batch
goto batchDownload


:batchDeleteConfirm
echo.
choice /c yn /n /m "Delete job %job_name%? (y/n)"
if %errorlevel% == 1 goto batchDeleteConfirmAgain
if %errorlevel% == 2 goto batchManage

:batchDeleteConfirmAgain
echo.
choice /c yn /n /m "Are you sure? (y/n)"
if %errorlevel% == 1 goto batchDoDelete
if %errorlevel% == 2 goto batchManage

:batchDoDelete
rd /s /q "%loc%\%job_name%"
set batch_deleted_job=1
set batch_deleted_job_name=%job_name%
goto batchHome


:batchDownload
set "try="
set try=1

if %aria2_status% == 1 if not %job_type% == 1 set aria2=--external-downloader aria2c
if %aria2_status% == 1 if %job_type% == 1 set aria2=--concurrent-fragments 8

:batchDownloadTried
set error_mode=batch
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
echo  Job: %job_name%
echo.
if %job_type% == 0 echo  Job type: Regular
if %job_type% == 1 echo  Job type: Youtube only
if %job_type% == 2 echo  Job type: Bilibili only [BETA]
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
if %cookie_loaded% == 0 if %job_type% == 2 (
    echo  cookies.txt needed for 720p and above. Read FAQ on GitHub.
    echo.
)
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title)s-MP4-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title)s-VP9-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title)s-AV1-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% -P home:"%loc%\%job_name%" -o "%%(title)s-%%(id)s.%%(ext)s" %custom_config_batch_yt% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF

if %format_chosen% == b_h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title)s-MP4-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == b_hevc %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title)s-HEVC-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == b_av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" --merge-output-format mp4 -o "%%(title)s-AV1-%%(height)sp-%%(id)s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == b_aud %youtube_dl% %default_config% %conf% %aria2% -P home:"%loc%\%job_name%" -o "%%(title)s-%aud_end%-%%(id)s.%%(ext)s" %custom_config_batch_bilibili% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF

if %format_chosen% == batch %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%\%job_name%" -o "%%(title)s-%batch_name_end%-%%(id)s.%%(ext)s" %custom_config_batch_all% %cookies% -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
set /a try=%try%+1
if %try% GTR %max_try% set batch_download_status=0 && goto :EOF
goto batchDownloadTried

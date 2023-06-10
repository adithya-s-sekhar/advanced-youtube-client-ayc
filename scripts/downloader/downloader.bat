set downloader.arg1=%~1

if %downloader.arg1% == regular call :formatSelector
if %downloader.arg1% == batch call :batchHome

goto :EOF

:formatSelector
mode %window_small%
color 07
if %is_batch% == 0 title Link Recieved
if %is_batch% == 1 title Choose format
cls
call tui bannerSmall
echo.
if %is_batch% == 0 echo  URL: %url%
if %is_batch% == 1 echo  Working on: %job_name%
if %pass_to_uni% == 0 (
    echo.
    echo  YouTube link detected.
)
echo.
if %is_batch% == 1 echo   (0) - Back
if %is_batch% == 1 echo.
echo  Choose format
call tui borderSmall
echo  Video + Audio
echo.
echo   (1) - MP4 Video/AAC Audio (Upto 1080p)
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
call tui borderSmall
echo.
if %is_batch% == 0 choice /c 123456 /n /m "Enter Choice (1-6): "
if %is_batch% == 1 choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 if %is_batch% == 0 set format_chosen=h264
if %errorlevel% == 2 if %is_batch% == 0 set format_chosen=vp9
if %errorlevel% == 3 if %is_batch% == 0 set format_chosen=av1
if %errorlevel% == 4 if %is_batch% == 0 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a] && goto download
if %errorlevel% == 5 if %is_batch% == 0 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k && goto download
if %errorlevel% == 6 if %is_batch% == 0 set format_chosen=aud && set conf=--add-metadata -f bestaudio[ext=webm] && goto download
if %errorlevel% == 1 if %is_batch% == 1 goto batchManage
if %errorlevel% == 2 if %is_batch% == 1 set format_chosen=h264
if %errorlevel% == 3 if %is_batch% == 1 set format_chosen=vp9
if %errorlevel% == 4 if %is_batch% == 1 set format_chosen=av1
if %errorlevel% == 5 if %is_batch% == 1 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a] && goto batchDownload
if %errorlevel% == 6 if %is_batch% == 1 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k && goto batchDownload
if %errorlevel% == 7 if %is_batch% == 1 set format_chosen=aud && set conf=--add-metadata -f bestaudio[ext=webm] && goto batchDownload
goto qualitySelector


:qualitySelector
mode %window_small%
color 07
if %format_chosen% == h264 title  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == vp9 title  Format: .MP4 (VP9 Video/OPUS Audio)
if %format_chosen% == av1 title  Format: .MP4 (AV1 Video/OPUS Audio)
cls
call tui bannerSmall
echo.
if %is_batch% == 0 echo  URL: %url%
if %is_batch% == 1 echo  Working on: %job_name%
echo.
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
call tui borderSmall
if %format_chosen% == vp9  goto choiceVp9
if %format_chosen% == av1  goto choiceAv1
echo.
choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=144]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=360]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=480]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]"
if %is_batch% == 0 goto download
if %is_batch% == 1 goto batchDownload

:choiceVp9
echo.
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec=vp9][height<=144]+bestaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec=vp9][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec=vp9][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec=vp9][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec=vp9][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec=vp9][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec=vp9][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec=vp9][height<=2160]+bestaudio[ext=webm]"
if %is_batch% == 0 goto download
if %is_batch% == 1 goto batchDownload

:choiceAv1
set error_format=av1
echo.
choice /c 0123456789 /n /m "Enter Choice (0-9): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=144]+bestaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec^=av01][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec^=av01][height<=2160]+bestaudio[ext=webm]"
if %errorlevel% == 10 set conf="-f bestvideo[vcodec^=av01][height<=4320]+bestaudio[ext=webm]"
if %is_batch% == 0 goto download
if %is_batch% == 1 goto batchDownload


:download
set "try="
set try=%try_count%

if %aria2_status% == 0 set aria2=--concurrent-fragments 8
if %aria2_status% == 1 set aria2=--external-downloader aria2c

if %thumbs_status% == 0 set "thumbs="
if %thumbs_status% == 1 set thumbs=--embed-thumbnail

if %subs_status% == 0 set "subs="
if %subs_status% == 1 set subs=--write-auto-sub --embed-subs

:downloadTried
set error_mode=regular
mode %window_small%
color 0B
title Downloading
cls
call tui bannerSmall
echo.
echo  Starting Download
echo -------------------
echo.
echo  URL: %url%
echo.
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -o "%loc%\%%(title).107s-MP4-%%(height).5sp-%%(id).10s.%%(ext)s" "%url%" && set regular_download_status=1 && goto :EOF
if %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% --merge-output-format mp4 %subs% %thumbs% -o "%loc%\%%(title).107s-VP9-%%(height).5sp-%%(id).10s.%%(ext)s" "%url%" && set regular_download_status=1 && goto :EOF
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -o "%loc%\%%(title).107s-AV1-%%(height).5sp-%%(id).10s.%%(ext)s" "%url%" && set regular_download_status=1 && goto :EOF
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% -o "%loc%\%%(title).117s-%%(id).10s.%%(ext)s" "%url%" && set regular_download_status=1 && goto :EOF
set /a try=%try%+1
if %try% GTR %defined_try% set regular_download_status=0 && goto :EOF
goto downloadTried


:batchHome
mode %window_medium%
set batch_exists_true=0
color 07
title Batch Mode
set "job_name="
cls
call tui bannerMedium
echo.
if %batch_deleted_job% == 1 (
    echo  Deleted job: %batch_deleted_job_name%
    echo.
    set batch_deleted_job=0
)
echo  Batch Mode allows you to create jobs, add videos to that  job and download it.
echo.
echo  Job URLs are saved and can be resumed by re-entering the same job.
echo.
echo ------------------------------------------
echo.
if %job_name_invalid% == 1 (
    echo Invalid job name.
    echo.
)
set /p job_name=Enter Job Name (eg: Songs): 
if "%job_name%" equ "" set job_name_invalid=1 && goto batchHome
set job_name=%job_name:"=%
md "%loc%\%job_name%">NUL
if not exist "%loc%\%job_name%" set job_name_invalid=1 && goto batchHome
if exist "%loc%\%job_name%\%job_name%.txt" set batch_exists_true=1 && goto batchIsYoutubeCheck
echo.>"%loc%\%job_name%\%job_name%.txt"

:batchIsYoutubeConfirm
echo.
choice /c yn /n /m "Is this a YouTube Download Job? (Yes/No) "
if %errorlevel% == 1 set youtube=1 && echo "1">"%loc%\%job_name%\is_youtube.txt"
if %errorlevel% == 2 set youtube=0 && echo "0">"%loc%\%job_name%\is_youtube.txt"

:batchIsYoutubeCheck
if not exist "%loc%\%job_name%\is_youtube.txt" goto batchIsYoutubeConfirm
set /p youtube=<"%loc%\%job_name%\is_youtube.txt"
set youtube=%youtube:"=%


:batchManage
mode %window_small%
color 07
title Now working on %job_name%
cls
call tui bannerSmall
echo.
if %batch_exists_true% == 1 echo  Resuming Job: %job_name%
if %batch_exists_true% == 0 echo  New Job: %job_name%
echo.
if %youtube% == 1 echo  Youtube Job: Yes
if %youtube% == 0 echo  Youtube Job: No
echo --------------------------
echo.
echo  (0) - Back
echo.
echo  (1) - Add Video Links
echo.
echo  (2) - Open Job File (Delete, View, Add Links through 
echo        Notepad)
echo.
if %youtube% == 1 echo  (3) - Change job to Non-Youtube mode
if %youtube% == 0 echo  (3) - Change job to Youtube mode
echo.
if %batch_exists_true% == 1 echo  (4) - Resume Job
if %batch_exists_true% == 0 echo  (4) - Start Job
echo.
echo  (5) - Delete Job
echo.
echo --------------------------
echo.
choice /c 012345 /n /m "Enter Choice (0-5): "
if %errorlevel% == 1 goto batchHome
if %errorlevel% == 2 goto batchAddLinks
if %errorlevel% == 3 goto batchOpenJobFile
if %errorlevel% == 4 goto batchChangeType
if %errorlevel% == 5 goto batchQuickQualitySelector
if %errorlevel% == 6 goto batchDeleteConfirm
goto batchManage


:batchOpenJobFile
mode %window_small%
title Edit Job File
color 07
cls
call tui bannerSmall
echo.
if %batch_exists_true% == 1 echo  Resuming Job: %job_name%
if %batch_exists_true% == 0 echo  New Job: %job_name%
echo.
if %youtube% == 1 echo  Youtube Job: Yes
if %youtube% == 0 echo  Youtube Job: No
echo --------------------------
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


:batchAddLinks
mode %window_small%
color 07
title Enter 0 to go back after adding links.
cls
call tui bannerSmall
echo.
echo  Paste each url and press enter, the links will be added to 
echo  your list.
echo.
echo  Enter 0 to Go Back after adding links
echo.
echo --------------------------------------------
echo.


:batchAddLinksLoop
set "batch_link_tmp="
set /p batch_link_tmp=Paste Link: 
if "%batch_link_tmp%" equ "" (
    echo URL is blank.
    echo.
    goto batchAddLinksLoop
)
echo.
if "%batch_link_tmp%" equ "0" goto batchManage
for /f "tokens=1 delims=&" %%a in ("%batch_link_tmp%") do (
  set batch_link_tmp=%%a
)

call linkValidator "%batch_link_tmp%"
if %link_validator% == 1 (
    echo %batch_link_tmp%>>"%loc%\%job_name%\%job_name%.txt"
    goto batchAddLinksLoop
) else (
    echo %url_validation_msg%
    echo.
    goto batchAddLinksLoop
)


:batchChangeType
if %youtube% == 0 (
    set youtube=1
    echo "1">"%loc%\%job_name%\is_youtube.txt"
    goto batchManage
)
if %youtube% == 1 (
    set youtube=0
    echo "0">"%loc%\%job_name%\is_youtube.txt"
    goto batchManage
)


:batchQuickQualitySelector
mode %window_small%
color 07
title Select Quality
set "batch_link_tmp="
cls
call tui bannerSmall
if %youtube% == 1 set is_batch=1 && goto formatSelector
if %youtube% == 0 echo.
echo  Select Quality
echo -------------------------
echo.
echo  (0) - Back
echo.
echo  (1) - Highest Quality
echo.
echo  (2) - Lowest Quality
echo.
echo  (3) - Pick a custom format code
echo.
echo -------------------------
choice /c 0123 /n /m "Choose Quality (0-3): "
if %errorlevel% == 1 goto batchManage
if %errorlevel% == 2 set conf=-f "bv*+ba/b" & set batch_name_end=high
if %errorlevel% == 3 set conf=-f "wv*+wa/w" & set batch_name_end=low
if %errorlevel% == 4 goto batchCustomFormat
set format_chosen=batch
goto batchDownload


:batchCustomFormat
mode %window_medium%
set "batch_custom_format_url="
color 07
title Pick custom format code
cls
call tui bannerMedium
echo.
echo  Working on: %job_name%
echo.
echo  Enter 0 to Go Back.
echo.
echo  Paste a sample URL from your batch job to retrieve all available qualities.
echo.
echo -----------
echo.
if %url_invalid% == 1 (
    echo %url_validation_msg%
    echo.
)
set /p batch_custom_format_url=Sample URL: 
set batch_custom_format_url=%batch_custom_format_url: =%
if "%batch_custom_format_url%" equ "" set url_invalid=1 && goto batchCustomFormat
if "%batch_custom_format_url%" equ " =" set url_invalid=1 && goto batchCustomFormat
if "%batch_custom_format_url%" equ "0" set url_invalid=0 && goto batchQuickQualitySelector

call linkValidator "%batch_custom_format_url%"
if %link_validator% == 1 (
    set url_invalid=0
    goto batchCustomFormatSelector
) else (
    set url_invalid=1
    goto batchCustomFormat
)

:batchCustomFormatSelector
mode %window_large%
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
%youtube_dl% -F "%batch_custom_format_url%" && goto batchCustomFormatSelectorContinue
set error_mode=batch
goto error
:batchCustomFormatSelectorContinue
echo.
echo  Enter 0 to Go Back.
echo -------------------------------------------------
echo.
echo You can also type "best" and "worst".
set /p batch_custom_qual=Choose ID (green color in the list above): 
set batch_custom_qual=%batch_custom_qual: =%
if "%batch_custom_qual%" equ "" goto batchCustomFormatSelector
if "%batch_custom_qual%" equ " =" goto batchCustomFormatSelector
if "%batch_custom_qual%" equ "0" goto batchCustomFormat
set conf=-f %batch_custom_qual%
set batch_name_end=%batch_custom_qual%
set format_chosen=batch
goto batchDownload


:batchDeleteConfirm
echo.
choice /c yn /n /m "Delete job \"%job_name%\" ? (Y/N)"
if %errorlevel% == 1 goto batchDeleteConfirmAgain
if %errorlevel% == 2 goto batchManage


:batchDeleteConfirmAgain
echo.
choice /c yn /n /m "Are you sure? (Y/N)"
if %errorlevel% == 1 goto batchDoDelete
if %errorlevel% == 2 goto batchManage


:batchDoDelete
rd /s /q "%loc%\%job_name%"
set batch_deleted_job=1
set batch_deleted_job_name=%job_name%
goto batchHome


:batchDownload
set "try="
set try=%try_count%

if %aria2_status% == 1 set aria2=--external-downloader aria2c
if %youtube% == 0 set aria2=--external-downloader aria2c
if %youtube% == 1 if %aria2_status% == 0 set aria2=--concurrent-fragments 8

if %thumbs_status% == 0 set "thumbs="
if %thumbs_status% == 1 set thumbs=--embed-thumbnail

if %subs_status% == 0 set "subs="
if %subs_status% == 1 set subs=--write-auto-sub --embed-subs

:batchDownloadTried
set error_mode=batch
mode %window_small%
color 0B
title Downloading
cls
call tui bannerSmall
echo.
echo  Starting Download
echo -------------------
echo.
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -o "%loc%\%job_name%\%%(title).107s-MP4-%%(height).5sp-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -o "%loc%\%job_name%\%%(title).107s-VP9-%%(height).5sp-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -o "%loc%\%job_name%\%%(title).107s-AV1-%%(height).5sp-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% -o "%loc%\%job_name%\%%(title).117s-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
if %format_chosen% == batch %youtube_dl% %default_config% %conf% %aria2% -o "%loc%\%job_name%\%%(title).106s-%batch_name_end%-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && set batch_download_status=1 && goto :EOF
set /a try=%try%+1
if %try% GTR %defined_try% set batch_download_status=0 && goto :EOF
goto batchDownloadTried

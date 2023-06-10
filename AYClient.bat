@echo off

set ayc.arg1=%1

:: /----------------------------------------------------------/
:: /----------------------------------------------------------/
:: / Advanced Youtube Client - AYC Script                     /
:: / Author          : Adithya S Sekhar                       /
:: / First Release   : v1.0 (13/Aug/2016)                     /
:: / Current Release : v3.28 (05/Jun/2023)                    /
:: / Released under the MIT License.                          /
:: / Please don't modify or redistribute without              /
:: / proper credits.                                          /
:: /----------------------------------------------------------/
:: /----------------------------------------------------------/

set path=%path%;%cd%\bin;%cd%\scripts

:begin

call envsetup

mode %window_medium%
color 07
cls

if not exist "%aycdata%\first_run.txt" call firstRun

if %loc_invalid% == 1 call settingsChangeDir

if %try_invalid% == 1 call settingsChangeDefinedTry

:checkParameter
if %ayc.arg1%p equ p goto start
if %ayc.arg1% equ "b" goto batch
if %ayc.arg1% equ "B" goto batch
set url=%ayc.arg1%
set url=%url:"=%
echo %url%| findstr /i /r /c:"^https://www.youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^https://m.youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^https://youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^https://youtu.be"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^http://www.youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^http://m.youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^http://youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^http://youtu.be"
if %errorlevel% == 0 goto formatSelector
set uni_url=%url%
set pass_to_uni=1
goto uni


:start
mode %window_medium%
color 07
set "url="
title Saving to %loc%
cls
call gui bannerMedium
echo.
echo Enter M for more options.
echo.
echo Paste any Video/Playlist/Channel URL or QuickKey and press Enter.
echo.
if %url_invalid% == 1 (
    echo %url_validation_msg%
    echo.
)
if %show_quickkey% == 1 (
    echo Available QuickKeys: ^(b^) - Batch Mode ^(s^) - Settings
    echo.
)
set /p url=">> "
for /f "tokens=1 delims=&" %%a in ("%url%") do (
  set url=%%a
)
set url=%url: =%
if "%url%" equ "" set show_quickkey=1 && goto start
if "%url%" equ " =" set show_quickkey=1 && goto start
if "%url%" equ "b" set show_quickkey=0 && set url_invalid=0 && start AYClient.bat "%url%" && goto start
if "%url%" equ "B" set show_quickkey=0 && set url_invalid=0 && start AYClient.bat "%url%" && goto start
if "%url%" equ "m" set show_quickkey=0 && set url_invalid=0 && goto more
if "%url%" equ "M" set show_quickkey=0 && set url_invalid=0 && goto more
if "%url%" equ "s" set show_quickkey=0 && set url_invalid=0 && set from_url=1 && call settingsMenu
if "%url%" equ "S" set show_quickkey=0 && set url_invalid=0 && set from_url=1 && call settingsMenu

echo %url% | findstr /I /R "^http://" > nul
if %errorlevel% == 0 set show_quickkey=0 && set url_invalid=0 && start AYClient.bat "%url%" && goto start

echo %url% | findstr /I /R "^https://" > nul
if %errorlevel% == 0 set show_quickkey=0 && set url_invalid=0 && start AYClient.bat "%url%" && goto start

set show_quickkey=1
set url_invalid=1
goto start


:formatSelector
mode %window_small%
color 07
if %is_batch% == 0 title Link Recieved
if %is_batch% == 1 title Choose format
cls
call gui bannerSmall
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
call gui borderSmall
echo  Video + Audio
echo.
echo   (1) - MP4 Video/AAC Audio (Upto 1080p)
echo.
echo   (2) - VP9 Video/OPUS Audio (Upto 4K)
echo.
echo   (3) - AV1 Video/OPUS Audio (Upto 8K)
echo.
call gui borderSmall
echo  Audio Only
echo.
echo   (4) - M4A  - AAC Audio  - 128kbps
echo.
echo   (5) - MP3  - MP3 Audio  - 128kbps
echo.
echo   (6) - WEBM - OPUS Audio - 160kbps
echo.
call gui borderSmall
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
call gui bannerSmall
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
call gui borderSmall
echo  Choose Maximum Quality
echo.
echo   (1) - 144p 
echo   (2) - 240p   (If not available, returns to 144p) 
echo   (3) - 360p   (If not available, returns to 240p) 
echo.
call gui borderSmall
echo.
echo   (4) - 480p   (If not available, returns to 360p) 
echo   (5) - 720p   (If not available, returns to 480p) 
echo   (6) - 1080p  (If not available, returns to 720p) 
echo.
if NOT %format_chosen% == h264 call gui borderSmall
if NOT %format_chosen% == h264 echo.
if NOT %format_chosen% == h264 echo   (7) - 1440p  (If not available, returns to 1080p)
if NOT %format_chosen% == h264 echo   (8) - 4K     (If not available, returns to 1440p)
if %format_chosen% == av1 echo   (9) - 8K     (If not available, returns to 4K)
if not %format_chosen% == h264 echo.
call gui borderSmall
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
call gui bannerSmall
echo.
echo  Starting Download
echo -------------------
echo.
echo  URL: %url%
echo.
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -o "%loc%\%%(title).107s-MP4-%%(height).5sp-%%(id).10s.%%(ext)s" "%url%" && goto downloadSuccess
if %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% --merge-output-format mp4 %subs% %thumbs% -o "%loc%\%%(title).107s-VP9-%%(height).5sp-%%(id).10s.%%(ext)s" "%url%" && goto downloadSuccess
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -o "%loc%\%%(title).107s-AV1-%%(height).5sp-%%(id).10s.%%(ext)s" "%url%" && goto downloadSuccess
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% -o "%loc%\%%(title).117s-%%(id).10s.%%(ext)s" "%url%" && goto downloadSuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto downloadTried


:more
mode %window_small%
color 07
title More Options
cls
call gui bannerSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Batch Mode         QuickKey: B
echo.
echo  (2) - Settings           QuickKey: S
echo.
echo  (3) - About
echo.
echo  (4) - Visit on GitHub
echo.
echo  (5) - Visit on Sourceforge
echo.
echo -------------------
echo.
choice /c 012345 /n /m "Enter Choice (0-5): "
if %errorlevel% == 1 goto start
if %errorlevel% == 2 start AYClient.bat "b" && goto more
if %errorlevel% == 3 call settingsMenu
if %errorlevel% == 4 goto about
if %errorlevel% == 5 start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc"
if %errorlevel% == 6 start "" "https://sourceforge.net/projects/advanced-youtube-client-ayc"
goto more


:uni
mode %window_small%
color 07
title Link Recieved
cls
call gui bannerSmall
echo.
echo  URL: %uni_url%
echo.
echo  Non-YouTube link detected.
echo.
call gui borderSmall
echo.
echo  Choose Format
echo.
echo   (1) - Highest Quality
echo.
echo   (2) - Lowest Quality
echo.
echo   (3) - Show all available formats
echo.
call gui borderSmall
echo.
choice /c 123 /n /m "Enter Choice (1-3): "
if %errorlevel% == 1 set uni_qual="bv*+ba/b" && goto uniDownload
if %errorlevel% == 2 set uni_qual="wv*+wa/w" && goto uniDownload
if %errorlevel% == 3 goto uniQualitySelector


:uniQualitySelector
mode %window_large%
set "uni_qual="
color 07
title Select Quality
cls
call gui bannerLarge
echo.
echo  URL: %uni_url%
echo.
%youtube_dl% -F "%uni_url%" && goto uniQualitySelectorContinue
set error_mode=uni
goto error
:uniQualitySelectorContinue
echo -------------------------------------------------
echo.
echo Enter 0 to go back.
echo.
echo Merge two formats using + symbol.
echo.
set /p uni_qual=Choose ID (green color in the list above): 
set uni_qual=%uni_qual: =%
if "%uni_qual%" equ "" goto uniQualitySelector
if "%uni_qual%" equ " =" goto uniQualitySelector
if %uni_qual% == 0 goto uni


:uniDownload
set "try="
set try=%try_count%


:uniDownloadTried
set error_mode=uni
mode %window_small%
color 0B
title Finger's Crossed! How's the weather?
cls
call gui bannerSmall
echo.
echo  Starting Download
echo -------------------
echo.
echo  URL: %uni_url%
echo.
%youtube_dl% %default_config% -f %uni_qual% --external-downloader aria2c -o "%loc%\%%(title).111s-%%(height).5sp-%%(id).10s.%%(ext)s" "%uni_url%" && goto downloadSuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto uniDownloadTried


:batch
mode %window_medium%
set batch_exists_true=0
color 07
title Batch Mode
set "job_name="
cls
call gui bannerMedium
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
if "%job_name%" equ "" set job_name_invalid=1 && goto batch
set job_name=%job_name:"=%
md "%loc%\%job_name%">NUL
if not exist "%loc%\%job_name%" set job_name_invalid=1 && goto batch
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
call gui bannerSmall
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
if %errorlevel% == 1 goto batch
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
call gui bannerSmall
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
set "batch_link_tmp="
cls
call gui bannerSmall
echo.
echo  Paste each url and press enter, the links will be added to 
echo  your list.
echo.
echo  Enter 0 to Go Back after adding links
echo.
echo --------------------------------------------
echo.


:batchAddLinksLoop
set url_invalid=1
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
echo %batch_link_tmp% | findstr /i /r "^http://" > nul
if %errorlevel% == 0 set url_invalid=0
echo %batch_link_tmp% | findstr /i /r "^https://" > nul
if %errorlevel% == 0 set url_invalid=0
if %url_invalid% == 1 (
    echo %url_validation_msg%
    echo.
    goto batchAddLinksLoop
)
if %url_invalid% == 0 (
    echo %batch_link_tmp%>>"%loc%\%job_name%\%job_name%.txt"
    set "batch_link_tmp="
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
call gui bannerSmall
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
call gui bannerMedium
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

echo %batch_custom_format_url% | findstr /i /r "^http://">NUL
if %errorlevel% == 0 set url_invalid=0 && goto batchCustomFormatSelector
echo %batch_custom_format_url% | findstr /i /r "^https://">NUL
if %errorlevel% == 0 set url_invalid=0 && goto batchCustomFormatSelector
set url_invalid=1
goto batchCustomFormat

:batchCustomFormatSelector
mode %window_large%
set "batch_custom_qual="
title Retrieving all available qualities
color 07
cls
call gui bannerLarge
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
goto batch


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
call gui bannerSmall
echo.
echo  Starting Download
echo -------------------
echo.
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -o "%loc%\%job_name%\%%(title).107s-MP4-%%(height).5sp-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadSuccess
if %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -o "%loc%\%job_name%\%%(title).107s-VP9-%%(height).5sp-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadSuccess
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -o "%loc%\%job_name%\%%(title).107s-AV1-%%(height).5sp-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadSuccess
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% -o "%loc%\%job_name%\%%(title).117s-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadSuccess
if %format_chosen% == batch %youtube_dl% %default_config% %conf% %aria2% -o "%loc%\%job_name%\%%(title).106s-%batch_name_end%-%%(id).10s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadSuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto batchDownloadTried


:error
mode %window_small%
color 4F
title Download Failed!
cls
call gui bannerSmall
echo.
echo  Download Failed!!!! :-(
echo.
if %error_mode% == batch echo  Job: %job_name%
if %error_mode% == regular echo  URL: %url%
echo.
echo  Possible problems and solutions:
echo.
if %error_format% == av1 echo  - If you chose AV1, not all videos are supported by
if %error_format% == av1 echo   youtube yet.
echo  - yt-dlp might be out of date. Update it by going 
echo  into Settings, Update yt-dlp.
echo  - If you have an unreliable network, enable rechecks
echo   in Settings.
if %error_mode% == batch (
    echo  - You may have entered an invalid job name.
    echo - One of your links might be failing, rest might have
    echo  downloaded successfully.
)
if %error_mode% == regular (
    echo  - You may have entered an invalid/private link. These
    echo   aren't supported yet.
)
echo.
echo   If all else fails, report the failing URLs on the 
echo   Sourceforge or GitHub page. 
echo.
if NOT %error_mode% == regular echo  Press enter to try again.
if %error_mode% == regular echo  Press enter to close this window.
pause>NUL
if %error_mode% == batch goto batch
if %error_mode% == uni goto exit
if %error_mode% == regular goto exit


:downloadSuccess
mode %window_small%
color 2F
title Download Finished
cls
call gui bannerSmall
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
if NOT %error_mode% == regular if %pass_to_uni% == 0 echo  Press enter to do it again.
if %error_mode% == regular echo  Press enter to close this window.
if %error_mode% == uni echo  Press enter to close this window.
pause>NUL
if %error_mode% == batch goto batch
if %error_mode% == uni exit
if %error_mode% == regular goto exit


:about
mode %window_small%
color 07
title You're a curious one..
cls
call gui bannerSmall
echo.
echo   Advanced Youtube Client - AYC Script
echo.
echo   Author           : Adithya S Sekhar
echo.
echo   First Release    : v1.0 (13/Aug/2016)
echo.
echo   Current Release  : %version%
echo.
echo   Made with (love) in Kerala.
echo.
echo   Released under the MIT License.
echo.
echo   Press Enter to go back.
pause>NUL
goto more


:exit
exit

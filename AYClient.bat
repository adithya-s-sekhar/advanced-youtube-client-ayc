@echo off
setlocal enabledelayedexpansion
set version=v3.20 (13/May/2023)
set internal_version=320
set version_mismatch=0
set error_format=0
set error_mode=0
set is_batch=0
set pass_to_uni=0
set window_medium=con:cols=92 lines=26
set window_small=con:cols=60 lines=32
set window_large=con:cols=110 lines=52


:: /------------------------------------------------------/
:: /------------------------------------------------------/
:: / Advanced Youtube Client - AYC Script                 /
:: / Author          : Adithya S Sekhar                   /
:: / First Release   : v1.0 (13/Aug/2016)                 /
:: / Current Release : v3.20 (13/May/2023)                /
:: / Released under the MIT License.                      /
:: / Please don't modify or redistribute without          /
:: / proper credits.                                      /
:: /------------------------------------------------------/
:: / Some parts of the code might look weird but those    /
:: / were added, refactored and cleaned to fix some edge  /
:: / cases found over the years. Trust me, those are      /
:: / there for a reason. Still you're welcome to          /
:: / improving these and if it works, submit a PR, any    /
:: / help is appreciated. :)                              /
:: /------------------------------------------------------/
:: / The script is lacking in documentation.              /
:: / Unfortunately, I am too busy looking for a job to    /
:: / have time to maintain this and write documentation.  /
:: / Hope it's readable. Any PR to add Documentation is   /
:: / also welcome.                                        /
:: /------------------------------------------------------/
:: /------------------------------------------------------/


:begin
mode %window_medium%

if not exist "%cd%\data" md "%cd%\data"
if not exist "%cd%\Output" md "%cd%\Output"

set aycdata=%cd%\data
if exist youtube-dl.exe set youtube_dl="youtube-dl.exe"
if exist yt-dlp_x86.exe set youtube_dl="yt-dlp_x86.exe"
if exist yt-dlp.exe set youtube_dl="yt-dlp.exe"
set default_config=--ignore-errors --no-warnings --windows-filenames

if not exist %youtube_dl% goto ytMissing
if not exist ffmpeg.exe goto ffmpegMissing
if not exist atomicparsley.exe goto atomicparsleyMissing
if not exist aria2c.exe goto aria2Missing

if not exist "%aycdata%\external_version.txt" goto externalVersionMissing
set /p external_version=<"%aycdata%\external_version.txt"
set external_version=%external_version:"=%
if NOT %external_version% == %internal_version% set version_mismatch=1 && goto reset

if not exist "%aycdata%\first_run.txt" goto firstRun

if not exist "%aycdata%\dir.txt" goto dirMissing
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
if not exist "%loc%\" goto locMissing
if exist "%loc%" set loc_invalid=0

if not exist "%aycdata%\try.txt" goto tryMissing
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
echo %defined_try%| findstr /r "^[0-9][0-9]*$">nul
if not %errorlevel% == 0 set try_invalid=1 && goto settingsChangeDefinedTry
set try_invalid=0

if not exist "%aycdata%\aria2_status.txt" goto aria2StatusMissing
set /p aria2_status=<"%aycdata%\aria2_status.txt"
set aria2_status=%aria2_status:"=%

if not exist "%aycData%\thumbs_status.txt" goto thumbsStatusMissing
set /p thumbs_status=<"%aycdata%\thumbs_status.txt"
set thumbs_status=%thumbs_status:"=%

if not exist "%aycdata%\subs_status.txt" goto subsStatusMissing
set /p subs_status=<"%aycdata%\subs_status.txt"
set subs_status=%subs_status:"=%

goto checkParameter


:firstRun
title Welcome to AYC
echo "0">"%aycdata%\first_run.txt"
cls
call :bannerLarge
echo.
echo Preparing for first run..
echo.
echo Please wait, updating yt-dlp..
%youtube_dl% -U
goto begin


:externalVersionMissing
echo "%internal_version%">"%aycdata%\external_version.txt"
goto begin


:dirMissing
md "%cd%\Output"
echo "%cd%\Output">"%aycdata%\dir.txt"
goto begin

:locMissing
md "%loc%"
if not exist "%loc%\" set loc_invalid=1 && goto settingsChangeDir
goto begin

:tryMissing
echo "0">"%aycdata%\try.txt"
goto begin


:aria2StatusMissing
echo "0">"%aycdata%\aria2_status.txt"
goto begin


:thumbsStatusMissing
echo "1">"%aycdata%\thumbs_status.txt"
goto begin


:subsStatusMissing
echo "0">"%aycdata%\subs_status.txt"
goto begin


:ytMissing
title yt-dlp missing!
start "" "https://github.com/yt-dlp/yt-dlp/releases/latest"
cls
call :bannerLarge
echo.
echo  yt-dlp.exe is missing! AYC Opened a webpage right now for you to download the missing
echo  dependency.
echo.
echo  URL: https://github.com/yt-dlp/yt-dlp/releases/latest
echo.
echo  Filename: yt-dlp.exe (For 64-bit)
echo.
echo  Filename: yt-dlp_x86.exe (For 32-bit)
echo.
echo  After download, copy it to the same folder as AYClient.bat
echo  and press ENTER.
echo.
pause>NUL
goto begin


:ffmpegMissing
title ffmpeg missing!
start "" "https://github.com/yt-dlp/FFmpeg-Builds/releases/latest"
cls
call :bannerLarge
echo.
echo  ffmpeg.exe is missing! AYC Opened a webpage right now for you to download the missing
echo  dependency.
echo.
echo  URL: https://github.com/yt-dlp/FFmpeg-Builds/releases/latest
echo.
echo  Filename: ffmpeg-n...-win64-gpl-6.0.zip (For 64-bit)
echo.
echo  Filename: ffmpeg-n...-win32-gpl-6.0.zip (For 32-bit)
echo.
echo  After download, extract the archive and copy bin\ffmpeg.exe to the same folder as AYClient.bat
echo  and press ENTER.
echo.
pause>NUL
goto begin


:atomicparsleyMissing
title AtomicParsley missing!
start "" "https://github.com/wez/atomicparsley/releases/latest"
cls
call :bannerLarge
echo.
echo  AtomicParsley.exe is missing! AYC Opened a webpage right now for you to download the 
echo  missing dependency. Pick the right one for you.
echo.
echo  Filename: AtomicParsleyWindows.zip (For 64-bit)
echo.
echo  Filename: AtomicParsleyWindowsX86.zip (For 32-bit)
echo.
echo  After download, extract the archive and copy AtomicParsley.exe to the same folder as 
echo  AYClient.bat and press ENTER.
echo.
pause>NUL
goto begin


:aria2Missing
title aria2c missing!
start "" "https://github.com/aria2/aria2/releases/latest"
cls
call :bannerLarge
echo.
echo  aria2c.exe is missing! AYC Opened a webpage right now for you to download the 
echo  missing dependency. Pick the right one for you.
echo.
echo  URL: https://github.com/aria2/aria2/releases/latest
echo.
echo  Filename: aria2-...-win-32bit-build1.zip (For 32-bit)
echo.
echo  Filename: aria2-...-win-64bit-build1.zip (For 64-bit)
echo.
echo  After download, extract the archive and copy aria2c.exe to the same folder as 
echo  AYClient.bat and press ENTER.
echo.
pause>NUL
goto begin


:checkParameter
if %1p equ p goto start
if %1% equ "b" goto batch
if %1% equ "B" goto batch
if %1% equ "u" goto uni
if %1% equ "U" goto uni
if %1% equ "s" goto settings
if %1% equ "S" goto settings
set url=%1%
set url=%url:"=%
echo %url%| findstr /i /r /c:"^https://www.youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^https://m.youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^https://youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^https://youtu.be"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^www.youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^m.youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^youtube.com"
if %errorlevel% == 0 goto formatSelector
echo %url%| findstr /i /r /c:"^youtu.be"
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
call :bannerLarge
echo.
echo Enter M for more options.
echo.
set /p url=Paste any URL or QuickKey: 
if "%url%" equ "" goto start
if "%url%" equ "m" goto more
if "%url%" equ "M" goto more
start AYClient.bat "%url%"
goto start


:formatSelector
mode %window_small%
color 07
if %is_batch% == 0 title Link Recieved
if %is_batch% == 1 title Choose format
cls
call :bannerSmall
echo.
if %is_batch% == 0 echo  URL: %url%
if %is_batch% == 1 echo  Working on: %job_name%
echo.
if %is_batch% == 1 echo   (0) - Go Back
if %is_batch% == 1 echo.
echo  Choose format
echo ------------------------------------------------------------
echo  Video + Audio
echo.
echo   (1) - MP4 Video/AAC Audio (Upto 1080p)
echo.
echo   (2) - VP9 Video/OPUS Audio (Upto 4K)
echo.
echo   (3) - AV1 Video/OPUS Audio (Upto 8K)
echo ------------------------------------------------------------
echo  Audio Only
echo.
echo   (4) - M4A  - AAC Audio  - 128kbps
echo.
echo   (5) - MP3  - MP3 Audio  - 128kbps
echo.
echo   (6) - WEBM - OPUS Audio - 160kbps
echo ------------------------------------------------------------
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
call :bannerSmall
echo.
if %is_batch% == 0 echo  URL: %url%
if %is_batch% == 1 echo  Working on: %job_name%
echo.
if %format_chosen% == h264 echo  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == vp9 echo  Format: .MP4 (VP9 Video/OPUS Audio)
if %format_chosen% == av1 echo  Format: .MP4 (AV1 Video/OPUS Audio)
echo.
echo   (0) - Go Back
echo.
echo ------------------------------------------------------------
echo  Choose Maximum Quality
echo.
echo   (1) - 144p 
echo   (2) - 240p   (If not available, returns to 144p) 
echo   (3) - 360p   (If not available, returns to 240p) 
echo.
echo   (4) - 480p   (If not available, returns to 360p) 
echo   (5) - 720p   (If not available, returns to 480p) 
echo   (6) - 1080p  (If not available, returns to 720p) 
if NOT %format_chosen% == h264 echo.
if NOT %format_chosen% == h264 echo   (7) - 1440p  (If not available, returns to 1080p)
if NOT %format_chosen% == h264 echo   (8) - 4K     (If not available, returns to 1440p)
if %format_chosen% == av1 echo   (9) - 8K     (If not available, returns to 4K)
if %format_chosen% == vp9  goto choiceVp9
if %format_chosen% == av1  goto choiceAv1
echo ------------------------------------------------------------
echo.
choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=144]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=360]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=480]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]"
if %errorlevel% == 255 goto qualitySelector
if %is_batch% == 0 goto download
if %is_batch% == 1 goto batchDownload

:choiceVp9
echo ------------------------------------------------------------
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
if %errorlevel% == 255 goto qualitySelector
if %is_batch% == 0 goto download
if %is_batch% == 1 goto batchDownload

:choiceAv1
set error_format=av1
echo ------------------------------------------------------------
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
if %errorlevel% == 255 goto qualitySelector
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
if %subs_status% == 1 set subs=--embed-subs


:downloadTried
set error_mode=regular
mode %window_small%
color 0B
title Downloading
cls
call :bannerSmall
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
call :bannerSmall
echo.
echo  (0) - GO BACK
echo.
echo  (1) - Universal Mode     QuickKey: U
echo.
echo  (2) - Batch Mode         QuickKey: B
echo.
echo  (3) - Settings           QuickKey: S
echo.
echo  (4) - About
echo.
echo  (5) - Visit on GitHub
echo.
echo  (6) - Visit on Sourceforge
echo.
echo -------------------
echo.
choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 goto start
if %errorlevel% == 2 start AYClient.bat "u" && goto more
if %errorlevel% == 3 start AYClient.bat "b" && goto more
if %errorlevel% == 4 goto settings
if %errorlevel% == 5 goto about
if %errorlevel% == 6 start "" "https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc"
if %errorlevel% == 7 start "" "https://sourceforge.net/projects/advanced-youtube-client-ayc/"
if %errorlevel% == 255 goto more
goto more


:uni
mode %window_medium%
if not %pass_to_uni% == 1 set "uni_url="
color 07
title Universal Mode
cls
call :bannerLarge
echo.
echo  Universal mode enables you to download from any webpage with playing video. 
if %pass_to_uni% == 0 echo  eg: youtube and others
echo.
echo --------------------------------------------------------------------------------------------
echo.
if %pass_to_uni% == 0 if "%uni_url%" equ "" (
    set /p uni_url=Paste a page url with playing video: 
    if "!uni_url!" == "" goto uni
)

if %pass_to_uni% == 1 if not "%uni_url%" equ "" (
    echo Link recieved: %uni_url%
)

echo.
echo  Choose Quality: 
echo.
echo   (1) - Highest Quality
echo.
echo   (2) - Lowest Quality
echo.
echo   (3) - Show all available formats
echo.
echo -------------------
echo.
choice /c 123 /n /m "Enter Choice (1-3): "
if %errorlevel% == 1 set uni_qual="bv*+ba/b" && goto uniDownload
if %errorlevel% == 2 set uni_qual="wv*+wa/w" && goto uniDownload
if %errorlevel% == 3 goto uniQualitySelector
if %errorlevel% == 255 goto uni
if "%uni_url%" equ "" goto uni


:uniQualitySelector
mode %window_large%
set "uni_qual="
color 07
title Universal Mode: URL Recieved
cls
call :bannerLarge
echo.
echo  URL: %uni_url%
echo.
%youtube_dl% -F "%uni_url%" && goto uniQualitySelectorContinue
set error_mode=uni
goto error
:uniQualitySelectorContinue
echo.
echo  Enter 0 to go back.
echo.
echo -------------------------------------------------
echo.
echo Merge two formats using + symbol.
set /p uni_qual=Choose ID (green color in the list above): 
if "%uni_qual%" equ "" goto uniQualitySelector
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
call :bannerSmall
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
call :bannerLarge
echo.
echo  Batch Mode allows you to create jobs, add videos to that  job and download it.
echo.
echo  Job URLs are saved and can be resumed by re-entering the same job.
echo.
echo ------------------------------------------
echo.
set /p job_name=Enter Job Name (eg: Songs): 
if "%job_name%" equ "" goto batch
md "%loc%\%job_name%"
if exist "%loc%\%job_name%\%job_name%.txt" set batch_exists_true=1 && goto batchIsYoutubeCheck
echo.>"%loc%\%job_name%\%job_name%.txt"


:batchIsYoutubeConfirm
echo.
choice /c yn /n /m "Is this a YouTube Download Job? (Yes/No) "
if %errorlevel% == 1 set youtube=1 && echo "1">"%loc%\%job_name%\is_youtube.txt"
if %errorlevel% == 2 set youtube=0 && echo "0">"%loc%\%job_name%\is_youtube.txt"
if %errorlevel% == 255 goto batch


:batchIsYoutubeCheck
if not exist "%loc%\%job_name%\is_youtube.txt" goto batchIsYoutubeConfirm
set /p youtube=<"%loc%\%job_name%\is_youtube.txt"
set youtube=%youtube:"=%


:batchManage
mode %window_small%
color 07
title Now working on %job_name%
cls
call :bannerSmall
echo.
if %batch_exists_true% == 1 echo  Resuming Job: %job_name%
if %batch_exists_true% == 0 echo  New Job: %job_name%
echo.
if %youtube% == 1 echo  Youtube Job: Yes
if %youtube% == 0 echo  Youtube Job: No
echo --------------------------
echo.
echo  (0) - GO BACK
echo.
echo  (1) - Add Video Links
echo.
echo  (2) - Open Job File (Delete, View, Add Links through 
echo        Notepad)
echo.
if %youtube% == 1 echo  (3) - Change job to Non-Youtube mode
if %youtube% == 0 echo  (3) - Change job to Youtube mode
echo.
if %batch_exists_true% == 1 echo  (4) - Resume Batch Job
if %batch_exists_true% == 0 echo  (4) - Start Batch Job
echo.
echo --------------------------
echo.
choice /c 01234 /n /m "Enter Choice (0-4): "
if %errorlevel% == 1 goto batch
if %errorlevel% == 2 goto batchAddLinks
if %errorlevel% == 3 start notepad.exe "%loc%\%job_name%\%job_name%.txt"
if %errorlevel% == 4 goto batchChangeType
if %errorlevel% == 5 goto batchQuickQualitySelector
if %errorlevel% == 255 goto batchManage
goto batchManage


:batchAddLinks
mode %window_small%
color 07
title Enter 0 to go back after adding links.
set "batch_link_tmp="
cls
call :bannerSmall
echo.
echo  Paste each url and press enter, the links will be added to 
echo  your list.
echo.
echo  Enter 0 to Go Back after adding links
echo.
echo --------------------------------------------
echo.


:batchAddLinksLoop
set /p batch_link_tmp=Paste Link: 
if "%batch_link_tmp%" equ "" (
    echo URL is blank.
    echo.
    goto batchAddLinksLoop
)
echo.
if "%batch_link_tmp%" equ "0" goto batchManage
echo %batch_link_tmp%>>"%loc%\%job_name%\%job_name%.txt"
set "batch_link_tmp="
goto batchAddLinksLoop


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
call :bannerSmall
if %youtube% == 1 set is_batch=1 && goto formatSelector
if %youtube% == 0 echo.
echo ---------------------------------
echo  Select Quality
echo ---------------------------------
echo.
echo  (0) - GO BACK
echo.
echo  (1) - Highest Quality
echo.
echo  (2) - Lowest Quality
echo.
echo  (3) - Pick a custom format code
echo ---------------------------------
choice /c 0123 /n /m "Choose Quality (0-3): "
if %errorlevel% == 1 goto batchManage
if %errorlevel% == 2 set conf=-f "bv*+ba/b" & set batch_name_end=high
if %errorlevel% == 3 set conf=-f "wv*+wa/w" & set batch_name_end=low
if %errorlevel% == 4 goto batchCustomFormat
if %errorlevel% == 255 goto batchQuickQualitySelector
set format_chosen=batch
goto batchDownload

:batchCustomFormat
mode %window_medium%
set "batch_custom_format_url="
color 07
title Pick custom format code
cls
call :bannerLarge
echo.
echo  Working on: %job_name%
echo.
echo  Enter 0 to Go Back.
echo.
echo  Paste a sample URL from your batch job to retrieve all available qualities.
echo.
echo -----------
echo.
set /p batch_custom_format_url=Sample URL: 
if "%batch_custom_format_url%" equ "" goto batchCustomFormat
if "%batch_custom_format_url%" equ "0" goto batchQuickQualitySelector

:batchCustomFormatSelector
mode %window_large%
set "batch_custom_qual="
title Retrieving all available qualities
color 07
cls
call :bannerLarge
echo.
echo  Working on: %job_name%
echo.
echo  Sample URL: %batch_custom_format_url%
echo.
%youtube_dl% -F "%batch_custom_format_url%"
echo.
echo  Enter 0 to Go Back.
echo -------------------------------------------------
echo.
echo You can also type "best" and "worst".
set /p batch_custom_qual=Choose ID (green color in the list above): 
if "%batch_custom_qual%" equ "" goto batchCustomFormatSelector
if "%batch_custom_qual%" equ "0" goto batchCustomFormat
set conf=-f %batch_custom_qual%
set batch_name_end=%batch_custom_qual%
set format_chosen=batch
goto batchDownload


:batchDownload
set "try="
set try=%try_count%

if %aria2_status% == 1 set aria2=--external-downloader aria2c
if %youtube% == 0 set aria2=--external-downloader aria2c
if %youtube% == 1 if %aria2_status% == 0 set aria2=--concurrent-fragments 8

if %thumbs_status% == 0 set "thumbs="
if %thumbs_status% == 1 set thumbs=--embed-thumbnail

if %subs_status% == 0 set "subs="
if %subs_status% == 1 set subs=--embed-subs


:batchDownloadTried
set error_mode=batch
mode %window_small%
color 0B
title Downloading
cls
call :bannerSmall
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
call :bannerSmall
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
if %error_mode% == uni goto uni
if %error_mode% == regular goto exit


:downloadSuccess
mode %window_small%
color 2F
title Download Finished
cls
call :bannerSmall
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
if NOT %error_mode% == regular if %pass_to_uni% == 0 echo  Press enter to do it again.
if %error_mode% == regular echo  Press enter to close this window.
if %error_mode% == uni if %pass_to_uni% == 1 echo  Press enter to close this window.
pause>NUL
if %error_mode% == batch goto batch
if %error_mode% == uni if %pass_to_uni% == 1 exit
if %error_mode% == uni if %pass_to_uni% == 0 goto uni
if %error_mode% == regular goto exit


:settings
mode %window_small%
color 07
title AYC Settings
cls
call :bannerSmall
echo.
echo  (0) - GO BACK
echo.
echo  (1) - Change Download Folder
echo        Currently: %loc%
echo.
echo  (2) - No. of Rechecks
echo        Currently: %defined_try%
echo.
echo  (3) - Update yt-dlp (fixes most issues)
echo.
echo  (4) - Force aria2 on all downloads
if %aria2_status% == 0 echo        [Disabled]
if %aria2_status% == 1 echo        [Enabled]
echo.
echo  (5) - Embed Thumbnails
if %thumbs_status% == 0 echo        [Disabled]
if %thumbs_status% == 1 echo        [Enabled]
echo.
echo  (6) - Embed Subtitles
if %subs_status% == 0 echo        [Disabled]
if %subs_status% == 1 echo        [Enabled]
echo.
echo  (7) - Reset AYC
echo.
echo -----------------------------------
echo.
choice /c 01234567 /n /m "Select Option (0-7): "
if %errorlevel% == 1 goto more
if %errorlevel% == 2 goto settingsChangeDir
if %errorlevel% == 3 goto settingsChangeDefinedTry
if %errorlevel% == 4 goto update
if %errorlevel% == 5 goto settingsChangeAria2
if %errorlevel% == 6 goto settingsChangeThumbs
if %errorlevel% == 7 goto settingsChangeSubs
if %errorlevel% == 8 goto reset
if %errorlevel% == 255 goto settings


:settingsChangeDir
mode %window_small%
color 07
title Change Download Location
cls
set "settings_dir="
call :bannerSmall
echo.
if %loc_invalid% == 0 echo  Current download folder is:
if %loc_invalid% == 1 echo  Invalid download folder:
echo  %loc%
echo.
echo ----------------------------------------------
echo  Drag and Drop the folder you want AYC to save
echo  it's downloads into the below area.
echo.
echo  Then Press Enter to save.
echo.
if %loc_invalid% == 0 echo  Enter 0 to Go Back.
if %loc_invalid% == 1 echo  Or Enter R to reset AYC to default.
echo ----------------------------------------------
echo.
set /p settings_dir=Drag and Drop here: 
if %settings_dir%p equ p goto settingsChangeDir
if %loc_invalid% == 0 if %settings_dir% == 0 goto settings
if %loc_invalid% == 1 if %settings_dir% == r goto reset
if %loc_invalid% == 1 if %settings_dir% == R goto reset
echo "%settings_dir%">"%aycdata%\dir.txt"
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
if not exist "%loc%\" md "%loc%"
if not exist "%loc%\" set loc_invalid=1 && goto settingsChangeDir
if %loc_invalid% == 1 if exist "%loc%\" set loc_invalid=0 && goto begin
goto settings


:settingsChangeDefinedTry
mode %window_small%
color 07
title Change recheck attempts
cls
set "settings_try="
call :bannerSmall
echo.
echo  Change recheck attempts
echo.
echo  On unstable connections, playlist/batch download can 
echo  sometimes miss a file and will fail the download.
echo.
echo  The number you set here is the number of times AYC will 
echo  recheck the download to see if any files are missing.
echo.
echo  If it found any, that missing file will be downloaded.
if %try_invalid% == 1 (
    echo.
    echo  Invalid value detected: %defined_try%
    echo. 
    echo  Enter a number or Enter R to reset
)
if %try_invalid% == 0 (
    echo.
    echo  Current value: %defined_try%
    echo.
    echo  Leave blank and Enter to go back.
)
echo.
echo ------------------------------------------------------------
echo.
set /p settings_try=No. of Rechecks (Changing will exit AYC): 
if %settings_try%p equ p goto settings
if %try_invalid% == 1 if %settings_try% == r goto reset
if %try_invalid% == 1 if %settings_try% == R goto reset
echo "%settings_try%">"%aycdata%\try.txt"
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
echo %defined_%| findstr /r "^[0-9][0-9]*$">nul
if not %errorlevel% == 0 set try_invalid=1 goto settingsChangeDefinedTry
if %try_invalid% == 1 set try_invalid=0 && goto begin
goto settings


:update
mode %window_small%
color 07
title Update yt-dlp
cls
call :bannerSmall
echo.
echo  Checking for updates..
%youtube_dl% -U
echo.
echo  Press Enter to go back.
pause>NUL
goto settings


:settingsChangeAria2
if %aria2_status% == 0 (
    set aria2_status=1
    echo "1">"%aycdata%\aria2_status.txt"
    goto settings
)
if %aria2_status% == 1 (
    set aria2_status=0
    echo "0">"%aycdata%\aria2_status.txt"
    goto settings
)


:settingsChangeThumbs
if %thumbs_status% == 0 (
    set thumbs_status=1
    echo "1">"%aycdata%\thumbs_status.txt"
    goto settings
)
if %thumbs_status% == 1 (
    set thumbs_status=0
    echo "0">"%aycdata%\thumbs_status.txt"
    goto settings
)


:settingsChangeSubs
if %subs_status% == 0 (
    set subs_status=1
    echo "1">"%aycdata%\subs_status.txt"
    goto settings
)
if %subs_status% == 1 (
    set subs_status=0
    echo "0">"%aycdata%\subs_status.txt"
    goto settings
)


:reset
mode %window_small%
if %version_mismatch% == 0 (
    color 04
    title Reset AYC
)
if %version_mismatch% == 1 (
    color 02
    title AYC Updated
)
cls
call :bannerSmall
echo.
if %version_mismatch% == 0 (
    echo  You are about to reset AYC to it's default settings.
    echo.
    echo  This should fix any issues caused by incorrect or corrupted settings.
)
if %version_mismatch% == 1 (
    echo  AYC was updated. It is recommended to reset AYC and start
    echo  fresh.
    echo.
    echo  This should fix any issues caused by old settings.
)
echo.
echo ------------------------
echo.
if %version_mismatch% == 0 echo  (0) - GO BACK
if %version_mismatch% == 0 echo.
if %version_mismatch% == 0 echo  (1) - Reset and Exit AYC
if %version_mismatch% == 1 echo  (0) - Keep Settings, Don't Reset
if %version_mismatch% == 1 echo.
if %version_mismatch% == 1 echo  (1) - Reset and Exit AYC
echo.
echo ------------------------
echo.
if %version_mismatch% == 0 goto resetNormal
if %version_mismatch% == 1 goto resetVersionMismatch


:resetNormal
choice /C 01 /n /m "Choose option (0-1): "
if %errorlevel% == 1 goto settings
goto resetFinish


:resetVersionMismatch
choice /C 01 /n /m "Choose option (0-1): "
if %errorlevel% == 1 echo "%internal_version%">"%aycdata%\external_version.txt" && goto begin
goto resetFinish


:resetFinish
del /q "%aycdata%\first_run.txt"
del /q "%aycdata%\dir.txt"
del /q "%aycdata%\try.txt"
del /q "%aycdata%\aria2_status.txt"
del /q "%aycdata%\thumbs_status.txt"
del /q "%aycdata%\subs_status.txt"
del /q "%aycdata%\external_version.txt"
rd /s /q "%aycdata%"
title Reset Succesfully
color 02
cls
echo.
echo.
echo  AYC reset succesfully.
echo.
timeout /t 5 /nobreak
goto exit


:about
mode %window_small%
color 07
title You're a curious one..
cls
call :bannerSmall
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

:bannerLarge
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
goto :EOF

:bannerSmall
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
goto :EOF

:exit
exit

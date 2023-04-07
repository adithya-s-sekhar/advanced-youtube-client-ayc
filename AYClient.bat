@echo off
set version=v3.14 (29/Mar/2023)
set internal_version=314
set version_mismatch=0
set errorformat=0
set errormode=0


:: /--------------------------------------------------/
:: /--------------------------------------------------/
:: /--------------------------------------------------/
:: / Advanced Youtube Client - AYC Script             /
:: / Author          : Adithya S Sekhar               /
:: / First Release   : v1.0 (13/Aug/2016)             /
:: / Current Release : v3.14 (29/Mar/2023)             /
:: / Released under the MIT License.                  /
:: / Please don't modify or redistribute without      /
:: / proper credits.                                  /
:: /--------------------------------------------------/
:: /--------------------------------------------------/
:: /--------------------------------------------------/


:begin
mode con:cols=92 lines=26

if not exist "%cd%\data" md "%cd%\data"
if not exist "%cd%\Output" md "%cd%\Output"

set aycdata=%cd%\data
if exist youtube-dl.exe set youtube_dl="youtube-dl.exe"
if exist yt-dlp_x86.exe set youtube_dl="yt-dlp_x86.exe"
if exist yt-dlp.exe set youtube_dl="yt-dlp.exe"
set default_config=--ignore-errors --no-warnings --trim-filenames 128 --windows-filenames

if not exist %youtube_dl% goto ytnotexist
if not exist ffmpeg.exe goto ffmpegnotexist
if not exist atomicparsley.exe goto atomicnotexist
if not exist aria2c.exe goto aria2notexist

if not exist "%aycdata%\external_version.txt" goto versionnotexist
set /p external_version=<"%aycdata%\external_version.txt"
set external_version=%external_version:"=%
if NOT %external_version% == %internal_version% set version_mismatch=1 && goto reset

if not exist "%aycdata%\firstrun.txt" goto firstrun

if not exist "%aycdata%\dir.txt" goto dirnotexist
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%

if not exist "%aycdata%\try.txt" goto trynotexist
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%

if not exist "%aycdata%\aria2_status.txt" goto aria2_statusnotexist
set /p aria2_status=<"%aycdata%\aria2_status.txt"
set aria2_status=%aria2_status:"=%

if not exist "%aycdata%\thumbs_status.txt" goto thumbs_statusnotexist
set /p thumbs_status=<"%aycdata%\thumbs_status.txt"
set thumbs_status=%thumbs_status:"=%

if not exist "%aycdata%\subs_status.txt" goto subs_statusnotexist
set /p subs_status=<"%aycdata%\subs_status.txt"
set subs_status=%subs_status:"=%

goto check_parameter


:firstrun
title Welcome to AYC
echo "0">"%aycdata%\firstrun.txt"
cls
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
echo.
echo Preparing for first run..
echo.
echo Please wait, updating yt-dlp..
%youtube_dl% -U
goto begin


:versionnotexist
echo "%internal_version%">"%aycdata%\external_version.txt"
goto begin


:dirnotexist
md "%cd%\Output"
echo "%cd%\Output">"%aycdata%\dir.txt"
goto begin


:trynotexist
echo "0">"%aycdata%\try.txt"
goto begin


:aria2_statusnotexist
echo "0">"%aycdata%\aria2_status.txt"
goto begin


:thumbs_statusnotexist
echo "1">"%aycdata%\thumbs_status.txt"
goto begin


:subs_statusnotexist
echo "0">"%aycdata%\subs_status.txt"
goto begin


:ytnotexist
title yt-dlp missing!
start "" "https://github.com/yt-dlp/yt-dlp/releases/latest"
cls
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
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


:ffmpegnotexist
title ffmpeg missing!
start "" "https://github.com/yt-dlp/FFmpeg-Builds/releases/latest"
cls
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
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


:atomicnotexist
title AtomicParsley missing!
start "" "https://github.com/wez/atomicparsley/releases/latest"
cls
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
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


:aria2notexist
title aria2c missing!
start "" "https://github.com/aria2/aria2/releases/latest"
cls
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
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


:check_parameter
if %1p equ p goto start
if %1% equ "b" goto batch
if %1% equ "B" goto batch
if %1% equ "u" goto uni
if %1% equ "U" goto uni
if %1% equ "s" goto settings
if %1% equ "S" goto settings
set url=%1%
set url=%url:"=%
goto format_selector


:start
mode con:cols=92 lines=26
color 07
set "url="
title Saving to %loc%
cls
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
echo.
echo Enter M for more options.
echo.
set /p url=Paste a Youtube Video/Playlist URL or QuickKey: 
if "%url%" equ "" goto start
if "%url%" equ "m" goto more
if "%url%" equ "M" goto more
start AYClient.bat "%url%"
goto start


:format_selector
mode con:cols=60 lines=32
color 07
title Link Recieved
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  URL: %url%
echo.
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
choice /c 123456 /n /m "Enter Choice (1-6): "
if %errorlevel% == 1 set format_chosen=h264
if %errorlevel% == 2 set format_chosen=vp9
if %errorlevel% == 3 set format_chosen=av1
if %errorlevel% == 4 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a] && goto download
if %errorlevel% == 5 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k && goto download
if %errorlevel% == 6 set format_chosen=aud && set conf=--add-metadata -f bestaudio[ext=webm] && goto download
goto menu


:menu
mode con:cols=60 lines=32
color 07
if %format_chosen% == h264 title  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == vp9 title  Format: .MP4 (VP9 Video/OPUS Audio)
if %format_chosen% == av1 title  Format: .MP4 (AV1 Video/OPUS Audio)
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  URL: %url%
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
if %format_chosen% == vp9  goto choice_vp9
if %format_chosen% == av1  goto choice_av1
echo ------------------------------------------------------------
echo.
choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 goto format_selector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=144]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=360]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=480]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]"
if %errorlevel% == 255 goto menu
goto download

:choice_vp9
echo ------------------------------------------------------------
echo.
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto format_selector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec=vp9][height<=144]+bestaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec=vp9][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec=vp9][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec=vp9][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec=vp9][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec=vp9][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec=vp9][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec=vp9][height<=2160]+bestaudio[ext=webm]"
if %errorlevel% == 255 goto menu
goto download

:choice_av1
set errorformat=av1
echo ------------------------------------------------------------
echo.
choice /c 0123456789 /n /m "Enter Choice (0-9): "
if %errorlevel% == 1 goto format_selector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=144]+bestaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec^=av01][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec^=av01][height<=2160]+bestaudio[ext=webm]"
if %errorlevel% == 10 set conf="-f bestvideo[vcodec^=av01][height<=4320]+bestaudio[ext=webm]"
if %errorlevel% == 255 goto menu
goto download


:download
set "try="
set try=%try_count%

if %aria2_status% == 0 set aria2=--concurrent-fragments 8
if %aria2_status% == 1 set aria2=--external-downloader aria2c

if %thumbs_status% == 0 set "thumbs="
if %thumbs_status% == 1 set thumbs=--embed-thumbnail

if %subs_status% == 0 set "subs="
if %subs_status% == 1 set subs=--embed-subs


:downloadtried
set errormode=regular
mode con:cols=60 lines=32
color 0B
title Downloading
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Starting Download
echo -------------------
echo.
echo  URL: %url%
echo.
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -o "%loc%\%%(title)s-MP4-%%(height)sp-%%(id)s.%%(ext)s" "%url%" && goto downloadsuccess
if %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% --merge-output-format mp4 %subs% %thumbs% -o "%loc%\%%(title)s-VP9-%%(height)sp-%%(id)s.%%(ext)s" "%url%" && goto downloadsuccess
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -o "%loc%\%%(title)s-AV1-%%(height)sp-%%(id)s.%%(ext)s" "%url%" && goto downloadsuccess
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% -o "%loc%\%%(title)s-%%(id)s.%%(ext)s" "%url%" && goto downloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto downloadtried


:more
mode con:cols=60 lines=32
color 07
title More Options
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
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
mode con:cols=92 lines=26
set "uniurl="
color 07
title Universal Mode
cls
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
echo.
echo  Universal mode enables you to download from any webpage with playing video. 
echo  eg: youtube and others
echo.
echo --------------------------------------------------------------------------------------------
echo.
set /p uniurl=Paste a page url with playing video: 
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
if %errorlevel% == 1 set uniqual="bv*+ba/b" && goto unidownload
if %errorlevel% == 2 set uniqual="wv*+wa/w" && goto unidownload
if %errorlevel% == 3 goto uniqualselect
if %errorlevel% == 255 goto uni
if "%uniurl%" equ "" goto uni


:uniqualselect
mode con:cols=110 lines=52
set "uniqual="
color 07
title Universal Mode: URL Recieved
cls
echo --------------------------------------------------------------------------------------------------------------
echo                                         Advanced Youtube Client - AYC 
echo.
echo                                              %version%
echo --------------------------------------------------------------------------------------------------------------
echo.
echo  URL: %uniurl%
echo.
%youtube_dl% -F "%uniurl%"
echo.
echo -------------------------------------------------
echo.
echo  Merge two formats using + symbol.
set /p uniqual=Choose ID (green color in the list above): 
if "%uniqual%" equ "" goto uniqualselect


:unidownload
set "try="
set try=%try_count%


:unidownloadtried
set errormode=uni
mode con:cols=60 lines=32
color 0B
title Finger's Crossed! How's the weather?
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Starting Download
echo -------------------
echo.
echo  URL: %uniurl%
echo.
%youtube_dl% %default_config% -f %uniqual% --external-downloader aria2c -o "%loc%\%%(title)s-%%(height)sp-%%(id)s.%%(ext)s" "%uniurl%" && goto downloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto unidownloadtried


:batch
mode con:cols=92 lines=26
set batch_exists_true=0
color 07
title Batch Mode
set "job_name="
cls
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
echo.
echo  Batch Mode allows you to create jobs, add videos to that  job and download it.
echo.
echo  Job URLs are saved and can be resumed by re-entering the same job.
echo.
echo ------------------------------------------
echo.
set /p job_name=Enter Job Name (eg: Songs): 
md "%loc%\%job_name%"
if exist "%loc%\%job_name%\%job_name%.txt" set batch_exists_true=1 && goto batch_is_yt_check
echo.>"%loc%\%job_name%\%job_name%.txt"


:batch_is_yt_confirm
echo.
choice /c yn /n /m "Is this a YouTube Download Job? (Yes/No) "
if %errorlevel% == 1 set youtube=1 && echo "1">"%loc%\%job_name%\is_youtube.txt"
if %errorlevel% == 2 set youtube=0 && echo "0">"%loc%\%job_name%\is_youtube.txt"
if %errorlevel% == 255 goto batch


:batch_is_yt_check
if not exist "%loc%\%job_name%\is_youtube.txt" goto batch_is_yt_confirm
set /p youtube=<"%loc%\%job_name%\is_youtube.txt"
set youtube=%youtube:"=%


:batch_manage
mode con:cols=60 lines=32
color 07
title Now working on %job_name%
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
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
if %errorlevel% == 2 goto batch_add_links
if %errorlevel% == 3 start notepad.exe "%loc%\%job_name%\%job_name%.txt"
if %errorlevel% == 4 goto batch_change_type
if %errorlevel% == 5 goto batch_download
if %errorlevel% == 255 goto batch_manage
goto batch_manage


:batch_add_links
mode con:cols=60 lines=32
color 07
title Enter 0 to go back after adding links.
set "batch_link_tmp="
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Paste each url and press enter, the links will be added to 
echo  your list.
echo.
echo  Enter 0 to Go Back after adding links
echo.
echo --------------------------------------------
echo.


:batch_add_links_added
set /p batch_link_tmp=Paste Link: 
echo.
if "%batch_link_tmp%" equ "0" goto batch_manage
echo %batch_link_tmp%>>"%loc%\%job_name%\%job_name%.txt"
goto batch_add_links_added


:batch_change_type
if %youtube% == 0 set youtube=1 && echo "1">"%loc%\%job_name%\is_youtube.txt" && goto batch_manage
if %youtube% == 1 set youtube=0 && echo "0">"%loc%\%job_name%\is_youtube.txt" && goto batch_manage


:batch_download
mode con:cols=60 lines=32
color 07
title Yay! Hidden Joke!
set "batch_link_tmp="
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
if %youtube% == 1 goto batch_yt_format_selector
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
if %errorlevel% == 1 goto batch_manage
if %errorlevel% == 2 set conf=-f "bv*+ba/b" & set batch_name_end=high
if %errorlevel% == 3 set conf=-f "wv*+wa/w" & set batch_name_end=low
if %errorlevel% == 4 goto batch_custom_format
if %errorlevel% == 255 goto batch_download
set format_chosen=batch
goto batch_ytdownload

:batch_custom_format
mode con:cols=92 lines=26
set "batch_custom_format_url="
color 07
title Pick custom format code
cls
echo --------------------------------------------------------------------------------------------
echo                                Advanced Youtube Client - AYC 
echo.
echo                                     %version%
echo --------------------------------------------------------------------------------------------
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
if "%batch_custom_format_url%" equ "" goto batch_custom_format
if "%batch_custom_format_url%" equ "0" goto batch_download

:batch_custom_format_select
mode con:cols=110 lines=52
set "batch_custom_qual="
title Retrieving all available qualities
color 07
cls
echo --------------------------------------------------------------------------------------------------------------
echo                                         Advanced Youtube Client - AYC 
echo.
echo                                              %version%
echo --------------------------------------------------------------------------------------------------------------
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
if "%batch_custom_qual%" equ "" goto batch_custom_format_select
if "%batch_custom_qual%" equ "0" goto batch_custom_format
set conf=-f %batch_custom_qual%
set batch_name_end=%batch_custom_qual%
set format_chosen=batch
goto batch_ytdownload

:batch_yt_format_selector
mode con:cols=60 lines=32
color 07
title Choose Format
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Working on: %job_name%
echo.
echo   (0) - Go Back
echo.
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
choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 goto batch_manage
if %errorlevel% == 2 set format_chosen=h264
if %errorlevel% == 3 set format_chosen=vp9
if %errorlevel% == 4 set format_chosen=av1
if %errorlevel% == 5 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a] && goto batch_ytdownload
if %errorlevel% == 6 set format_chosen=aud && set conf=--add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k && goto batch_ytdownload
if %errorlevel% == 7 set format_chosen=aud && set conf=--add-metadata -f bestaudio[ext=webm] && goto batch_ytdownload
if %errorlevel% == 255 goto batch_yt_format_selector
goto batch_ytmp4

:batch_ytmp4
mode con:cols=60 lines=32
color 07
title Choose Quality
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Working on: %job_name%
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
if %format_chosen% == vp9  goto batch_choice_vp9
if %format_chosen% == av1  goto batch_choice_av1
echo ------------------------------------------------------------
echo.
choice /c 0123456 /n /m "Enter Choice (0-6): "
if %errorlevel% == 1 goto batch_yt_format_selector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=144]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=360]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=480]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]"
if %errorlevel% == 255 goto batch_ytmp4
goto batch_ytdownload

:batch_choice_vp9
echo ------------------------------------------------------------
echo.
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto batch_yt_format_selector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec=vp9][height<=144]+bestaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec=vp9][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec=vp9][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec=vp9][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec=vp9][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec=vp9][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec=vp9][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec=vp9][height<=2160]+bestaudio[ext=webm]"
if %errorlevel% == 255 goto batch_ytmp4
goto batch_ytdownload

:batch_choice_av1
set errorformat=av1
echo ------------------------------------------------------------
echo.
choice /c 0123456789 /n /m "Enter Choice (0-9): "
if %errorlevel% == 1 goto batch_yt_format_selector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=144]+bestaudio[ext=webm]"
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=360]+bestaudio[ext=webm]"
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=480]+bestaudio[ext=webm]"
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=webm]"
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=webm]"
if %errorlevel% == 8 set conf="-f bestvideo[vcodec^=av01][height<=1440]+bestaudio[ext=webm]"
if %errorlevel% == 9 set conf="-f bestvideo[vcodec^=av01][height<=2160]+bestaudio[ext=webm]"
if %errorlevel% == 10 set conf="-f bestvideo[vcodec^=av01][height<=4320]+bestaudio[ext=webm]"
if %errorlevel% == 255 goto batch_ytmp4
goto batch_ytdownload


:batch_ytdownload
set "try="
set try=%try_count%

if %aria2_status% == 1 set aria2=--external-downloader aria2c
if %youtube% == 0 set aria2=--external-downloader aria2c
if %youtube% == 1 if %aria2_status% == 0 set aria2=--concurrent-fragments 8

if %thumbs_status% == 0 set "thumbs="
if %thumbs_status% == 1 set thumbs=--embed-thumbnail

if %subs_status% == 0 set "subs="
if %subs_status% == 1 set subs=--embed-subs


:batch_ytdownloadtried
set errormode=batch
mode con:cols=60 lines=32
color 0B
title Downloading
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Starting Download
echo -------------------
echo.
if %format_chosen% == h264 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -o "%loc%\%job_name%\%%(title)s-MP4-%%(height)sp-%%(id)s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadsuccess
if %format_chosen% == vp9 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -o "%loc%\%job_name%\%%(title)s-VP9-%%(height)sp-%%(id)s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadsuccess
if %format_chosen% == av1 %youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% --merge-output-format mp4 -o "%loc%\%job_name%\%%(title)s-AV1-%%(height)sp-%%(id)s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadsuccess
if %format_chosen% == aud %youtube_dl% %default_config% %conf% %aria2% -o "%loc%\%job_name%\%%(title)s-%%(id)s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadsuccess
if %format_chosen% == batch %youtube_dl% %default_config% %conf% %aria2% -o "%loc%\%job_name%\%%(title)s-%batch_name_end%-%%(id)s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto downloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto batch_ytdownloadtried


:error
mode con:cols=60 lines=32
color 4F
title Download Failed!
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Download Failed!!!! :-(
echo.
if %errormode% == batch echo  Job: %job_name%
if %errormode% == regular echo  URL: %url%
echo.
echo  Possible problems and solutions:
echo.
if %errorformat% == av1 echo  - If you chose AV1, not all videos are supported by
echo   youtube yet.
echo  - yt-dlp might be out of date. Update it by going 
echo  into Settings, Update yt-dlp.
echo  - If you have an unreliable network, enable rechecks
echo   in Settings.
if %errormode% == batch echo  - You may have entered an invalid job name.
if %errormode% == regular echo  - You may have entered an invalid/private link. These 
if %errormode% == regular echo   aren't supported yet.
if %errormode% == batch echo - One of your links might be failing, rest might have
if %errormode% == batch echo  downloaded successfully.
echo.
echo   If all else fails, report the failing URLs on the 
echo   Sourceforge or GitHub page. 
echo.
if NOT %errormode% == regular echo  Press enter to try again.
if %errormode% == regular echo  Press enter to close this window.
pause>NUL
if %errormode% == batch goto batch
if %errormode% == uni goto uni
if %errormode% == regular goto exit


:downloadsuccess
mode con:cols=60 lines=32
color 2F
title Download Finished
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
if NOT %errormode% == regular echo  Press enter to do it again.
if %errormode% == regular echo  Press enter to close this window.
pause>NUL
if %errormode% == batch goto batch
if %errormode% == uni goto uni
if %errormode% == regular goto exit


:settings
mode con:cols=60 lines=32
color 07
title AYC Settings
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
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
if %errorlevel% == 2 goto settings_change_dir
if %errorlevel% == 3 goto settings_change_defined_try
if %errorlevel% == 4 goto update
if %errorlevel% == 5 goto settings_change_aria2
if %errorlevel% == 6 goto settings_change_thumbs
if %errorlevel% == 7 goto settings_change_subs
if %errorlevel% == 8 goto reset
if %errorlevel% == 255 goto settings


:settings_change_dir
mode con:cols=60 lines=32
color 07
title Change Download Location
cls
set "settings_dir="
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Current download folder is:
echo  %loc%
echo.
echo ----------------------------------------------
echo  Drag and Drop the folder you want AYC to save
echo  it's downloads into the below area.
echo.
echo  Then Press Enter to save.
echo.
echo  Enter 0 to Go Back.
echo ----------------------------------------------
echo.
set /p settings_dir=Drag and Drop here: 
if %settings_dir%p equ p goto settings_change_dir
if %settings_dir% == 0 goto settings
echo "%settings_dir%">"%aycdata%\dir.txt"
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
goto settings


:settings_change_defined_try
mode con:cols=60 lines=32
color 07
title Change recheck attempts
cls
set "settings_try="
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  On unstable connections, playlist/batch download can 
echo  sometimes miss a file and will fail the download.
echo.
echo  The number you set here is the number of times AYC will 
echo  recheck the download to see if any files are missing.
echo.
echo  If it found any, that missing file will be downloaded.
echo ------------------------------------------------------------
echo.
set /p settings_try=No. of Rechecks (Enter to go back): 
if %settings_try%p equ p goto settings
echo "%settings_try%">"%aycdata%\try.txt"
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
goto settings


:update
mode con:cols=60 lines=32
color 07
title Update yt-dlp
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Checking for updates..
%youtube_dl% -U
echo.
echo  Press Enter to go back.
pause>NUL
goto settings


:settings_change_aria2
if %aria2_status% == 0 set aria2_status=1 && echo "1">"%aycdata%\aria2_status.txt" && goto settings
if %aria2_status% == 1 set aria2_status=0 && echo "0">"%aycdata%\aria2_status.txt" && goto settings


:settings_change_thumbs
if %thumbs_status% == 0 set thumbs_status=1 && echo "1">"%aycdata%\thumbs_status.txt" && goto settings
if %thumbs_status% == 1 set thumbs_status=0 && echo "0">"%aycdata%\thumbs_status.txt" && goto settings


:settings_change_subs
if %subs_status% == 0 set subs_status=1 && echo "1">"%aycdata%\subs_status.txt" && goto settings
if %subs_status% == 1 set subs_status=0 && echo "0">"%aycdata%\subs_status.txt" && goto settings


:reset
mode con:cols=60 lines=32
if %version_mismatch% == 0 color 04
if %version_mismatch% == 1 color 02
if %version_mismatch% == 0 title Reset AYC
if %version_mismatch% == 1 title AYC Updated
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
if %version_mismatch% == 0 echo  You are about to reset AYC to it's default settings.
if %version_mismatch% == 0 echo.
if %version_mismatch% == 0 echo  This should fix any issues caused by incorrect or corrupted settings.
if %version_mismatch% == 1 echo  AYC was updated. It is recommended to reset AYC and start
if %version_mismatch% == 1 echo  fresh.
if %version_mismatch% == 1 echo.
if %version_mismatch% == 1 echo  This should fix any issues caused by old settings.
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
if %version_mismatch% == 0 goto reset_normal
if %version_mismatch% == 1 goto reset_version_mismatch


:reset_normal
choice /C 01 /n /m "Choose option (0-1): "
if %errorlevel% == 1 goto settings
goto reset_finish


:reset_version_mismatch
choice /C 01 /n /m "Choose option (0-1): "
if %errorlevel% == 1 echo "%internal_version%">"%aycdata%\external_version.txt" && goto begin
goto reset_finish


:reset_finish
del /q "%aycdata%\firstrun.txt"
del /q "%aycdata%\dir.txt"
del /q "%aycdata%\try.txt"
del /q "%aycdata%\aria2_status.txt"
del /q "%aycdata%\thumbs_status.txt"
del /q "%aycdata%\subs_status.txt"
del /q "%aycdata%\external_version.txt"
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
mode con:cols=60 lines=32
color 07
title You're a curious one..
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo   Advanced Youtube Client - AYC Script [PORTABLE]
echo.
echo   Author           : Adithya S Sekhar
echo.
echo   First Release    : v1.0 (13/Aug/2016)
echo.
echo   Current Release  : %version%
echo.
echo   Released under the MIT License.
echo.
echo   Press Enter to go back.
pause>NUL
goto more


:exit
exit

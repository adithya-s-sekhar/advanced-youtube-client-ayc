:: #####################
:: Don't View in notepad.
:: #####################
:: /--------------------------------------------------/
:: /--------------------------------------------------/
:: /--------------------------------------------------/
:: / Advanced Youtube Client - AYC Script             /
:: / Author          : Adithya S Sekhar               /
:: / First Release   : v1.0 2016-08-13                /
:: / Current Release : v2.99.1 2018-09-02             /
:: / Released under the MIT License.                  /
:: / Please don't modify or redistribute without      /
:: / proper credits.                                  /
:: /--------------------------------------------------/
:: /--------------------------------------------------/
:: /--------------------------------------------------/
@echo off
:begin
md "%appdata%\Advanced Youtube Client - AYC"
set aycdata=%appdata%\Advanced Youtube Client - AYC
set version=v2.99.1 (02/Sep/2018)
title Race to the moon.
if not exist "%aycdata%\cols.txt" goto colsnotexist
if not exist "%aycdata%\lines.txt" goto linesnotexist
set /p cols=<"%aycdata%\cols.txt"
set cols=%cols:"=%
if %cols%1 equ =1 goto colsnotexist
set /p lines=<"%aycdata%\lines.txt"
set lines=%lines:"=%
if %lines%1 equ =1 goto linesnotexist
mode con:cols=%cols% lines=%lines%
if not exist "%aycdata%\dir.txt" goto dirnotexist
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
if not exist "%aycdata%\try.txt" goto trynotexist
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
if %defined_try%p equ =p goto trynotexist
set try_count=0
goto corrupt_check
:colsnotexist
echo "90">"%aycdata%\cols.txt"
goto begin
:linesnotexist
echo "32">"%aycdata%\lines.txt"
goto begin
:dirnotexist
md "%userprofile%\Videos\Advanced Youtube Client - AYC"
echo "%userprofile%\Videos\Advanced Youtube Client - AYC">"%aycdata%\dir.txt"
goto begin
:trynotexist
echo "0">"%aycdata%\try.txt"
goto begin
:corrupt_check
if not exist aria2c.exe goto corrupt
if not exist avcodec-58.dll goto corrupt
if not exist avdevice-58.dll goto corrupt
if not exist avfilter-7.dll goto corrupt
if not exist avformat-58.dll goto corrupt
if not exist avutil-56.dll goto corrupt
if not exist ffmpeg.exe goto corrupt
if not exist ffprobe.exe goto corrupt
if not exist postproc-55.dll goto corrupt
if not exist swresample-3.dll goto corrupt
if not exist swscale-5.dll goto corrupt
if not exist youtube-dl.exe goto corrupt
goto check_parameter
:corrupt
title Please reinstall or read Sources-Readme.txt on SF!
color 4F
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo ------------------------------------------------------------------------------------------
echo.
echo  Some files are missing from your AYC installation. Please reinstall the program!
echo.
pause>NUL
exit
:check_parameter
if %1p equ p goto start
if %1% equ "b" goto batch
if %1% equ "B" goto batch
if %1% equ "u" goto uni
if %1% equ "U" goto uni
echo %1>"%tmp%\tmp.txt"
set /p url=<"%tmp%\tmp.txt"
set url=%url:"=%
goto menu
:start
color 07
set "url="
title It's a different type of downloader.
if not exist unins*.exe title AYC Portable Mode (Default settings applied if a different PC)
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo     Save Kerala - http://bit.ly/ayckeralaflood   Save Nagaland - http://bit.ly/aycnlan
echo ------------------------------------------------------------------------------------------
echo.
echo -------------------------------------------------------
echo.
echo  Enter M for more options.
echo.
echo -------------------------------------------------------
echo.
set /p url=Paste a Youtube Video/Playlist URL or QuickKey: 
if "%url%" equ "" goto start
if "%url%" equ "m" goto more
if "%url%" equ "M" goto more
start AYClient.exe "%url%"
goto start
:menu
title URL Recieved. Choose Download Mode
color 07
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-------------------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo -------------
echo  Choose mode
echo -------------
echo.
echo  0) GO BACK
echo.
echo  1) Download Video+Audio
echo.
echo  2) Download Audio Only
echo.
echo --------------------------
choice /C 012 /n /m "Choose Download mode (0-2): "
if %errorlevel% == 1 exit
if %errorlevel% == 2 goto video
if %errorlevel% == 3 goto audio
if %errorlevel% == 255 goto menu
:video
color 07
title Choose Video Format
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-------------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo ---------------------------------
echo  Choose which Stream to Download
echo ---------------------------------
echo.
echo  0) GO BACK
echo.
echo  1) MP4  -   Video:H264   Audio:AAC  (Default)
echo.
echo  2) WEBM -   Video:VP9    Audio:OPUS (Subject To Availability)
echo.
echo  3) MKV  -   Video:VP9    Audio:AAC  (Subject To Availability)
echo.
echo  4) 3GP  -   Video:MPEG4  Audio:AAC  (Compatible for old phones)
echo.
echo --------------------------
choice /c 01234 /n /m "Enter Option Number (0-4): "
if %errorlevel% == 1 goto menu
if %errorlevel% == 2 goto mp4
if %errorlevel% == 3 goto vp9
if %errorlevel% == 4 goto mkv
if %errorlevel% == 5 goto 3gp
if %errorlevel% == 255 goto video
:mp4
color 07
title Choose MP4 Quality
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-MP4---------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo ----------------
echo  Choose Quality
echo ----------------
echo.
echo  0) GO BACK
echo ---------------------------------------------
echo  1) 240p
echo  2) 360p   (If not available, returns to 240p) 
echo  3) 480p   (If not available, returns to 360p)
echo ---------------------------------------------
echo  4) 720p   (If not available, returns to 480p)
echo  5) 1080p  (If not available, returns to 720p)
echo ---------------------------------------------
echo  6) 2K     (If not available, returns to 1080p)
echo  7) 4K     (If not available, returns to 2K)
echo  8) 8K     (If not available, returns to 4K)
echo.
echo --------------------
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto video
if %errorlevel% == 2 set qual="bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set qual="bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set qual="bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set qual="bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set qual="bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set qual="bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 8 set qual="bestvideo[ext=mp4][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 9 set qual="bestvideo[ext=mp4][height<=4320]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 255 goto mp4
goto download
:vp9
color 07
title Choose VP9 Quality
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-Webm--------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo ----------------
echo  Choose Quality
echo ----------------
echo.
echo  0) GO BACK
echo ---------------------------------------------
echo  1) 240p
echo  2) 360p   (If not available, returns to 240p) 
echo  3) 480p   (If not available, returns to 360p)
echo ---------------------------------------------
echo  4) 720p   (If not available, returns to 480p)
echo  5) 1080p  (If not available, returns to 720p)
echo ---------------------------------------------
echo  6) 2K     (If not available, returns to 1080p)
echo  7) 4K     (If not available, returns to 2K)
echo  8) 8K     (If not available, returns to 4K)
echo.
echo --------------------
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto video
if %errorlevel% == 2 set qual="bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 3 set qual="bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 4 set qual="bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 5 set qual="bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 6 set qual="bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 7 set qual="bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 8 set qual="bestvideo[ext=webm][height<=2160]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 9 set qual="bestvideo[ext=webm][height<=4320]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=2160]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 255 goto vp9
goto download
:mkv
color 07
title Choose MKV Quality
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-MKV---------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo ----------------
echo  Choose Quality
echo ----------------
echo.
echo  0) GO BACK
echo ---------------------------------------------
echo  1) 240p
echo  2) 360p   (If not available, returns to 240p) 
echo  3) 480p   (If not available, returns to 360p)
echo ---------------------------------------------
echo  4) 720p   (If not available, returns to 480p)
echo  5) 1080p  (If not available, returns to 720p)
echo ---------------------------------------------
echo  6) 2K     (If not available, returns to 1080p)
echo  7) 4K     (If not available, returns to 2K)
echo  8) 8K     (If not available, returns to 4K)
echo.
echo --------------------
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto video
if %errorlevel% == 2 set qual="bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set qual="bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set qual="bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set qual="bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set qual="bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set qual="bestvideo[ext=webm][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 8 set qual="bestvideo[ext=webm][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 9 set qual="bestvideo[ext=webm][height<=4320]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 255 goto mkv
goto download
:3gp
color 07
title Choose 3GP Quality
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-3gp---------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo ----------------
echo  Choose Quality
echo ----------------
echo.
echo  0) GO BACK
echo.
echo  1) 240p
echo.
echo  2) 144p
echo.
echo -------------------------
choice /c 012 /n /m "Enter Choice (0-2): "
if %errorlevel% == 1 goto video
if %errorlevel% == 2 set qual=36
if %errorlevel% == 3 set qual=17
if %errorlevel% == 255 goto video
goto download
:audio
color 07
title Choose Audio Format
cls
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Audio-------------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo --------------
echo  Choose Format
echo --------------
echo.
echo  0) GO BACK
echo.
echo  1) MP3 (128K)
echo.
echo  2) M4A (128K)
echo.
echo -------------------
choice /c 012 /n /m "Enter Choice (0-2): "
if %errorlevel% == 1 goto menu
if %errorlevel% == 2 goto mp3
if %errorlevel% == 3 goto audiodownload
if %errorlevel% == 255 goto audio
:download
set "try="
set try=%try_count%
:downloadtried
color 0B
title Downloading
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo ------------------------------------------------------------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
echo.
echo  URL: %url%
echo.
youtube-dl.exe --no-warnings --embed-subs --ignore-errors --retries 16 -f %qual% --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s-%%(height)sp.%%(ext)s" "%url%" && goto downloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto downloadtried
:downloadsuccess
color 2F
title Always thank the bus driver, unless he was the kidnapper
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo ------------------------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
echo  Press ENTER to to close this window.
pause>NUL
goto exit
:audiodownload
set "try="
set try=%try_count%
:audiodownloadtried
color 0B
title Downloading
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Audio-M4A---------------------------------------------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
echo.
echo  URL: %url%
echo.
youtube-dl.exe --no-warnings --ignore-errors --retries 16 -f bestaudio[ext=m4a] --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s.%%(ext)s" "%url%" && goto audiosuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto audiodownloadtried
:audiosuccess
color 2F
title Audio's Done Downloading.... Anyone there?
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo ------------------------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo  Download finished, The audio(s) are saved in:
echo  %loc%
echo.
echo  Press ENTER to close this window.
pause>NUL
goto exit
:mp3
set "try="
set try=%try_count%
:mp3tried
color 0B
title Downloading
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Audio-MP3---------------------------------------------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
echo.
echo  URL: %url%
echo.
youtube-dl.exe --no-warnings --retries 16 --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k --embed-thumbnail --ignore-errors --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s.%%(ext)s" "%url%" && goto songsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto mp3tried
:error
color 4F
title Houston, We have a problem!
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo ------------------------------------------------------------------------------------------
echo.
echo  Download Failed!!!! :-(
echo.
echo  URL: %url%
echo.
echo  Press enter to close this window. 
echo.
echo  This normally happens if WEBM/MKV format doesn't exist.
echo.
echo  TIP: Enable rechecks in settings if you have a bad network.
echo.
echo  If you are facing this issue with all formats, please contact us on our 
echo  Facebook page.
pause>NUL
goto exit
:exit
exit
:songsuccess
color 2F
title Sweet sweet music
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo ------------------------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo  Download Finished, The song(s) are saved in:
echo  %loc%
echo.
echo  Press ENTER to close this window.
pause>NUL
goto exit
:exit
exit
Rem The More Page
:more
color 07
title More Options
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -More-------------------------------------------------------------------------------------
echo.
echo ---------------------------------------------------
echo  0) GO BACK
echo.
echo  1) Universal Mode    [BETA]     QuickKey: U
echo.
echo  2) Batch Download    [BETA]     QuickKey: B
echo.
echo  3) Settings
echo ---------------------------------------------------
echo.
choice /c 0123 /n /m "Enter Choice: "
if %errorlevel% == 1 goto start
if %errorlevel% == 2 start AYClient.exe "u" && goto more
if %errorlevel% == 3 start AYClient.exe "b" && goto more
if %errorlevel% == 4 goto settings
if %errorlevel% == 255 goto more
goto more
:uni
set "uniurl="
color 07
title Playing on the edge. Typical.
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo --------------------------------------------------------------------------------------
echo  Universal mode enables you to download any video/audio from any websites.
echo.
echo  This is an untested (yes) feature just added to this release to be further developed.
echo  It may or may not work!
echo.
echo  Close this window to go back.
echo --------------------------------------------------------------------------------------
echo.
set /p uniurl=Enter a page url with playing video: 
if "%uniurl%" equ "" goto uni
:uniqualselect
set "uniqual="
color 07
title This may or may not work. Read Instructions.
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo  URL: %uniurl%
echo.
youtube-dl.exe -F "%uniurl%"
echo.
set /p uniqual=Choose Format Code (left side on the above list): 
if "%uniqual%" equ "" goto uniqualselect
:unidownload
set "try="
set try=%try_count%
:unidownloadtried
color 0B
title Finger's Crossed! How's the weather?
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
echo.
echo  URL: %uniurl%
echo.
youtube-dl.exe --no-warnings --embed-subs --ignore-errors --retries 16 -f %uniqual% --external-downloader aria2c -o "%loc%\%%(title)s-%%(height)sp.%%(ext)s" "%uniurl%" && goto unidownloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto unierror
goto unidownloadtried
:unidownloadsuccess
color 2F
title I knew it would work!
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo  URL: %uniurl%
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
echo  Woah It worked! Thank you for testing out an AYC Beta feature.
echo  Please share your opinions on our Facebook page.
echo.
echo  Press enter to do it again.
pause>NUL
goto uni
:unierror
color 4F
title Not now Kato!
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo  Download Failed!!!! :-(
echo  URL: %uniurl%
echo.
echo  Don't worry it's completely normal. This is a beta feature which still has it's problems.
echo.
echo  You can try it again to see if it's possible on another try.
echo.
echo  TIP: Enable rechecks in settings if you have a bad network.
echo.
echo  Press enter to try again
pause>NUL
goto uni
:settings
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
set /p cols=<"%aycdata%\cols.txt"
set cols=%cols:"=%
set /p lines=<"%aycdata%\lines.txt"
set lines=%lines:"=%
mode con:cols=%cols% lines=%lines%
color 07
title AYC Settings
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -More-Settings----------------------------------------------------------------------------
echo.
echo -----------------------------------
echo  0) GO BACK
echo.
echo  1) Change Download Folder
echo     Currently: %loc%
echo.
echo  2) No. of Rechecks
echo     Currently: %defined_try%
echo.
echo  3) Change AYC Window Size
echo     Currently: %cols%x%lines%
echo.
echo  4) Automatic Updates (COMING SOON)
echo.
echo  5) Reset AYC
echo.
echo  6) About
echo -----------------------------------
echo.
choice /c 0123456 /n /m "Select Option: "
if %errorlevel% == 1 goto more
if %errorlevel% == 2 goto settings_change_dir
if %errorlevel% == 3 goto settings_change_defined_try
if %errorlevel% == 4 goto settings_change_ayc_size
if %errorlevel% == 5 goto settings
if %errorlevel% == 6 goto reset
if %errorlevel% == 7 goto about
if %errorlevel% == 255 goto settings
:settings_change_dir
color 07
title Change Download Location
cls
set "settings_dir="
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -More-Settings-Change Download Folder-----------------------------------------------------
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
goto settings
:settings_change_defined_try
color 07
title Change recheck attempts
cls
set "settings_try="
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -More-Settings-Change No. of Rechecks-----------------------------------------------------
echo.
echo -----------------------------------------------------
echo  On unstable connections with dropouts, playlist/batch download can sometimes miss a 
echo  download and will show you download failed.
echo.
echo  You can easily restart the download and it will download the remaining files without 
echo  downloading all of them again.
echo.
echo  But this is incovenient at most times.
echo.
echo  The number you set here is the number of times AYC will recheck the download to see if 
echo  any files are missing.
echo.
echo  If it found any, that missing file will be downloaded.
echo -----------------------------------------------------
echo.
set /p settings_try=No. of Rechecks (Enter to go back): 
if %settings_try%p equ p goto settings
echo "%settings_try%">"%aycdata%\try.txt"
goto settings
:settings_change_ayc_size
color 07
title Change AYC window size
cls
set "settings_cols="
set "settings_lines="
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -More-Settings-Change window size---------------------------------------------------------
echo.
echo ---------------------------------------
echo  Current width: %cols% (Default: 90)
echo  Current height: %lines% (Default: 32)
echo.
echo  Leave blank and ENTER to go back.
echo ---------------------------------------
echo.
set /p settings_cols=Enter custom width: 
if %settings_cols%p equ p goto settings
if %settings_cols% == 0 goto settings_change_ayc_size
echo "%settings_cols%">"%aycdata%\cols.txt"
mode con:cols=%settings_cols% lines=%lines%
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -More-Settings-Change window size---------------------------------------------------------
echo.
echo ---------------------------------------
echo  Current width: %settings_cols% (Default: 90)
echo  Current height: %lines% (Default: 32)
echo.
echo  Leave blank and ENTER to go back.
echo ---------------------------------------
echo.
echo Enter custom width: %settings_cols%
echo.
set /p settings_lines=Enter custom height: 
if %settings_lines%p equ p goto settings
if %settings_cols% == 0 goto settings_change_ayc_size
echo "%settings_lines%">"%aycdata%\lines.txt"
mode con:cols=%settings_cols% lines=%settings_lines%
goto settings
:batch
color 07
title Playing on the edge. Typical.
set "job_name="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo -----------------------------------------------------------------
echo.
echo  Batch Mode allows you to create jobs, add videos to that job 
echo  and then download it. Job URLs are saved and can be resumed 
echo  by re-entering the same job.
echo.
echo -----------------------------------------------------------------
echo.
set /p job_name=Enter a name for your Job (eg: Adventure time videos): 
echo.
choice /c yn /n /m "Is this a YouTube Download Job? (Yes/No) "
if %errorlevel% == 1 set youtube=1
if %errorlevel% == 2 set youtube=0
if %errorlevel% == 255 goto batch
md "%loc%\%job_name%"
:batch_manage
color 07
title Now working on %job_name%
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo -------------------------
echo  Job: %job_name%
echo -------------------------
echo.
echo  0) GO BACK
echo.
echo  1) Add Video Links
echo.
echo  2) Open Job File (Delete, View, Add Links through Notepad)
echo.
echo  3) Start Batch Job
echo.
echo --------------------------
choice /c 01234 /n /m "Enter Choice: "
if %errorlevel% == 1 goto batch
if %errorlevel% == 2 goto batch_add_links
if %errorlevel% == 3 start notepad.exe "%loc%\%job_name%\%job_name%.txt"
if %errorlevel% == 4 goto batch_download
if %errorlevel% == 255 goto batch_manage
goto batch_manage
:batch_add_links
color 07
title Link 'em all so that we I don't know where I am going with this joke
set "batch_link_tmp="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo  Paste each url and press enter, the links will be added to your list.
echo.
echo  Enter 0 to Go Back after adding links
echo.
echo --------------------------------------------
:batch_add_links_added
set /p batch_link_tmp=Paste Link: 
echo.
if "%batch_link_tmp%" equ "0" goto batch_manage
echo %batch_link_tmp%>>"%loc%\%job_name%\%job_name%.txt"
goto batch_add_links_added
:batch_download
color 07
title Yay! Hidden Joke!
set "batch_link_tmp="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
if %youtube% == 1 goto batch_youtube
if %youtube% == 0 echo.
echo ---------------------------------
echo  Select Quality
echo ---------------------------------
echo.
echo  0) GO BACK
echo.
echo  1) Highest Quality (Takes longer and needs more bandwidth and space)
echo.
echo  2) Lowest Quality (Faster, smaller but low quality)
echo.
echo ---------------------------------
choice /c 012 /n /m "Choose Quality: "
if %errorlevel% == 1 goto batch_manage
if %errorlevel% == 2 set batch_ytqual=best
if %errorlevel% == 3 set batch_ytqual=worst
if %errorlevel% == 255 goto batch_download
goto batch_ytdownload
:batch_youtube
echo -------------
echo  Choose mode
echo -------------
echo.
echo  0) GO BACK
echo.
echo  1) Download Video+Audio
echo.
echo  2) Download Audio Only
echo.
echo --------------------------
choice /C 012 /n /m "Choose Download mode (0-2): "
if %errorlevel% == 1 batch_manage
if %errorlevel% == 2 goto batch_ytvideo
if %errorlevel% == 3 goto batch_ytaudio
if %errorlevel% == 255 goto batch_download
:batch_ytvideo
color 07
title There's this girl...
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo ---------------------------------
echo  Choose which Stream to Download
echo ---------------------------------
echo.
echo  0) GO BACK
echo.
echo  1) MP4  -   Video:H264   Audio:AAC  (Default)
echo.
echo  2) WEBM -   Video:VP9    Audio:OPUS (Subject To Availability)
echo.
echo  3) MKV  -   Video:VP9    Audio:AAC  (Subject To Availability)
echo.
echo  4) 3GP  -   Video:MPEG4  Audio:AAC  (Compatible for old phones)
echo.
echo --------------------------
choice /c 01234 /n /m "Enter Option Number (0-4): "
if %errorlevel% == 1 goto batch_youtube
if %errorlevel% == 2 goto batch_ytmp4
if %errorlevel% == 3 goto batch_ytvp9
if %errorlevel% == 4 goto batch_ytmkv
if %errorlevel% == 5 goto batch_yt3gp
if %errorlevel% == 255 goto batch_ytvideo
:batch_ytmp4
color 07
title with wings and stuff..
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo ----------------
echo  Choose Quality
echo ----------------
echo.
echo  0) GO BACK
echo ---------------------------------------------
echo  1) 240p
echo  2) 360p   (If not available, returns to 240p) 
echo  3) 480p   (If not available, returns to 360p)
echo ---------------------------------------------
echo  4) 720p   (If not available, returns to 480p)
echo  5) 1080p  (If not available, returns to 720p)
echo ---------------------------------------------
echo  6) 2K     (If not available, returns to 1080p)
echo  7) 4K     (If not available, returns to 2K)
echo  8) 8K     (If not available, returns to 4K)
echo.
echo --------------------
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto batch_ytvideo
if %errorlevel% == 2 set batch_ytqual="bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set batch_ytqual="bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set batch_ytqual="bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set batch_ytqual="bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set batch_ytqual="bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set batch_ytqual="bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 8 set batch_ytqual="bestvideo[ext=mp4][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 9 set batch_ytqual="bestvideo[ext=mp4][height<=4320]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 255 goto batch_ytmp4
goto batch_ytdownload
:batch_ytvp9
color 07
title with tails and stuff, yes two of them..
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo ----------------
echo  Choose Quality
echo ----------------
echo.
echo  0) GO BACK
echo ---------------------------------------------
echo  1) 240p
echo  2) 360p   (If not available, returns to 240p) 
echo  3) 480p   (If not available, returns to 360p)
echo ---------------------------------------------
echo  4) 720p   (If not available, returns to 480p)
echo  5) 1080p  (If not available, returns to 720p)
echo ---------------------------------------------
echo  6) 2K     (If not available, returns to 1080p)
echo  7) 4K     (If not available, returns to 2K)
echo  8) 8K     (If not available, returns to 4K)
echo.
echo --------------------
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto batch_ytvideo
if %errorlevel% == 2 set batch_ytqual="bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 3 set batch_ytqual="bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 4 set batch_ytqual="bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 5 set batch_ytqual="bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 6 set batch_ytqual="bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 7 set batch_ytqual="bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 8 set batch_ytqual="bestvideo[ext=webm][height<=2160]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 9 set batch_ytqual="bestvideo[ext=webm][height<=4320]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=2160]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %errorlevel% == 255 goto batch_ytvp9
goto batch_ytdownload
:batch_ytmkv
color 07
title with a beard...
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo ----------------
echo  Choose Quality
echo ----------------
echo.
echo  0) GO BACK
echo ---------------------------------------------
echo  1) 240p
echo  2) 360p   (If not available, returns to 240p) 
echo  3) 480p   (If not available, returns to 360p)
echo ---------------------------------------------
echo  4) 720p   (If not available, returns to 480p)
echo  5) 1080p  (If not available, returns to 720p)
echo ---------------------------------------------
echo  6) 2K     (If not available, returns to 1080p)
echo  7) 4K     (If not available, returns to 2K)
echo  8) 8K     (If not available, returns to 4K)
echo.
echo --------------------
choice /c 012345678 /n /m "Enter Choice (0-8): "
if %errorlevel% == 1 goto batch_ytvideo
if %errorlevel% == 2 set batch_ytqual="bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set batch_ytqual="bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set batch_ytqual="bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set batch_ytqual="bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set batch_ytqual="bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set batch_ytqual="bestvideo[ext=webm][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 8 set batch_ytqual="bestvideo[ext=webm][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 9 set batch_ytqual="bestvideo[ext=webm][height<=4320]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %errorlevel% == 255 goto batch_ytmkv
goto download
:batch_yt3gp
color 07
title and now she don't want you
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo ----------------
echo  Choose Quality
echo ----------------
echo.
echo  0) GO BACK
echo.
echo  1) 240p
echo.
echo  2) 144p
echo.
echo -------------------------
choice /c 012 /n /m "Enter Choice (0-2): "
if %errorlevel% == 1 goto batch_ytvideo
if %errorlevel% == 2 set batch_ytqual=36
if %errorlevel% == 3 set batch_ytqual=17
if %errorlevel% == 255 goto batch_ytvideo
goto batch_ytdownload
:batch_ytaudio
color 07
title **clap clap**
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo --------------
echo  Choose Format
echo --------------
echo.
echo  0) GO BACK
echo.
echo  1) MP3 (128K)
echo.
echo  2) M4A (128K)
echo.
echo -------------------
choice /c 012 /n /m "Enter Choice (0-2): "
if %errorlevel% == 1 goto batch_download
if %errorlevel% == 2 goto batch_ytmp3
if %errorlevel% == 3 goto batch_ytaudiodownload
if %errorlevel% == 255 goto batch_ytaudio
:batch_ytdownload
set "try="
set try=%try_count%
:batch_ytdownloadtried
color 0B
title she said she's a pokemon 
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo -------------------
echo  Starting Download
echo -------------------
echo.
youtube-dl.exe --no-warnings --embed-subs --ignore-errors --retries 16 -f %batch_ytqual% --external-downloader aria2c -o "%loc%\%job_name%\%%(title)s-%%(height)sp.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto batch_downloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto batch_error
goto batch_ytdownloadtried
:batch_ytaudiodownload
set "try="
set try=%try_count%
:batch_ytaudiodownloadtried
color 0B
title she said she's a pokemon
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo -------------------
echo  Starting Download
echo -------------------
echo.
youtube-dl.exe --no-warnings --ignore-errors --retries 16 -f bestaudio[ext=m4a] --external-downloader aria2c --external-downloader-args "-c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%job_name%\%%(title)s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto batch_downloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto batch_error
goto batch_ytaudiodownloadtried
:batch_ytmp3
set "try="
set try=%try_count%
:batch_ytmp3tried
color 0B
title she said she's a pokemon
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo -------------------
echo  Starting Download
echo -------------------
echo.
youtube-dl.exe --no-warnings --retries 16 --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k --embed-thumbnail --ignore-errors --external-downloader aria2c --external-downloader-args "-c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%job_name%\%%(title)s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto batch_downloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto batch_error
goto batch_ytmp3tried
:batch_error
color 4F
title Not now Kato!
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo  Download Failed!!!! :-(
echo.
echo  Don't worry it's completely normal. This is a beta feature which still has it's problems.
echo.
echo  You can try it again to see if it's possible on another try.
echo.
echo  TIP: Enable rechecks in settings if you have a bad network.
echo.
echo  Press enter to try again
pause>NUL
goto batch
:batch_downloadsuccess
color 2F
title I knew it would work!
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
echo  Woah It worked! Thank you for testing out an AYC Beta feature.
echo  Please share your opinions on our Facebook page.
echo.
echo  Press enter to do it again.
pause>NUL
goto batch
:reset
color 4F
title I've seen things I don't want to remember
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo ------------------------------------------------------------------------------------------
echo.
echo  You are about to reset AYC to it's default settings.
echo.
echo  This should fix any issues caused by incorrect or corrupted settings.
echo.
echo  Press ENTER to reset and exit.
pause>NUL
rd /s /q "%aycdata%"
title Then the sheep said stop touching me
cls
echo.
echo.
echo  AYC Succesfully Reseted.
echo.
timeout /t 2 /nobreak
exit
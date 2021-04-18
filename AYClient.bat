@echo off
goto begin
:dirnotexist
md "%userprofile%\Videos\Advanced Youtube Client - AYC"
echo "%userprofile%\Videos\Advanced Youtube Client - AYC">"%aycdata%\dir.txt"
set loc=%userprofile%\Videos\Advanced Youtube Client - AYC
set loc=%loc:"=%
goto corrupt_check
:begin
mode con:cols=90 lines=32
set version=v2.96.1 (23/Jun/2018)
title Race to the moon.
md "%appdata%\Advanced Youtube Client - AYC"
set aycdata=%appdata%\Advanced Youtube Client - AYC
if not exist "%aycdata%\dir.txt" goto dirnotexist
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
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
title The most actively developed batch script ever.
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo                          Paypal Donations: EMAIL_REMOVED
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
color 0B
title Screen will turn green when download finishes. 
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
goto error
:downloadsuccess
color 2F
title This job's done! Gimme More....
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo                          Paypal Donations: EMAIL_REMOVED
echo ------------------------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
echo  Press ENTER to to download antoher video or close this program.
pause>NUL
if %1p equ p goto exit
:audiodownload
color 0B
title Green Screen will show when download's finished
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
goto error
:audiosuccess
color 2F
title Audio's Done Downloading.... Anyone there?
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo                          Paypal Donations: EMAIL_REMOVED
echo ------------------------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo  Download finished, The audio(s) are saved in:
echo  %loc%
echo.
echo  Press ENTER to to download antoher video or close this program.
pause>NUL
if %1p equ p goto exit
:mp3
color 0B
title Grabbing those MP3's (Hail Napster)
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
youtube-dl.exe --no-warnings --retries 16 --extract-audio --audio-format mp3 --audio-quality 128k --embed-thumbnail --ignore-errors --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s.%%(ext)s" "%url%" && goto songsuccess
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
echo  Press enter to go to the main screen to try again. 
echo.
echo  This normally happens if WEBM/MKV format doesn't exist.
echo  If you are facing this issue with all formats, please contact us on our 
echo  Facebook page.
pause>NUL
if %1p equ p goto exit
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
echo                          Paypal Donations: EMAIL_REMOVED
echo ------------------------------------------------------------------------------------------
echo.
echo  URL: %url%
echo.
echo  Download Finished, The song(s) are saved in:
echo  %loc%
echo.
echo  Press ENTER to to download antoher video or close this program.
pause>NUL
if %1p equ p goto exit
:exit
exit
Rem The More Page
:more
color 07
title You asked for more?
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
echo  Enter 0 to go back.
echo --------------------------------------------------------------------------------------
echo.
set /p uniurl=Enter a page url with playing video: 
if "%uniurl%" equ "" goto uni
if %uniurl% == 0 exit
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
if %uniqual% == 0 goto uni
:unidownload
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
youtube-dl.exe --no-warnings --embed-subs --ignore-errors --retries 16 -f %uniqual% --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s-%%(height)sp.%%(ext)s" "%uniurl%" && goto unidownloadsuccess
goto unierror
:unidownloadsuccess
color 2F
title I knew it would work!
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo                          Paypal Donations: EMAIL_REMOVED
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
echo  Press enter to try again
pause>NUL
goto uni
:settings
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
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
echo  2) Automatic Updates (COMING SOON)
echo -----------------------------------
echo.
choice /c 012 /n /m "Select Option: "
if %errorlevel% == 1 goto more
if %errorlevel% == 2 goto settings_change_dir
if %errorlevel% == 3 goto settings
if %errorlevel% == 255 goto settings
:settings_change_dir
color 07
title Pandora's Box
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
if %settings_dir%1 equ 1 goto settings_change_dir
if "%settings_dir%" equ "0" goto settings
echo "%settings_dir%">"%aycdata%\dir.txt"
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
echo ----------------------------------------------------------------
echo  Batch Mode allows you to create jobs and add videos to that job and then download it.
echo ----------------------------------------------------------------
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
title Playing on the edge. Typical.
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
echo  2) Open Job File (Delete, Add Links through Notepad)
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
title Playing on the edge. Typical.
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
title Playing on the edge. Typical.
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
title Playing on the edge. Typical.
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
title Playing on the edge. Typical.
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
title Choose VP9 Quality
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
title Choose MKV Quality
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
title Choose 3GP Quality
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
title Choose Audio Format
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
color 0B
title Screen will turn green when download finishes. 
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
youtube-dl.exe --no-warnings --embed-subs --ignore-errors --retries 16 -f %batch_ytqual% --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%job_name%\%%(title)s-%%(height)sp.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto batch_downloadsuccess
goto batch_error
:batch_ytaudiodownload
color 0B
title Green Screen will show when download's finished
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
youtube-dl.exe --no-warnings --ignore-errors --retries 16 -f bestaudio[ext=m4a] --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%job_name%\%%(title)s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto batch_downloadsuccess
goto batch_error
:batch_ytmp3
color 0B
title Grabbing those MP3's (Hail Napster)
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
youtube-dl.exe --no-warnings --retries 16 --extract-audio --audio-format mp3 --audio-quality 128k --embed-thumbnail --ignore-errors --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%job_name%\%%(title)s.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto batch_downloadsuccess
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
echo  Press enter to try again
pause>NUL
exit
:batch_downloadsuccess
color 2F
title I knew it would work!
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo                          Paypal Donations: EMAIL_REMOVED
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
exit
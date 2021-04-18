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
set version=v2.94.0 (29/May/2018)
title Advanced Youtube Client - AYC v2.94.0
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
goto start
:corrupt
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
:start
color 07
set "url="
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
set /p url=Paste a Youtube Video/Playlist URL to start: 
if "%url%" equ "" goto start
if "%url%" equ "m" goto more
if "%url%" equ "M" goto more
:menu
color 0F
set "dlmode="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-------------------------------------------------------------------------------------
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
set /p dlmode=Enter Download mode (0-2): 
if "%dlmode%" equ "" goto menu
if %dlmode% == 1 goto video
if %dlmode% == 2 goto audio
if %dlmode% GTR 2 goto menu
if %dlmode% == 0 goto start
:video
color 0F
set "stream="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-------------------------------------------------------------------------------
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
set /p stream=Enter Option Number (0-4): 
if "%stream%" equ "" goto video
if %stream% == 1 goto mp4
if %stream% == 2 goto vp9
if %stream% == 3 goto mkv
if %stream% == 4 goto 3gp
if %stream% GTR 4 goto video
if %stream% == 0 goto menu
:mp4
color 0F
set "qual="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-MP4---------------------------------------------------------------------------
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
set /p qual=Enter Choice (0-8): 
if "%qual%" equ "" goto mp4
if %qual% == 1 set qual="bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %qual% == 2 set qual="bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %qual% == 3 set qual="bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %qual% == 4 set qual="bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %qual% == 5 set qual="bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %qual% == 6 set qual="bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %qual% == 7 set qual="bestvideo[ext=mp4][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %qual% == 8 set qual="bestvideo[ext=mp4][height<=4320]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=240]+bestaudio[ext=m4a]"
if %qual% GTR 8 goto mp4
if %qual% == 0 goto video
goto download
:vp9
color 0F
set "qual="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-Webm--------------------------------------------------------------------------
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
set /p qual=Enter Choice (0-8): 
if "%qual%" equ "" goto vp9
if %qual% == 1 set qual="bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %qual% == 2 set qual="bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %qual% == 3 set qual="bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %qual% == 4 set qual="bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %qual% == 5 set qual="bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %qual% == 6 set qual="bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %qual% == 7 set qual="bestvideo[ext=webm][height<=2160]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %qual% == 8 set qual="bestvideo[ext=webm][height<=4320]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=2160]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=240]+bestaudio[ext=webm]"
if %qual% GTR 8 goto vp9
if %qual% == 0 goto video
goto download
:mkv
color 0F
set "qual="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-MKV---------------------------------------------------------------------------
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
set /p qual=Enter Choice (0-8): 
if "%qual%" equ "" goto mkv
if %qual% == 1 set qual="bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %qual% == 2 set qual="bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %qual% == 3 set qual="bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %qual% == 4 set qual="bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %qual% == 5 set qual="bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %qual% == 6 set qual="bestvideo[ext=webm][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %qual% == 7 set qual="bestvideo[ext=webm][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %qual% == 8 set qual="bestvideo[ext=webm][height<=4320]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=360]+bestaudio[ext=m4a]/bestvideo[ext=webm][height<=240]+bestaudio[ext=m4a]"
if %qual% GTR 8 goto mkv
if %qual% == 0 goto video
goto download
:3gp
color 0F
set "gpq="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-3gp---------------------------------------------------------------------------
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
set /p gpq=Enter Choice (1-2): 
if "%gpq%" equ "" goto 3gp
if %gpq% == 1 set qual=36
if %gpq% == 2 set qual=17
if %gpq% GTR 2 goto 3gp
if %gpq% == 0 goto video
goto download
:audio
color 0F
set "fmt="
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Audio-------------------------------------------------------------------------------
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
set /p fmt=Enter Choice (1-2): 
if "%fmt%" equ "" goto audio
if %fmt% == 1 goto mp3
if %fmt% == 2 goto audiodownload
if %fmt% GTR 2 goto audio
if %fmt% == 0 goto menu
goto audiodownload
:download
color 0B
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
youtube-dl.exe --no-warnings --embed-subs --ignore-errors --retries 16 -f %qual% --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s-%%(height)sp.%%(ext)s" "%url%" && goto downloadsuccess
goto error
:downloadsuccess
color 2F
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo                          Paypal Donations: EMAIL_REMOVED
echo ------------------------------------------------------------------------------------------
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
echo  Press ENTER to to download antoher video or close this program.
pause>NUL
goto start
:audiodownload
color 0B
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
youtube-dl.exe --no-warnings --ignore-errors --retries 16 -f bestaudio[ext=m4a] --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s.%%(ext)s" "%url%" && goto audiosuccess
goto error
:audiosuccess
color 2F
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo                          Paypal Donations: EMAIL_REMOVED
echo ------------------------------------------------------------------------------------------
echo.
echo  Download finished, The audio(s) are saved in:
echo  %loc%
echo.
echo  Press ENTER to to download antoher video or close this program.
pause>NUL
goto start
:mp3
color 0B
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
youtube-dl.exe --no-warnings --retries 16 --extract-audio --audio-format mp3 --audio-quality 128k --embed-thumbnail --ignore-errors --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s.%%(ext)s" "%url%" && goto songsuccess
:error
color 4F
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo ------------------------------------------------------------------------------------------
echo.
echo  Download Failed!!!! :-(
echo.
echo  Press enter to go to the main screen to try again. 
echo.
echo  This normally happens if WEBM/MKV format doesn't exist.
echo  If you are facing this issue with all formats, please contact us on our 
echo  Facebook page.
pause>NUL
goto start
:exit
exit
:songsuccess
color 2F
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo                          Paypal Donations: EMAIL_REMOVED
echo ------------------------------------------------------------------------------------------
echo.
echo  Download Finished, The song(s) are saved in:
echo  %loc%
echo.
echo  Press ENTER to to download antoher video or close this program.
pause>NUL
goto start
:exit
exit
Rem The More Page
:more
set "morechoice="
color 07
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
echo  1) Universal Mode    [BETA]
echo.
echo  2) Multi Mode        [Coming Soon]
echo.
echo  3) Batch Download    [Coming Soon]
echo.
echo  4) Settings
echo ---------------------------------------------------
echo.
set /p morechoice=Select Option: 
if "%morechoice%" equ "" goto more
if %morechoice% == 0 goto begin
if %morechoice% == 1 goto uni
if %morechoice% == 2 goto more
if %morechoice% == 3 goto more
if %morechoice% == 4 goto settings
if %morechoice% GTR 4 goto more
pause>NUL
:uni
set "uniurl="
color 07
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
if %uniurl% == 0 goto more
:uniqualselect
set "uniqual="
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
youtube-dl.exe -F "%uniurl%"
echo.
set /p uniqual=Choose Format Code (left side on the above list): 
if "%uniqual%" equ "" goto uniqualselect
if %uniqual% == 0 goto uni
:unidownload
color 0B
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
youtube-dl.exe --no-warnings --embed-subs --ignore-errors --retries 16 -f %uniqual% --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s-%%(height)sp.%%(ext)s" "%uniurl%" && goto unidownloadsuccess
goto unierror
:unidownloadsuccess
color 2F
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
goto uni
:unierror
color 4F
cls
echo.
echo ------------------------------------------------------------------------------------------
echo                     Advanced Youtube Client - AYC %version%
echo.
echo -------------------------------------- BETA FEATURE --------------------------------------
echo.
echo  Download Failed!!!! :-(
echo  Don't worry it's completely normal. This is a beta feature which still has it's problems.
echo.
echo  You can try it again to see if it's possible on another try.
echo.
echo  Press enter to try again
pause>NUL
goto uni
:settings
set "settings_choice="
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
color 07
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
echo.
echo  2) Automatic Updates (COMING SOON)
echo -----------------------------------
echo.
set /p settings_choice=Select Option (0-1): 
if "%settings_choice%" equ "" goto settings
if %settings_choice% == 0 goto more
if %settings_choice% == 1 goto settings_change_dir
if %settings_choice% GTR 1 goto settings
:settings_change_dir
color 07
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
if %settings_dir% == 0 goto settings
echo "%settings_dir%">"%aycdata%\dir.txt"
goto settings
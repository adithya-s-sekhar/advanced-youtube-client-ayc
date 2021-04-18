@echo off
mode con:cols=80 lines=30
set version=v2.61.0 (27/Mar/2018)
title Advanced Youtube Client - AYC v2.60.0
md "%userprofile%\Videos\Advanced Youtube Client - AYC"
set loc=%userprofile%\Videos\Advanced Youtube Client - AYC
:start
color 07
set "url="
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo                  Paypal Donations: EMAIL_REMOVED
echo --------------------------------------------------------------------------------
echo.
echo -------------------------------------------------------
echo.
echo  Downloaded files are saved in your 'My Videos' folder.
echo.
echo -------------------------------------------------------
echo.
set /p url=Paste a Youtube Video/Playlist URL to start: 
if "%url%" equ "" goto start
:menu
color 07
set "dlmode="
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo -Mode---------------------------------------------------------------------------
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
color 07
set "stream="
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video---------------------------------------------------------------------
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
color 07
set "qual="
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-MP4-----------------------------------------------------------------
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
color 07
set "qual="
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-WEBM-----------------------------------------------------------------
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
color 07
set "qual="
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-MKV-----------------------------------------------------------------
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
color 07
set "gpq="
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Video-3GP-----------------------------------------------------------------
echo.
echo ----------------
echo  Choose Quality
echo ----------------
echo.
echo  0) GO BACK
echo.
echo  1) 240p (Recommended)
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
color 07
set "fmt="
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo -Mode-Audio---------------------------------------------------------------------
echo.
echo --------------
echo  Choose Format
echo --------------
echo.
echo  0) GO BACK
echo.
echo  1) MP3 (192K)
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
color 07
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo --------------------------------------------------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
echo.
youtube-dl --no-warnings --embed-subs --ignore-errors --retries 16 -f %qual% --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s-%%(height)sp.%%(ext)s" "%url%" && goto downloadsuccess
:error
color 47
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo --------------------------------------------------------------------------------
echo.
echo  Download Failed!!!! :-(
echo.
echo  Press enter to goto the main screen to try again. 
echo.
echo  This normally happens if WEBM/MKV format doesn't exist.
echo  If you are facing this issue with all formats, please contact us on our 
echo  Facebook page.
pause>NUL
goto start
:exit
exit
:downloadsuccess
color 27
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo                 Paypal Donations: EMAIL_REMOVED
echo --------------------------------------------------------------------------------
echo.
echo  Download Finished, The files are saved in Your 'My Videos' Folder.
echo.
echo  Press ENTER to to download antoher video or close this program.
pause>NUL
goto start
:audiodownload
color 07
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo -Audio-M4A----------------------------------------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
echo.
youtube-dl --no-warnings --ignore-errors --retries 16 -f bestaudio[ext=m4a] --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s.%%(ext)s" "%url%" && goto audiosuccess
:error
color 47
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo --------------------------------------------------------------------------------
echo.
echo  Download Failed!!!! :-(
echo.
echo  Press enter to goto the main screen to try again. 
echo.
echo  This normally happens if WEBM/MKV format doesn't exist.
echo  If you are facing this issue with all formats, please contact us on our 
echo  Facebook page.
pause>NUL
goto start
:exit
exit
:audiosuccess
color 27
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo                  Paypal Donations: EMAIL_REMOVED
echo --------------------------------------------------------------------------------
echo.
echo  Download finished, The audio(s) are saved in Your 'My Videos' Folder.
echo.
echo  Press ENTER to to download antoher video or close this program.
pause>NUL
goto start
:mp3
color 07
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo -Audio-MP3----------------------------------------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
echo.
youtube-dl --no-warnings --retries 16 --extract-audio --audio-format mp3 --audio-quality 192k --embed-thumbnail --ignore-errors --external-downloader aria2c --external-downloader-args "--file-allocation=none -c -j 8 -s 8 -x 8 -k 1M" -o "%loc%\%%(title)s.%%(ext)s" "%url%" && goto songsuccess
:error
color 47
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo --------------------------------------------------------------------------------
echo.
echo  Download Failed!!!! :-(
echo.
echo  Press enter to goto the main screen to try again. 
echo.
echo  This normally happens if WEBM/MKV format doesn't exist.
echo  If you are facing this issue with all formats, please contact us on our 
echo  Facebook page.
pause>NUL
goto start
:exit
exit
:songsuccess
color 27
cls
echo.
echo --------------------------------------------------------------------------------
echo               Advanced Youtube Client - AYC %version%
echo.
echo                  Paypal Donations: EMAIL_REMOVED
echo --------------------------------------------------------------------------------
echo.
echo  Download Finished, The song(s) are saved in Your 'My Videos' Folder.
echo.
echo  Press ENTER to to download antoher video or close this program.
pause>NUL
goto start
:exit
exit
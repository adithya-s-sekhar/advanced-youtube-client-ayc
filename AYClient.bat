@echo off
ayc-info.exe welcome.vbs
md "%userprofile%\Videos\Advanced Youtube Client - AYC"
set loc=%userprofile%\Videos\Advanced Youtube Client - AYC
set url=
set dlmode=
set stream=
set qual=
set fmt=
:start
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo  Downloaded files are saved in your 'My Videos' folder
echo.
set /p url=Paste a Youtube Video/Playlist URL to start: 
if "%url%" equ "" goto start
:menu
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo -------------
echo  Choose mode
echo -------------
echo  1) Download Video+Audio
echo  2) Download Audio Only
echo.
set /p dlmode=Enter Download mode (1-2): 
if "%dlmode%" equ "" goto menu
if %dlmode% == 1 goto video
if %dlmode% == 2 goto audio
if %dlmode% GTR 2 goto menu
if %dlmode% LSS 1 goto menu
:video
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo ---------------------------------
echo  Choose which Stream to Download
echo ---------------------------------
echo.
echo  1) MP4 - H264 (Default)
echo  2) WEBM - VP9 (Smaller but less compatible)
echo  3) 3GP - MPEG 4 (Compatible for old phones)
echo.
set /p stream=Enter Option Number (1-3): 
if "%stream%" equ "" goto video
if %stream% == 1 goto mp4
if %stream% == 2 goto vp9
if %stream% == 3 goto 3gp
if %stream% GTR 2 goto video
if %stream% LSS 1 goto video
:mp4
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo ----------------
echo  Choose Quality
echo ----------------
echo  1) 360p 
echo  2) 480p (If not available, returns to 360p)
echo  3) 720p (If not available, returns to 480p)
echo  4) 1080p (If not available, returns to 720p)
echo  5) 2K (If not available, returns to 1080p)
echo  6) 4K (If not available, returns to 2K)
echo.
set /p qual=Enter Choice (1-6): 
if "%qual%" equ "" goto mp4
if %qual% == 1 set qual="bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]"
if %qual% == 2 set qual="bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]"
if %qual% == 3 set qual="bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]"
if %qual% == 4 set qual="bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]"
if %qual% == 5 set qual="bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]"
if %qual% == 6 set qual="bestvideo[ext=mp4][height<=2160]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1440]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]/bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]"
if %stream% GTR 6 goto mp4
if %stream% LSS 1 goto mp4
goto download
:vp9
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo ----------------
echo  Choose Quality
echo ----------------
echo  1) 360p 
echo  2) 480p (If not available, returns to 360p)
echo  3) 720p (If not available, returns to 480p)
echo  4) 1080p (If not available, returns to 720p)
echo  5) 2K (If not available, returns to 1080p)
echo  6) 4K (If not available, returns to 2K)
echo.
set /p qual=Enter Choice (1-6): 
if "%qual%" equ "" goto vp9
if %qual% == 1 set qual="bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]"
if %qual% == 2 set qual="bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]"
if %qual% == 3 set qual="bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]"
if %qual% == 4 set qual="bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]"
if %qual% == 5 set qual="bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]"
if %qual% == 6 set qual="bestvideo[ext=webm][height<=2160]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1440]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=480]+bestaudio[ext=webm]/bestvideo[ext=webm][height<=360]+bestaudio[ext=webm]"
if %stream% GTR 6 goto vp9
if %stream% LSS 1 goto vp9
goto download
:3gp
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo ----------------
echo  Choose Quality
echo ----------------
echo  1) 240p (Recommended)
echo  2) 144p
echo.
set /p qual=Enter Choice (1-2): 
if "%qual%" equ "" goto 3gp
if %qual% == 1 set qual=36
if %qual% == 2 set qual=17
goto download
:audio
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo --------------
echo  Choose Format
echo --------------
echo.
echo  1) MP3 (External)
echo  2) M4A
set /p fmt=Enter Choice (1-2): 
if "%fmt%" equ "" goto audio
if %fmt% == 1 goto mp3
if %fmt% == 2 goto audiodownload
if %stream% GTR 2 goto audio
if %stream% LSS 1 goto audio
goto audiodownload
:download
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
youtube-dl --ignore-errors -f %qual% --external-downloader aria2c --external-downloader-args "-x 8 -s 8 -k 1M" -o "%loc%\%%(title)s-%%(height)sp.%%(ext)s" "%url%"
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo  Your download is Finished, The files are saved in Your Videos Folder
pause>NUL
goto exit
:audiodownload
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
youtube-dl --ignore-errors -f bestaudio[ext=m4a] --external-downloader aria2c --external-downloader-args "-x 8 -s 8 -k 1M" -o "%loc%\%%(title)s.%%(ext)s" "%url%"
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo  Your download is Finished, The files are saved in Your Videos Folder
pause>NUL
goto exit
:mp3
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo -------------------
echo  Starting Download
echo -------------------
echo.
youtube-dl --audio-format mp3 --audio-quality 128k --embed-thumbnail --restrict-filenames --ignore-errors --external-downloader aria2c --external-downloader-args "-x 8 -s 8 -k 1M" -o "%loc%\%%(title)s.%%(ext)s" "%url%"
cls
echo.
echo --------------------------------------------------------------------------------
echo                          Advanced Youtube Client - AYC v2.1
echo --------------------------------------------------------------------------------
echo.
echo  Your download has finished, The files are saved in Your Videos Folder
pause>NUL
goto exit
:exit
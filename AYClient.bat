@echo off
:start
md "%userprofile%\Documents\Advanced Youtube Client - AYC"
set loc=%userprofile%\Documents\Advanced Youtube Client - AYC
set video=%random%
set audio=%random%
set tmp=%random%
set fix=%random%
title Advanced Youtube Client - AYC
cls
echo.
echo                           Advanced Youtube Client - AYC v1.1
echo.
echo.
set /p url=Enter Youtube video URL to get started: 
cls
echo.
echo                           Select Output Type
echo.
echo 1) Video + Audio
echo 2) Video Only
echo 3) Audio Only
echo.
set /p type=Enter Output Type(1-3): 
echo.
set /p file=Enter a Name for your Output File: 
if %type%==1 goto va
if %type%==2 goto v
if %type%==3 goto a
:va
echo.
echo                           Select Output Quality
echo.
echo 1) 1080p
echo 2) 720p
echo 3) 480p
echo 4) 360p
echo 5) 240p
echo 6) 144p
echo.
set /p qual=Enter Output Quality(1-6): 
if %qual%==1 goto 1080pva
if %qual%==2 goto 720pva
if %qual%==3 goto 480pva
if %qual%==4 goto 360pva
if %qual%==5 goto 240pva
if %qual%==6 goto 144pva
:1080pva
cls
yt -f 137 -o "%loc%\%video%.mp4" "%url%"
if exist "%loc%\%video%.mp4" (goto 1080pva2) else (goto va)
:1080pva2
yt -f 140 -o "%loc%\%audio%.m4a" "%url%"
mux -i "%loc%\%video%.mp4" -vcodec copy "%loc%\%fix%.mp4"
mux -i "%loc%\%fix%.mp4" -i "%loc%\%audio%.m4a" -vcodec copy -acodec copy "%loc%\%tmp%.mp4"
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:720pva
cls
yt -f 22 -o "%loc%\%tmp%.mp4" "%url%"
if exist "%loc%\%tmp%.mp4" (goto 720pva2) else (goto va)
:720pva2
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:480pva
cls
yt -f 135 -o "%loc%\%video%.mp4" "%url%"
if exist "%loc%\%video%.mp4" (goto 480pva2) else (goto va)
:480pva2
yt -f 140 -o "%loc%\%audio%.m4a" "%url%"
mux -i "%loc%\%video%.mp4" -vcodec copy "%loc%\%fix%.mp4"
mux -i "%loc%\%fix%.mp4" -i "%loc%\%audio%.m4a" -vcodec copy -acodec copy "%loc%\%tmp%.mp4"
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:360pva
cls
yt -f 18 -o "%loc%\%tmp%.mp4" "%url%"
if exist "%loc%\%tmp%.mp4" (goto 360pva2) else (goto va)
:360pva2
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:240pva
cls
yt -f 133 -o "%loc%\%video%.mp4" "%url%"
if exist "%loc%\%video%.mp4" (goto 240pva2) else (goto va)
:240pva2
yt -f 140 -o "%loc%\%audio%.m4a" "%url%"
mux -i "%loc%\%video%.mp4" -vcodec copy "%loc%\%fix%.mp4"
mux -i "%loc%\%fix%.mp4" -i "%loc%\%audio%.m4a" -vcodec copy -acodec copy "%loc%\%tmp%.mp4"
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:144pva
cls
yt -f 160 -o "%loc%\%video%.mp4" "%url%"
if exist "%loc%\%video%.mp4" (goto 144pva2) else (goto va)
:144pva2
yt -f 140 -o "%loc%\%audio%.m4a" "%url%"
mux -i "%loc%\%video%.mp4" -vcodec copy "%loc%\%fix%.mp4"
mux -i "%loc%\%fix%.mp4" -i "%loc%\%audio%.m4a" -vcodec copy -acodec copy "%loc%\%tmp%.mp4"
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:v
echo.
echo                           Select Output Quality
echo.
echo 1) 1080p
echo 2) 720p
echo 3) 480p
echo 4) 360p
echo 5) 240p
echo 6) 144p
echo.
set /p qual=Enter Output Quality(1-6): 
if %qual%==1 goto 1080pv
if %qual%==2 goto 720pv
if %qual%==3 goto 480pv
if %qual%==4 goto 360pv
if %qual%==5 goto 240pv
if %qual%==6 goto 144pv
:1080pv
cls
yt -f 137 -o "%loc%\%video%.mp4" "%url%"
if exist "%loc%\%video%.mp4" (goto 1080pv2) else (goto v)
:1080pv2
mux -i "%loc%\%video%.mp4" -c copy "%loc%\%tmp%.mp4"
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:720pv
cls
yt -f 22 -o "%loc%\%tmp%.mp4" "%url%"
if exist "%loc%\%tmp%.mp4" (goto 720pv2) else (goto v)
:720pv2
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:480pv
cls
yt -f 135 -o "%loc%\%video%.mp4" "%url%"
if exist "%loc%\%video%.mp4" (goto 480pv2) else (goto v)
:480pv2
mux -i "%loc%\%video%.mp4" -c copy "%loc%\%tmp%.mp4"
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:360pv
cls
yt -f 18 -o "%loc%\%tmp%.mp4" "%url%"
if exist "%loc%\%tmp%.mp4" (goto 360pv2) else (goto v)
:360pv2
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:240pv
cls
yt -f 133 -o "%loc%\%video%.mp4" "%url%"
if exist "%loc%\%video%.mp4" (goto 240pv2) else (goto v)
:240pv2
mux -i "%loc%\%video%.mp4" -c copy "%loc%\%tmp%.mp4"
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:144pv
cls
yt -f 160 -o "%loc%\%video%.mp4" "%url%"
if exist "%loc%\%video%.mp4" (goto 144pv2) else (goto v)
:144pv2
mux -i "%loc%\%video%.mp4" -c copy "%loc%\%tmp%.mp4"
repack -add "%loc%\%tmp%.mp4" -itags tool="Advanced Youtube Client v1.0" -new "%loc%\%file%.mp4"
if exist "%loc%\%file%.mp4" (goto finish) else (goto error)
:a
echo.
echo                           Select Output Format
echo.
echo 1) MP3 - 128K
echo 2) MP3 - 320K
echo 3) M4A - 128K
echo.
set /p qual=Enter Output Format(1-3): 
if %qual%==1 goto 128k
if %qual%==2 goto 320k
if %qual%==3 goto m128k
:128k
cls
yt -f 140 -o "%loc%\%tmp%.m4a" "%url%"
if exist "%loc%\%tmp%.m4a" (goto 128k2) else (goto error)
:128k2
mux -i "%loc%\%tmp%.m4a" -ab 128k "%loc%\%file%.mp3"
if exist "%loc%\%file%.mp3" (goto finish) else (goto error)
:320k
cls
yt -f 140 -o "%loc%\%tmp%.m4a" "%url%"
if exist "%loc%\%tmp%.m4a" (goto 320k2) else (goto error)
:320k2
mux -i "%loc%\%tmp%.m4a" -ab 320k "%loc%\%file%.mp3"
if exist "%loc%\%file%.mp3" (goto finish) else (goto error)
pause
:m128k
cls
yt -f 140 -o "%loc%\%tmp%.m4a" "%url%"
if exist "%loc%\%tmp%.m4a" (goto m128k2) else (goto error)
:m128k2
mux -i "%loc%\%tmp%.m4a" -c copy "%loc%\%file%.m4a"
if exist "%loc%\%file%.m4a" (goto finish) else (goto error)
:finish
del "%loc%\%tmp%.mp4"
del "%loc%\%video%.mp4"
del "%loc%\%audio%.m4a"
del "%loc%\%fix%.mp4"
del "%loc%\%tmp%.m4a"
cls
echo.
echo                           Advanced Youtube Client - AYC v1.1
echo.
echo Your Download has been Finished. Press enter to open your File Location.
pause>NUL
start explorer.exe "%loc%"
exit
:error
del "%loc%\%tmp%.mp4"
del "%loc%\%video%.mp4"
del "%loc%\%audio%.m4a"
del "%loc%\%fix%.mp4"
del "%loc%\%tmp%.m4a"
cls
echo.
echo Some error occured, please try again! :-(
echo.
echo Press Enter to start over.
echo.
pause>NUL
goto start

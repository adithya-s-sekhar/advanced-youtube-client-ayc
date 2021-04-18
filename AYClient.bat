@echo off
set version=v3.1 (22/Nov/2020)


:: /--------------------------------------------------/
:: /--------------------------------------------------/
:: /--------------------------------------------------/
:: / Advanced Youtube Client - AYC Script             /
:: / Author          : Adithya S Sekhar               /
:: / First Release   : v1.0 (13/Aug/2016)          /
:: / Current Release : v3.1 (22/Nov/2020)          /
:: / Released under the MIT License.                  /
:: / Please don't modify or redistribute without      /
:: / proper credits.                                  /
:: /--------------------------------------------------/
:: /--------------------------------------------------/
:: /--------------------------------------------------/


:begin
md "%appdata%\Advanced Youtube Client - AYC"
set aycdata=%appdata%\Advanced Youtube Client - AYC
if not exist "%aycdata%\dir.txt" goto dirnotexist
set /p loc=<"%aycdata%\dir.txt"
set loc=%loc:"=%
if not exist "%aycdata%\try.txt" goto trynotexist
set /p defined_try=<"%aycdata%\try.txt"
set defined_try=%defined_try:"=%
if %defined_try%p equ =p goto trynotexist
set try_count=0
goto check_parameter


:dirnotexist
md "%userprofile%\Videos\Advanced Youtube Client - AYC"
echo "%userprofile%\Videos\Advanced Youtube Client - AYC">"%aycdata%\dir.txt"
goto begin


:trynotexist
echo "0">"%aycdata%\try.txt"
goto begin


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
mode con:cols=92 lines=26
color 07
set "url="
title A different type of downloader
if not exist unins*.exe title AYC Portable Mode (Default settings applied if a different PC)
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


:menu
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
echo ---------------
echo  Video + Audio
echo ---------------
echo   (1) - 360p   (If not available, returns to 240p)
echo   (2) - 480p   (If not available, returns to 360p)
echo   (3) - 720p   (If not available, returns to 480p)
echo   (4) - 1080p  (If not available, returns to 720p)
echo   (5) - 1440p  (If not available, returns to 1080p)
echo   (6) - 4K     (If not available, returns to 1440p)
echo   (7) - 8K     (If not available, returns to 4K)
echo --------------
echo   Audio Only
echo --------------
echo   (8) - M4A 128Kb/s
echo   (9) - MP3 128Kb/s
echo -------------------
choice /c 123456789 /n /m "Enter Choice (1-9): "
if %errorlevel% == 1 set conf="-f bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]"
if %errorlevel% == 2 set conf="-f bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[height<=1440]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set conf="-f bestvideo[height<=2160]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set conf="-f bestvideo[height<=4320]+bestaudio[ext=m4a]"
if %errorlevel% == 8 set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a]
if %errorlevel% == 9 set conf=--add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k
if %errorlevel% == 255 goto menu
goto download


:download
set "try="
set try=%try_count%


:downloadtried
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
youtube-dl.exe --ignore-errors --no-warnings %conf% -o "%loc%\%%(title)s-%%(height)sp.%%(ext)s" "%url%" && goto downloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto error
goto downloadtried


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
echo  URL: %url%
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
echo  Press ENTER to to close this window.
pause>NUL
goto exit


:error
mode con:cols=60 lines=32
color 4F
title Houston, We have a problem!
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Download Failed!!!! :-(
echo.
echo  URL: %url%
echo.
echo  Press enter to close this window.
echo.
echo  Choose a different format or quality.
echo.
echo  TIP: Enable rechecks in settings if you have a bad network.
echo.
pause>NUL
goto exit


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
echo  0) GO BACK
echo.
echo  1) Universal Mode     QuickKey: U
echo.
echo  2) Batch Mode         QuickKey: B
echo.
echo  3) Settings
echo.
echo  4) About
echo.
echo -------------------
choice /c 01234 /n /m "Enter Choice (0-4): "
if %errorlevel% == 1 goto start
if %errorlevel% == 2 start AYClient.bat "u" && goto more
if %errorlevel% == 3 start AYClient.bat "b" && goto more
if %errorlevel% == 4 goto settings
if %errorlevel% == 5 goto about
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
set /p uniurl=Enter a page url with playing video: 
if "%uniurl%" equ "" goto uni


:uniqualselect
mode con:cols=110 lines=42
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
youtube-dl.exe -F "%uniurl%"
echo.
echo -------------------------------------------------
set /p uniqual=Choose Format Code (left side on the above list, use + symbol to merge two):
if "%uniqual%" equ "" goto uniqualselect


:unidownload
set "try="
set try=%try_count%


:unidownloadtried
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
youtube-dl.exe --ignore-errors -f %uniqual% -o "%loc%\%%(title)s-%%(height)sp.%%(ext)s" "%uniurl%" && goto unidownloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto unierror
goto unidownloadtried


:unidownloadsuccess
mode con:cols=60 lines=32
color 2F
title Download Finished!
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  URL: %uniurl%
echo.
echo  Download Finished, The files are saved in:
echo  %loc%
echo.
echo  Press enter to do it again.
pause>NUL
goto uni


:unierror
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
echo  URL: %uniurl%
echo.
echo  TIP: Enable rechecks in settings if you have a bad network.
echo.
echo  Press enter to try again
pause>NUL
goto uni


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
echo  Job URLs are saved and can be resumed by re-entering the same job.
echo.
set /p job_name=Enter Job Name(eg: Adventure time videos): 
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
echo  0) GO BACK
echo.
echo  1) Add Video Links
echo.
echo  2) Open Job File (Delete, View, Add Links through Notepad)
echo.
if %batch_exists_true% == 1 echo  3) Resume Batch Job
if %batch_exists_true% == 0 echo  3) Start Batch Job
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


:batch_add_links_added
set /p batch_link_tmp=Paste Link:
echo.
if "%batch_link_tmp%" equ "0" goto batch_manage
echo %batch_link_tmp%>>"%loc%\%job_name%\%job_name%.txt"
goto batch_add_links_added


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
if %youtube% == 1 goto batch_ytmp4
if %youtube% == 0 echo.
echo ---------------------------------
echo  Select Quality
echo ---------------------------------
echo.
echo  0) GO BACK
echo.
echo  1) Highest Quality
echo.
echo  2) Lowest Quality
echo.
echo ---------------------------------
choice /c 012 /n /m "Choose Quality: "
if %errorlevel% == 1 goto batch_manage
if %errorlevel% == 2 set conf=-f best
if %errorlevel% == 3 set conf=-f worst
if %errorlevel% == 255 goto batch_download
goto batch_ytdownload


:batch_ytmp4
mode con:cols=60 lines=32
color 07
title Choose Stream
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo   (0) GO BACK
echo.
echo ---------------
echo  Video + Audio
echo ---------------
echo   (1) - 360p   (If not available, returns to 240p)
echo   (2) - 480p   (If not available, returns to 360p)
echo   (3) - 720p   (If not available, returns to 480p)
echo   (4) - 1080p  (If not available, returns to 720p)
echo   (5) - 1440p  (If not available, returns to 1080p)
echo   (6) - 4K     (If not available, returns to 1440p)
echo   (7) - 8K     (If not available, returns to 4K)
echo --------------
echo   Audio Only
echo --------------
echo   (8) - M4A 128Kb/s
echo   (9) - MP3 128Kb/s
echo -------------------
choice /c 0123456789 /n /m "Enter Choice (0-9): "
if %errorlevel% == 1 goto batch_manage
if %errorlevel% == 2 set conf="-f bestvideo[ext=mp4][height<=360]+bestaudio[ext=m4a]"
if %errorlevel% == 3 set conf="-f bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]"
if %errorlevel% == 4 set conf="-f bestvideo[ext=mp4][height<=720]+bestaudio[ext=m4a]"
if %errorlevel% == 5 set conf="-f bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]"
if %errorlevel% == 6 set conf="-f bestvideo[height<=1440]+bestaudio[ext=m4a]"
if %errorlevel% == 7 set conf="-f bestvideo[height<=2160]+bestaudio[ext=m4a]"
if %errorlevel% == 8 set conf="-f bestvideo[height<=4320]+bestaudio[ext=m4a]"
if %errorlevel% == 9 set conf=--add-metadata --embed-thumbnail -f bestaudio[ext=m4a]
if %errorlevel% == 10 set conf=--add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k
if %errorlevel% == 255 goto batch_ytmp4
goto batch_ytdownload


:batch_ytdownload
set "try="
set try=%try_count%


:batch_ytdownloadtried
mode con:cols=60 lines=32
color 0B
title Downloading
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo  Starting Download
echo -------------------
echo.
youtube-dl.exe --ignore-errors --no-warnings %conf% -o "%loc%\%job_name%\%%(title)s-%%(height)sp.%%(ext)s" -a "%loc%\%job_name%\%job_name%.txt" && goto batch_downloadsuccess
set /a try=%try%+1
if %try% GTR %defined_try% goto batch_error
goto batch_ytdownloadtried


:batch_error
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
echo  TIP: Enable rechecks in settings if you have a bad network.
echo.
echo  Press enter to try again
pause>NUL
goto batch


:batch_downloadsuccess
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
echo  Press enter to do it again.
pause>NUL
goto batch


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
echo  0) GO BACK
echo.
echo  1) Change Download Folder
echo     Currently: %loc%
echo.
echo  2) No. of Rechecks
echo     Currently: %defined_try%
echo.
echo  3) Update youtube-dl (fixes most issues)
echo.
echo  4) Reset AYC
echo.
echo -----------------------------------
echo.
choice /c 01234 /n /m "Select Option: "
if %errorlevel% == 1 goto more
if %errorlevel% == 2 goto settings_change_dir
if %errorlevel% == 3 goto settings_change_defined_try
if %errorlevel% == 4 goto update
if %errorlevel% == 5 goto reset
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
title Update youtube-dl
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  Checking currently installed version:
youtube-dl --version
echo.
echo  You need administrator permission to update.
echo  Run AYC as administrator if this fails.
echo  Press enter to check for updates.
pause>NUL
echo.
echo  Checking for updates..
youtube-dl -U
echo.
echo  Press Enter to go back.
pause>NUL
goto settings


:reset
mode con:cols=60 lines=32
color 04
title Reset AYC
cls
echo ------------------------------------------------------------
echo                 Advanced Youtube Client - AYC 
echo.
echo                      %version%
echo ------------------------------------------------------------
echo.
echo  You are about to reset AYC to it's default settings.
echo.
echo  This should fix any issues caused by incorrect or corrupted settings.
echo.
echo ------------------------
echo.
echo  0. GO BACK
echo.
echo  1. Reset and Exit AYC
echo.
echo ------------------------
choice /C 012 /n /m "Choose option (0-1): "
if %errorlevel% == 1 goto settings
rd /s /q "%aycdata%"
title Reset Succesfully
cls
echo.
echo.
echo  AYC reset succesfully.
echo.
timeout /t 5 /nobreak
exit


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
echo   Advanced Youtube Client - AYC Script
echo.
echo   Author           : Adithya S Sekhar
echo.
echo   First Release    : v1.0 (13/Aug/2016)
echo.
echo   Current Release  : %version%
echo.
echo   Released under the MIT License.
echo.
echo.
echo   Press Enter to go back.
pause>NUL
goto more


:exit
exit

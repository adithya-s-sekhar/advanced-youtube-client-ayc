@echo off

set ayc.arg1=%1

:: /----------------------------------------------------------/
:: /----------------------------------------------------------/
:: / Advanced Youtube Client - AYC Script                     /
:: / Author          : Adithya S Sekhar                       /
:: / First Release   : v1.0 (13/Aug/2016)                     /
:: / Current Release : v4.1 (24/Jun/2023)                    /
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

call linkValidator "%url%"
if %link_validator% == 0 goto start

echo %url%| findstr /i /r /c:"^https://www.youtube.com"
if %errorlevel% == 0 goto regular
echo %url%| findstr /i /r /c:"^https://m.youtube.com"
if %errorlevel% == 0 goto regular
echo %url%| findstr /i /r /c:"^https://youtube.com"
if %errorlevel% == 0 goto regular
echo %url%| findstr /i /r /c:"^https://youtu.be"
if %errorlevel% == 0 goto regular
echo %url%| findstr /i /r /c:"^http://www.youtube.com"
if %errorlevel% == 0 goto regular
echo %url%| findstr /i /r /c:"^http://m.youtube.com"
if %errorlevel% == 0 goto regular
echo %url%| findstr /i /r /c:"^http://youtube.com"
if %errorlevel% == 0 goto regular
echo %url%| findstr /i /r /c:"^http://youtu.be"
if %errorlevel% == 0 goto regular
set uni_url=%url%
set pass_to_uni=1
goto uni


:start
mode %window_medium%
color 07
set "url="
title Saving to %loc%
cls
call tui bannerMedium
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
if "%url%" equ "b" goto quickKeyRedirector
if "%url%" equ "B" goto quickKeyRedirector
if "%url%" equ "m" goto quickKeyRedirector
if "%url%" equ "M" goto quickKeyRedirector
if "%url%" equ "s" goto quickKeyRedirector
if "%url%" equ "S" goto quickKeyRedirector

call linkValidator "%url%"
if %link_validator% == 1 (
    set show_quickkey=0
    set url_invalid=0
    start AYClient.bat "%url%"
) else (
    set show_quickkey=1
    set url_invalid=1
)
goto start

:quickKeyRedirector
set show_quickkey=0
set url_invalid=0
if "%url%" equ "b" start AYClient.bat "b"
if "%url%" equ "B" start AYClient.bat "b"
if "%url%" equ "m" call moreMenu
if "%url%" equ "M" call moreMenu
if "%url%" equ "s" call settingsMenu
if "%url%" equ "S" call settingsMenu
goto start


:regular
call downloader regular
if %regular_download_status% == 1 (
    goto downloadSuccess
) else (
    goto error
)


:uni
call uniHome
if %uni_download_status% == 1 (
    goto downloadSuccess
) else (
    goto error
)


:batch
call downloader batch
if %batch_download_status% == 1 (
    goto downloadSuccess
) else (
    goto error
)


:error
mode %window_small%
color 4F
title Download Failed!
cls
call tui bannerSmall
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
if %error_mode% == batch (
    echo  Press enter to try again.
) else (
    echo  Press enter to close this window.
)
pause>NUL
if %error_mode% == batch goto batch
if %error_mode% == uni goto exit
if %error_mode% == regular goto exit


:downloadSuccess
mode %window_small%
color 2F
title Download Finished
cls
call tui bannerSmall
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


:exit
exit

@echo off

set ayc.arg1=%1
set ayc.arg2=%2

:: /----------------------------------------------------------/
:: /----------------------------------------------------------/
:: / Advanced Youtube Client - AYC Script                     /
:: / Author          : Adithya S Sekhar                       /
:: / First Release   : v1.0 (13/Aug/2016)                     /
:: / Current Release : v4.3 (01/Jul/2023)                    /
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


:checkParameter
if %ayc.arg1%p equ p goto start
if %ayc.arg1% equ "b" goto batch
if %ayc.arg1% equ "B" goto batch
set url=%ayc.arg1%
set url=%url:"=%
if %ayc.arg2% == "reg" goto regular
if %ayc.arg2% == "uni" (
    set uni_url=%url%
    goto uni
)


:start
mode %window_medium%
color 07
set "url="
title Saving to %loc%
cls
call tui bannerMedium
echo.
echo Enter ^(m^) for more options.
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

if %link_validator% == 0 (
    set show_quickkey=1
    set url_invalid=1
    goto start
)

if %youtube_link% == 1 (
    start AYClient.bat "%url%" "reg"
) else (
    start AYClient.bat "%url%" "uni"
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
call regular
if %regular_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:uni
call uni
if %uni_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:batch
call batch
if %batch_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:exit
exit

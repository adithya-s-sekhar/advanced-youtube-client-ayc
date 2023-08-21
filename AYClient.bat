@echo off

set ayc.arg1=%1
set ayc.arg2=%2
set ayc.arg3=%3

:: /----------------------------------------------------------/
:: /----------------------------------------------------------/
:: / Advanced Youtube Client - AYC Script                     /
:: / Author          : Adithya S Sekhar                       /
:: / First Release   : v1.0 (13/Aug/2016)                     /
:: / Current Release : v4.7 (05/Aug/2023)                    /
:: / Released under the MIT License.                          /
:: / Please don't modify or redistribute without              /
:: / proper credits.                                          /
:: /----------------------------------------------------------/
:: /----------------------------------------------------------/

set path=%path%;%cd%\bin;%cd%\scripts

:begin
call envsetup
call custom
mode %window_medium%
color 07
cls


:checkParameter
if not defined ayc.arg3 goto checkParameter2
if %ayc.arg3% equ "1" set cookie_loaded=0 && call :toggleCookie
:checkParameter2
if %ayc.arg1%p equ p goto start
if %ayc.arg1% equ "b" goto batch
if %ayc.arg1% equ "B" goto batch
set url=%ayc.arg1%
set url=%url:"=%
if %ayc.arg2% == "reg" goto regular
if %ayc.arg2% == "uni" goto uni
if %ayc.arg2% == "bili" goto bili


:start
mode %window_medium%
color 07
set "url="
title Saving to %loc%
cls
call tui bannerMedium
echo.
if %cookie_loaded% == 1 (
    echo INFO: cookies.txt loaded. Enter ^(c^) to unload cookie.
    echo.
)
if exist cookies.txt if %cookie_loaded% == 0 (
    echo INFO: cookies.txt detected but not loaded. Enter ^(c^) to load cookie.
    echo.
)
echo Enter ^(m^) for more options.
echo.
echo Paste any Video/Playlist/Channel URL or QuickKey and press Enter.
echo.
if %url_invalid% == 1 (
    echo %url_validation_msg%
    echo.
)
if %show_quickkey% == 1 (
    echo Available QuickKeys: ^(b^) - Batch Mode ^(s^) - Settings ^(c^) - Load/Unload cookies.txt
    echo.
)
if %no_cookie_found% == 1 (
    echo Error: cookies.txt not present.
    echo.
)
set /p url=">> "
for /f "tokens=1 delims=&" %%a in ("%url%") do (
  set url=%%a
)
set url=%url: =%

set no_cookie_found=0

if "%url%" equ "" set show_quickkey=1 && goto start
if "%url%" equ " =" set show_quickkey=1 && goto start
if "%url%" equ "b" goto quickKeyRedirector
if "%url%" equ "B" goto quickKeyRedirector
if "%url%" equ "m" goto quickKeyRedirector
if "%url%" equ "M" goto quickKeyRedirector
if "%url%" equ "s" goto quickKeyRedirector
if "%url%" equ "S" goto quickKeyRedirector
if "%url%" equ "c" goto quickKeyRedirector
if "%url%" equ "C" goto quickKeyRedirector

call linkValidator "%url%"

if %link_validator% == 0 (
    set show_quickkey=1
    set url_invalid=1
    goto start
)

if %youtube_link% == 1 start AYClient.bat "%url%" "reg" "%cookie_loaded%"
if %bilibili_link% == 1 start AYClient.bat "%url%" "bili" "%cookie_loaded%"
if %generic_link% == 1 start AYClient.bat "%url%" "uni" "%cookie_loaded%"
set show_quickkey=0
set url_invalid=0
goto start


:quickKeyRedirector
set show_quickkey=0
set url_invalid=0
if "%url%" equ "b" start AYClient.bat "b" dummy "%cookie_loaded%"
if "%url%" equ "B" start AYClient.bat "b" dummy "%cookie_loaded%"
if "%url%" equ "m" call moreMenu
if "%url%" equ "M" call moreMenu
if "%url%" equ "s" call settingsMenu
if "%url%" equ "S" call settingsMenu
if "%url%" equ "c" call :toggleCookie
if "%url%" equ "C" call :toggleCookie
goto start


:toggleCookie
if %cookie_loaded% == 0 (
    if not exist cookies.txt set no_cookie_found=1 && goto :EOF
    call cookieLoader load
    goto :EOF
)
if %cookie_loaded% == 1 (
    call cookieLoader unload
    goto :EOF
)


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


:bili
call bilibili
if %bilibili_download_status% == 1 (
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

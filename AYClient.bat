@echo off

set ayc.arg1=%1
set ayc.arg2=%2
set ayc.arg3=%3

:: /----------------------------------------------------------/
:: /----------------------------------------------------------/
:: / Advanced Youtube Client - AYC Script                     /
:: / Author          : Adithya S Sekhar                       /
:: / Released under the MIT License.                          /
:: / Please don't modify or redistribute without              /
:: / proper credits.                                          /
:: /----------------------------------------------------------/
:: /----------------------------------------------------------/

set path=%path%;%cd%\bin;%cd%\scripts

:begin
call envsetup
call custom


:checkParameter
if not defined ayc.arg3 goto checkParameter2
if %ayc.arg3% equ "1" set cookie_loaded=0 && call toggleCookie
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
call tui windowSize %medium_width% 23
color 07
set "url="
title Saving to %loc%
cls
call tui bannerMedium
echo.
echo  - Enter ^(m^) for more options.
echo.
echo  - Paste any Video/Playlist/Channel URL or QuickKey and press Enter.
echo.
echo  - Example QuickKeys: ^(b^) - Batch Mode ^(s^) - Settings ^(c^) - Load/Unload cookies.txt
echo.
if %no_cookie_found% == 1 (
    echo  ! Error: cookies.txt not present in ayc folder.
    echo.
)
if %cookie_loaded% == 1 (
    echo  ! Info: cookies.txt loaded. Enter ^(c^) to unload cookie.
    echo.
)
if exist cookies.txt if %cookie_loaded% == 0 (
    echo  ! Info: cookies.txt detected but not loaded. Enter ^(c^) to load cookie.
    echo.
)
if %url_invalid% == 1 (
    echo  ! %url_validation_msg%
    echo.
)
set /p url=">> "
for /f "tokens=1 delims=&" %%a in ("%url%") do (
  set url=%%a
)
set url=%url: =%

set no_cookie_found=0

if "%url%" equ "" goto start
if "%url%" equ " =" goto start

call linkValidator "%url%"
if %link_validator% == 1 goto linkValid

call quickKeyRedirector "%url%"
if %quickkey_validator% == 0 (
    set url_invalid=1
    goto start
)


:linkValid
if %youtube_link% == 1 start AYClient.bat "%url%" "reg" "%cookie_loaded%"
if %bilibili_link% == 1 start AYClient.bat "%url%" "bili" "%cookie_loaded%"
if %generic_link% == 1 start AYClient.bat "%url%" "uni" "%cookie_loaded%"
set url_invalid=0
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

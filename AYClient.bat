@echo off
setlocal enabledelayedexpansion

:: Advanced Youtube Client - AYC
:: Copyright (C) 2023  Adithya S Sekhar
::
:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.
::
:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <https://www.gnu.org/licenses/>.

set ayc.arg1=%1
set ayc.arg2=%2
set ayc.arg3=%3

set aycroot=%cd%
set path=%path%;%aycroot%\resources\bin;%aycroot%\resources\scripts

:begin
call envsetup
call custom
if not defined ayc.arg1 if %ytupd_onstart% == 1 start yt-dlpUpdatePopup


:checkParameter
if not defined ayc.arg3 goto checkParameter2
if %ayc.arg3% equ "1" set cookie_loaded=0 && call toggleCookie
:checkParameter2
if %ayc.arg1%p equ p goto start
if %ayc.arg1% equ "b" goto batch
if %ayc.arg1% equ "B" goto batch
set url=%ayc.arg1%
set url=%url:"=%
if %ayc.arg2% == "youtube" goto youtube
if %ayc.arg2% == "ytsearch" goto ytsearch
if %ayc.arg2% == "generic" goto generic
if %ayc.arg2% == "bili" goto bili
if %ayc.arg2% == "twitch" goto twitch


:start
call tui windowSize %medium_width% 23
color %theme_colors%
set "url="
title Saving to %loc%
cls
call tui bannerMedium
echo.
echo  - Enter ^(m^) for more options.
echo.
echo  - Paste any URL or search term or QuickKey and press Enter.
echo.
if %aria2_status% == 0 echo  - Multithreaded downloads ^(a^): Disabled
if %aria2_status% == 1 echo  - Multithreaded downloads ^(a^): Enabled for non-youtube downloads
if %aria2_status% == 2 echo  - Multithreaded downloads ^(a^): Enabled for all downloads
echo.
echo  - Example QuickKeys: ^(o^) - Open downloads, ^(c^) - Load/Unload cookies.txt
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
set /p url="ayc:/> "
for /f "tokens=1 delims=&" %%a in ("%url%") do (
  set url=%%a
)

if "%url%" equ "" goto start
if "%url%" equ " =" goto start

set "cleaner_count=0"

:cleaner_loop
if "!url:~%cleaner_count%,1!"==" " (
    set /a "cleaner_count+=1"
    goto :cleaner_loop
)

set "url=!url:~%cleaner_count%!"

set no_cookie_found=0

call linkValidator "%url%"
if %link_validator% == 1 goto linkValid

call quickKeyRedirector "%url%"

if %quickkey_validator% == 0 (
    set youtube_link=1
    start AYClient.bat "%url%" "ytsearch" "%cookie_loaded%"
)
goto start


:linkValid
if %youtube_link% == 1 start AYClient.bat "%url%" "youtube" "%cookie_loaded%"
if %bilibili_link% == 1 start AYClient.bat "%url%" "bili" "%cookie_loaded%"
if %twitch_link% == 1 start AYClient.bat "%url%" "twitch" "%cookie_loaded%"
if %generic_link% == 1 start AYClient.bat "%url%" "generic" "%cookie_loaded%"
set url_invalid=0
goto start


:youtube
call youtube
if %youtube_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:ytsearch
call ytsearch
if %youtube_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:generic
call generic
if %generic_download_status% == 1 (
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

:twitch
call twitch
if %twitch_download_status% == 1 (
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
endlocal
exit

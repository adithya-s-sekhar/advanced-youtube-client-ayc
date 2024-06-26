@echo off

:: Advanced Youtube Client - AYC
:: Copyright (C) 2024  Adithya S Sekhar
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
if not defined ayc.arg1 if /i %ytupd_onstart% == 1 start yt-dlpUpdatePopup


:checkParameter
if not defined ayc.arg3 goto checkParameter2
if /i %ayc.arg3% equ "1" set cookie_loaded=0 & call toggleCookie
:checkParameter2
if /i %ayc.arg1%p equ p goto start
if /i %ayc.arg1% equ "b" goto batch
set url=%ayc.arg1%
set url=%url:"=%
if /i %ayc.arg2% == "youtube" goto youtube
if /i %ayc.arg2% == "ytsearch" goto ytsearch
if /i %ayc.arg2% == "generic" goto generic
if /i %ayc.arg2% == "bili" goto bili
if /i %ayc.arg2% == "twitch" goto twitch


:start
call tui windowSize %medium_width% 23
color %theme_colors%
set cleaner_input=null
set url=null
title Saving to %loc%
cls
call tui bannerMedium
echo.
echo  - Enter ^(m^) for more options.
echo.
echo  - Paste any URL or search term or QuickKey and press Enter.
echo.
if /i %aria2_status% == 0 echo  - Multithreaded downloads ^(a^): Disabled
if /i %aria2_status% == 1 echo  - Multithreaded downloads ^(a^): Enabled for non-youtube downloads
if /i %aria2_status% == 2 echo  - Multithreaded downloads ^(a^): Enabled for all downloads
echo.
echo  - QuickKeys: ^(o^) - Open downloads, ^(c^) - Load/Unload cookies.txt, ^(b^) - Batch mode
echo.
if /i %no_cookie_found% == 1 (
    echo  ! Error: cookies.txt not present in ayc folder.
    echo.
)
if /i %cookie_loaded% == 1 (
    echo  ! Info: cookies.txt loaded. Enter ^(c^) to unload cookie.
    echo.
)
if exist cookies.txt if /i %cookie_loaded% == 0 (
    echo  ! Info: cookies.txt detected but not loaded. Enter ^(c^) to load cookie.
    echo.
)
if /i %url_invalid% == 1 (
    echo  ! %url_validation_msg%
    echo.
)

call cleaner "input"
set /p cleaner_input="ayc:/> "

call cleaner "dq"
if /i "%cleaner_input%" equ "null" goto start
if /i "%cleaner_input%" equ "" goto start
if /i "%cleaner_input%" equ " =" goto start
call cleaner "lws"
if not defined cleaner_input goto start
call cleaner "tws"
if not defined cleaner_input goto start
set url=%cleaner_input%

set no_cookie_found=0

call linkValidator "%url%"
if /i %link_validator% == 1 goto linkValid

call quickKeyRedirector "%url%"

if /i %quickkey_validator% == 0 (
    set youtube_link=1
    start AYClient.bat "%url%" "ytsearch" "%cookie_loaded%"
)
goto start


:linkValid
if /i %youtube_link% == 1 start AYClient.bat "%url%" "youtube" "%cookie_loaded%"
if /i %bilibili_link% == 1 start AYClient.bat "%url%" "bili" "%cookie_loaded%"
if /i %twitch_link% == 1 start AYClient.bat "%url%" "twitch" "%cookie_loaded%"
if /i %generic_link% == 1 start AYClient.bat "%url%" "generic" "%cookie_loaded%"
set url_invalid=0
goto start


:youtube
call youtube
if /i %youtube_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:ytsearch
call ytsearch
if /i %youtube_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:generic
call generic
if /i %generic_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:bili
call bilibili
if /i %bilibili_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit

:twitch
call twitch
if /i %twitch_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:batch
call batch
if /i %batch_download_status% == 1 (
    call downloadSuccess
) else (
    call downloadError
)
goto exit


:exit
exit

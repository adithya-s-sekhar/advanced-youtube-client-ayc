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

:batchAddLinks
call tui windowSize %small_width% 36
color %theme_colors%
title Leave blank and Enter to go back.
cls
call tui bannerSmall
echo.
echo  Paste each url and press enter, the links will be added to 
echo  your list.
echo.
echo  Leave blank and Enter to go back.
echo.
call tui borderSmallHalf
echo.

:batchAddLinksLoop
call cleaner "input"
set /p cleaner_input=Paste Link: 

call cleaner "dq"
if /i "%cleaner_input%" equ "null" goto :EOF
call cleaner "ws"
if /i "%cleaner_input%" equ "" goto :EOF
if /i "%cleaner_input%" equ " =" goto :EOF

set batch_link_tmp=%cleaner_input%

call linkValidator "%batch_link_tmp%"
if /i %link_validator% == 1 (
    goto batchAddLinksLoop2
) else (
    echo %url_validation_msg%
    echo.
    goto batchAddLinksLoop
)

:batchAddLinksLoop2
if /i %job_type% == 1 if not %youtube_link% == 1 (
    echo ERROR: Invalid link. This is a Youtube only Job.
    echo.
    echo Change job type to Regular to add non-youtube links.
    echo.
    goto batchAddLinksLoop
)
if /i %job_type% == 2 if not %bilibili_link% == 1 (
    echo ERROR: Invalid link. This is a Bilibili only Job.
    echo.
    echo Change job type to Regular to add non-bilibili links.
    echo.
    goto batchAddLinksLoop
)
if /i %job_type% == 3 if not %twitch_link% == 1 (
    echo ERROR: Invalid link. This is a Twitch only Job.
    echo.
    echo Change job type to Regular to add non-twitch links.
    echo.
    goto batchAddLinksLoop
)
echo %batch_link_tmp%>>"%loc%\%job_name%\%job_name%.txt"
set /a batch_link_counter=%batch_link_counter%+1
echo Link Saved.
echo.
goto batchAddLinksLoop

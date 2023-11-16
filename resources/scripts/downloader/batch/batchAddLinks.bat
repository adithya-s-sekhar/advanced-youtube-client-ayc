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
set batch_link_tmp=null
set /p batch_link_tmp=Paste Link: 

set batch_link_tmp=%batch_link_tmp:"=%
if "%batch_link_tmp%" equ "null" goto :EOF
if "%batch_link_tmp%" equ "" goto :EOF
for /f "tokens=1 delims=&" %%a in ("%batch_link_tmp%") do (
  set batch_link_tmp=%%a
)
set batch_link_tmp=%batch_link_tmp:"=%
if "%batch_link_tmp%" equ "" goto :EOF
if "%batch_link_tmp%" equ " =" goto :EOF

:cleaner_check
if "%batch_link_tmp:~0,1%"==" " goto cleaner_clean
goto cleaner_exit

:cleaner_clean
set "batch_link_tmp=%batch_link_tmp:~1%"
goto cleaner_check

:cleaner_exit
if not defined batch_link_tmp goto :EOF

call linkValidator "%batch_link_tmp%"
if %link_validator% == 1 (
    goto batchAddLinksLoop2
) else (
    echo %url_validation_msg%
    echo.
    goto batchAddLinksLoop
)

:batchAddLinksLoop2
if %job_type% == 1 if not %youtube_link% == 1 (
    echo ERROR: Invalid link. This is a Youtube only Job.
    echo.
    echo Change job type to Regular to add non-youtube links.
    echo.
    goto batchAddLinksLoop
)
if %job_type% == 2 if not %bilibili_link% == 1 (
    echo ERROR: Invalid link. This is a Bilibili only Job.
    echo.
    echo Change job type to Regular to add non-bilibili links.
    echo.
    goto batchAddLinksLoop
)
if %job_type% == 3 if not %twitch_link% == 1 (
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

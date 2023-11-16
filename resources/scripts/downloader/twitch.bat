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

set twitch_download_status=0
:qualitySelector
title Link Recieved
if %cookie_loaded% == 1 (
    call tui windowSize %small_width% 34
) else (
    call tui windowSize %small_width% 32
)
color %theme_colors%
cls
call tui bannerSmall
echo.
echo  URL: %url%
echo.
echo  Twitch link detected.
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  Format: .MP4 (H264 Video/AAC Audio)
echo.
call tui borderSmall
echo  Choose Maximum Quality
echo.
echo   (1) - 360p 
echo   (2) - 480p   (If not available, returns to 360p) 
echo.
call tui borderSmall
echo.
echo   (3) - 720p   (If not available, returns to 480p) 
echo   (4) - 1080p  (If not available, returns to 720p) 
echo.
call tui borderSmall
echo.
echo   (5) - Show all available formats
echo         Use this if the above doesn't work.
echo.
call tui borderSmallHalf
echo.
choice /c 12345 /n /m "Select Option (1-5): "
if %errorlevel% == 1 set conf="-f best[height<=360]" & goto download
if %errorlevel% == 2 set conf="-f best[height<=480]" & goto download
if %errorlevel% == 3 set conf="-f best[height<=720]" & goto download
if %errorlevel% == 4 set conf="-f best[height<=1080]" & goto download
if %errorlevel% == 5 goto twitchCustomFormat


:twitchCustomFormat
call tui windowSize %large_width% 500
color %theme_colors%
title Select Format
cls
call tui bannerLarge
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
%youtube_dl% %default_config% %cookies% -F "%url%" && goto twitchCustomFormatContinue
goto :EOF
:twitchCustomFormatContinue
echo.
call tui borderLargeHalf
echo.
echo Leave blank and press Enter to Go back.
echo.
call cleaner "input"
set /p cleaner_input=Choose ID (green color in the list above): 

call cleaner "dq"
if "%cleaner_input%" equ "null" goto qualitySelector
call cleaner "ws"
if "%cleaner_input%" equ "" goto qualitySelector
if "%cleaner_input%" equ " =" goto qualitySelector

set twitch_custom_qual=%cleaner_input%

set conf="-f %twitch_custom_qual%"
goto download


:download
set "try="
set try=1
set conf=%conf:"=%
if %aria2_status% == 1 set aria2=--external-downloader aria2c

:downloadTried
call tui windowSize %small_width% 36
color %theme_colors%
title Downloading: Attempt %try% out of %max_try% (%defined_try% retries)
cls
call tui bannerSmall
echo.
echo  Starting Download: Attempt %try% out of %max_try% (%defined_try% retries)
echo.
call tui borderSmallHalf
echo.
echo  URL: %url%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
%youtube_dl% %default_config% %conf% %aria2% %subs% %thumbs% -P home:"%loc%" -o "%%(title).182s-%%(height).4sp-%%(id).11s.%%(ext)s" %custom_config_twitch% %cookies% "%url%" && set twitch_download_status=1 & goto :EOF
set /a try=%try%+1
if %try% GTR %max_try% set twitch_download_status=0 & goto :EOF
goto downloadTried

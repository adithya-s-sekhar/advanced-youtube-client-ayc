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

set yt_updated=0
set yt_no_update=0
call tui windowSize %small_width% 23
title Update yt-dlp
color %theme_colors%
cls
call tui bannerSmall
echo.
echo  Current yt-dlp version: Please wait.
echo.
call tui borderSmall
echo.
for /f %%i in ('yt-dlp --version') do set youtube_dl_version=%%i
echo %youtube_dl_version%>"%aycdata%\youtube_dl_version.txt"
:update
set tmp_youtube_dl_version=0
if %yt_updated% == 0 call tui windowSize %small_width% 23
if %yt_updated% == 0 if %yt_no_update% == 1 call tui windowSize %small_width% 25
if %yt_updated% == 1 call tui windowSize %small_width% 25
color %theme_colors%
cls
call tui bannerSmall
echo.
if %yt_updated% == 0 if %yt_no_update% == 0 echo  Current yt-dlp version: %youtube_dl_version%
if %yt_updated% == 0 if %yt_no_update% == 1 (
    echo  No new version found. Try Nightly.
    echo.
    echo  Current yt-dlp version: %youtube_dl_version%
)
if %yt_updated% == 1 (
    echo  Updated successfully.
    echo.
    echo  Current yt-dlp version: %youtube_dl_version%
)
echo.
call tui borderSmall
echo.
echo  (0) - Back
echo.
echo  (1) - Update to latest Stable
echo.
echo  (2) - Update to latest Nightly (Fast fixes for issues)
echo.
echo  (3) - Check yt-dlp updates on start
if %ytupd_onstart% == 0 echo        [Disabled]
if %ytupd_onstart% == 1 echo        [Enabled]
echo.
call tui borderSmallHalf
echo.
choice /c 0123 /n /m "Select Option (0-3): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 call :ytUpdateStable & goto update
if %errorlevel% == 3 call :ytUpdateNightly & goto update
if %errorlevel% == 4 call settingsToggles YtUpdateOnStart & goto update


:ytUpdateStable
set yt_updated=0
echo.
echo Updating to latest stable
echo.
%youtube_dl% --update-to stable@2023.11.14 > nul
:: you can't downgrade from nightly without targetting a specifig tag
%youtube_dl% --update-to stable > nul
:: now update to latest stable
set tmp_youtube_dl_version=%youtube_dl_version%
for /f %%i in ('yt-dlp --version') do set youtube_dl_version=%%i
echo %youtube_dl_version%>"%aycdata%\youtube_dl_version.txt"
if not %tmp_youtube_dl_version% == %youtube_dl_version% set yt_updated=1
if %tmp_youtube_dl_version% == %youtube_dl_version% set yt_no_update=1
goto :EOF

:ytUpdateNightly
set yt_updated=0
echo.
echo Updating to latest nightly
echo.
%youtube_dl% --update-to nightly  > nul
set tmp_youtube_dl_version=%youtube_dl_version%
for /f %%i in ('yt-dlp --version') do set youtube_dl_version=%%i
echo %youtube_dl_version%>"%aycdata%\youtube_dl_version.txt"
if not %tmp_youtube_dl_version% == %youtube_dl_version% set yt_updated=1
if %tmp_youtube_dl_version% == %youtube_dl_version% set yt_no_update=1
goto :EOF

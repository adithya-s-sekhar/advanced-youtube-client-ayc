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

:qualitySelector
title Choose Quality
if /i %cookie_loaded% == 1 (
    call tui windowSize %small_width% 34
) else (
    call tui windowSize %small_width% 32
)
color %theme_colors%
cls
call tui bannerSmall
echo.
echo  Working on: %job_name%
echo.
echo  Job Type: Twitch only
echo.
if /i %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo  Format: .MP4 (H264 Video/AAC Audio)
echo.
echo  (0) - Back
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
choice /c 012345 /n /m "Select Option (0-5): "
if /i %errorlevel% == 1 goto :EOF
if /i %errorlevel% == 2 set format_chosen=twitch & set conf="-f best[height<=360]" & set batch_name_end=360p & goto :EOF
if /i %errorlevel% == 3 set format_chosen=twitch & set conf="-f best[height<=480]" & set batch_name_end=480p & goto :EOF
if /i %errorlevel% == 4 set format_chosen=twitch & set conf="-f best[height<=720]" & set batch_name_end=720p & goto :EOF
if /i %errorlevel% == 5 set format_chosen=twitch & set conf="-f best[height<=1080]" & set batch_name_end=1080p & goto :EOF
if /i %errorlevel% == 6 set format_chosen=twitch & set conf="custom" & goto :EOF

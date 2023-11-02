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

:formatSelector
if %cookie_loaded% == 1 (
    call tui windowSize %small_width% 40
) else (
    call tui windowSize %small_width% 38
)
color %theme_colors%
title Choose format
cls
call tui bannerSmall
echo.
echo  Working on: %job_name%
echo.
echo  Job Type: Youtube only
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
echo   (0) - Back
echo.
echo  Choose format
call tui borderSmall
echo  Video + Audio
echo.
echo   (1) - MP4 Video/AAC Audio (Upto 1080p) (Recommended)
echo.
echo   (2) - VP9 Video/OPUS Audio (Upto 4K)
echo.
echo   (3) - AV1 Video/OPUS Audio (Upto 8K)
echo.
call tui borderSmall
echo  Audio Only
echo.
echo   (4) - M4A  - AAC Audio  - 128kbps
echo.
echo   (5) - MP3  - MP3 Audio  - 128kbps
echo.
echo   (6) - WEBM - OPUS Audio - 160kbps
echo.
call tui borderSmall
echo.
echo   (7) - Choose a custom format from sample url
echo.
call tui borderSmallHalf
echo.
choice /c 01234567 /n /m "Select Option (0-7): "
if %errorlevel% == 1 goto :EOF
if %errorlevel% == 2 set format_chosen=h264 && goto qualitySelector
if %errorlevel% == 3 set format_chosen=vp9 && goto qualitySelector
if %errorlevel% == 4 set format_chosen=av1 && goto qualitySelector
if %errorlevel% == 5 set format_chosen=aud && set conf="-f bestaudio[ext=m4a]" && goto :EOF
if %errorlevel% == 6 set format_chosen=aud && set conf="--extract-audio --audio-format mp3 --no-post-overwrites --audio-quality 128k" && goto :EOF
if %errorlevel% == 7 set format_chosen=aud && set conf="-f bestaudio[ext=webm]" && set "thumbs=" && goto :EOF
if %errorlevel% == 8 set conf="custom" && goto :EOF

:qualitySelector
if %format_chosen% == h264 if %cookie_loaded% == 1 call tui windowSize %small_width% 30
if %format_chosen% == h264 if %cookie_loaded% == 0 call tui windowSize %small_width% 28
if %format_chosen% == vp9 if %cookie_loaded% == 1 call tui windowSize %small_width% 35
if %format_chosen% == vp9 if %cookie_loaded% == 0 call tui windowSize %small_width% 33
if %format_chosen% == av1 if %cookie_loaded% == 1 call tui windowSize %small_width% 36
if %format_chosen% == av1 if %cookie_loaded% == 0 call tui windowSize %small_width% 34
color %theme_colors%
if %format_chosen% == h264 title  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == vp9 title  Format: .MP4 (VP9 Video/OPUS Audio)
if %format_chosen% == av1 title  Format: .MP4 (AV1 Video/OPUS Audio)
cls
call tui bannerSmall
echo.
echo  Working on: %job_name%
echo.
if %cookie_loaded% == 1 (
    echo  Using cookies.txt.
    echo.
)
if %format_chosen% == h264 echo  Format: .MP4 (H264 Video/AAC Audio)
if %format_chosen% == vp9 echo  Format: .MP4 (VP9 Video/OPUS Audio)
if %format_chosen% == av1 echo  Format: .MP4 (AV1 Video/OPUS Audio)
echo.
echo   (0) - Back
echo.
call tui borderSmall
echo  Choose Maximum Quality
echo.
echo   (1) - 144p 
echo   (2) - 240p   (If not available, returns to 144p) 
echo   (3) - 360p   (If not available, returns to 240p) 
echo.
call tui borderSmall
echo.
echo   (4) - 480p   (If not available, returns to 360p) 
echo   (5) - 720p   (If not available, returns to 480p) 
echo   (6) - 1080p  (If not available, returns to 720p) 
echo.
if NOT %format_chosen% == h264 call tui borderSmall
if NOT %format_chosen% == h264 echo.
if NOT %format_chosen% == h264 echo   (7) - 1440p  (If not available, returns to 1080p)
if NOT %format_chosen% == h264 echo   (8) - 4K     (If not available, returns to 1440p)
if %format_chosen% == av1 echo   (9) - 8K     (If not available, returns to 4K)
if not %format_chosen% == h264 echo.
call tui borderSmallHalf
if %format_chosen% == vp9  goto choiceVp9
if %format_chosen% == av1  goto choiceAv1
echo.
choice /c 0123456 /n /m "Select Option (0-6): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=avc1][height<=144]+worstaudio[ext=m4a]" && goto :EOF
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=avc1][height<=240]+worstaudio[ext=m4a]" && goto :EOF
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=avc1][height<=360]+bestaudio[ext=m4a]" && goto :EOF
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=avc1][height<=480]+bestaudio[ext=m4a]" && goto :EOF
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=avc1][height<=720]+bestaudio[ext=m4a]" && goto :EOF
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=avc1][height<=1080]+bestaudio[ext=m4a]" && goto :EOF

:choiceVp9
echo.
choice /c 012345678 /n /m "Select Option (0-8): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=vp09][height<=144]+worstaudio[ext=webm]" && goto :EOF
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=vp09][height<=240]+worstaudio[ext=webm]" && goto :EOF
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=vp09][height<=360]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=vp09][height<=480]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=vp09][height<=720]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=vp09][height<=1080]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 8 set conf="-f bestvideo[vcodec^=vp09][height<=1440]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 9 set conf="-f bestvideo[vcodec^=vp09][height<=2160]+bestaudio[ext=webm]" && goto :EOF

:choiceAv1
set error_format=av1
echo.
choice /c 0123456789 /n /m "Select Option (0-9): "
if %errorlevel% == 1 goto formatSelector
if %errorlevel% == 2 set conf="-f bestvideo[vcodec^=av01][height<=144]+worstaudio[ext=webm]" && goto :EOF
if %errorlevel% == 3 set conf="-f bestvideo[vcodec^=av01][height<=240]+worstaudio[ext=webm]" && goto :EOF
if %errorlevel% == 4 set conf="-f bestvideo[vcodec^=av01][height<=360]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 5 set conf="-f bestvideo[vcodec^=av01][height<=480]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 6 set conf="-f bestvideo[vcodec^=av01][height<=720]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 7 set conf="-f bestvideo[vcodec^=av01][height<=1080]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 8 set conf="-f bestvideo[vcodec^=av01][height<=1440]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 9 set conf="-f bestvideo[vcodec^=av01][height<=2160]+bestaudio[ext=webm]" && goto :EOF
if %errorlevel% == 10 set conf="-f bestvideo[vcodec^=av01][height<=4320]+bestaudio[ext=webm]" && goto :EOF
